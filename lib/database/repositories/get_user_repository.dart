import 'package:get/get.dart';
import 'package:mobile_test_task/database/network/network_service.dart';
import 'package:mobile_test_task/models/user_model.dart';

class GetUserRepository {
  
  Future getUser(int userId) async {

    var response = await Get.find<NetworkService>().sendRequest('/user/$userId');
    
    if (response.status) {
      UserModel user = UserModel.fromJson(response.data);
      return user;
    }
  }
}
