// lib/services/plant_identification_service.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plant_snap/models/plant_model.dart';

import 'api_config.dart';

class PlantIdentificationService extends GetxController {
  static PlantIdentificationService get instance => Get.find();



  final String apiKey;
  final http.Client _client;

  PlantIdentificationService({
    required this.apiKey,
    http.Client? client,
  }) : _client = client ?? http.Client() {
    if (apiKey.isEmpty) {
      throw ArgumentError('API key cannot be empty');
    }
  }

  Future<PlantModel> identifyPlant(File imageFile) async {
    if (!await imageFile.exists()) {
      throw FileSystemException('Image file does not exist', imageFile.path);
    }

    int retryCount = 0;
    while (retryCount < ApiConfig.maxRetries) {
      try {
        final base64Image = base64Encode(await imageFile.readAsBytes());
        final response = await _sendApiRequest(base64Image)
            .timeout(ApiConfig.timeoutDuration);
        return _parsePlantResponse(response);
      } on TimeoutException {
        retryCount++;
        if (retryCount == ApiConfig.maxRetries) rethrow;
      } catch (e) {
        _logError('Error identifying plant', e);
        rethrow;
      }
    }
    throw Exception('Failed to identify plant after ${ApiConfig.maxRetries} attempts');
  }

  Future<http.Response> _sendApiRequest(String base64Image) async {
    final url = Uri.parse('${ApiConfig.baseUrl}?key=$apiKey');
    final payload = _constructPayload(base64Image);

    try {
      final response = await _client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      if (response.statusCode != 200) {
        throw HttpException(
          'API request failed with status code ${response.statusCode}: ${response.body}',
        );
      }

      return response;
    } catch (e) {
      _logError('Failed to send API request', e);
      rethrow;
    }
  }

  Map<String, dynamic> _constructPayload(String base64Image) {
    return {
      'contents': [
        {
          'parts': [
            {
              'text': '''
              Please identify this plant with the following details:
              - Common Name
              - Scientific Name
              - Description
              - Basic Care Instructions
              - Plant Family
              '''
            },
            {
              'inlineData': {
                'mimeType': 'image/jpeg',
                'data': base64Image,
              }
            }
          ],
        }
      ],
      'generationConfig': {
        'maxOutputTokens': 300,
        'temperature': 0.4,
        'topP': 1.0,
        'topK': 32,
      },
    };
  }

  PlantModel _parsePlantResponse(http.Response response) {
    try {
      final responseBody = jsonDecode(response.body);
      final plantText = _extractPlantText(responseBody);

      return PlantModel(
        name: _extractDetail(plantText, 'Common Name') ?? 'Unknown Plant',
        scientificName: _extractDetail(plantText, 'Scientific Name') ?? 'N/A',
        description: _extractDetail(plantText, 'Description') ?? 'No description available',
        careInstructions: _extractCareInstructions(plantText),
        imageUrl: '',
        // Make sure plantFamily can be null
        plantFamily: _extractDetail(plantText, 'Plant Family') ?? 'Unknown Family',
      );
    } catch (e) {
      _logError('Failed to parse response', e);
      throw FormatException('Invalid response format: $e');
    }
  }

  String _extractPlantText(Map<String, dynamic> responseBody) {
    final candidates = responseBody['candidates'];
    if (candidates == null || candidates.isEmpty) {
      throw Exception('No candidates found in response');
    }

    final content = candidates[0]['content'];
    if (content == null) {
      throw Exception('No content found in response');
    }

    final parts = content['parts'];
    if (parts == null || parts.isEmpty) {
      throw Exception('No parts found in response');
    }

    return parts[0]['text'] ?? '';
  }

  String? _extractDetail(String text, String detailType) {
    final pattern = RegExp(RegExp.escape(detailType) + r':\s*(.+?)(?=\n\*|\n$)',
      multiLine: true,
      dotAll: true
    );

    final match = pattern.firstMatch(text);
    return match?.group(1)?.trim();
  }

  List<String> _extractCareInstructions(String text) {
    final careSection = text.contains('Basic Care Instructions:')
        ? text.split('Basic Care Instructions:')[1].split('Plant Family:')[0]
        : '';

    return careSection
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();
  }

  void _logError(String message, Object error) {
    debugPrint('[$message] Error: $error');
  }

  void dispose() {
    _client.close();
  }
}
