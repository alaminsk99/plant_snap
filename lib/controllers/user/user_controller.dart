

import 'package:get/get.dart';
import 'package:plant_snap/data/repositories/user/user_repository.dart';
import 'package:plant_snap/models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = UserRepository.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// fetch user Record
  Future<void>  fetchUserRecord()async{
    try{
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch (e){
      user(UserModel.empty());
    }
  }

}