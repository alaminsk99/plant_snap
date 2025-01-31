
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/loaders/loaders.dart';
import 'package:plant_snap/data/repositories/plant_snap/plant_snap_repository.dart';
import 'package:plant_snap/models/plant_model.dart';

class PlantSnapHistoryController extends GetxController{
  static PlantSnapHistoryController get instance => Get.find();


  /// Variable
  final _historyRepository = PlantSnapRepository.instance;
  RxList<PlantModel> plants = <PlantModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    allHistory();
    super.onInit();
  }

  /// Load History

  Future<void> allHistory()async {
    try {
      // Show loader
      isLoading.value = true;
      // fetch all data

      final  data = await _historyRepository.fetchDataOfPlantsHistory();

      // update the data
      plants.assignAll(data);

    } catch (e) {
      isLoading.value = false;
      PLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

}