import 'package:get/get.dart';
import 'package:mobile_test_task/database/network/Enumerations/http_method.dart';
import 'package:mobile_test_task/database/network/network_service.dart';

class DeleteUserRepository {

  Future deleteUser() async { 

    var response = await Get.find<NetworkService>().sendRequest('user/delete', method: HttpMethod.delete);
    
    if (response.status) {
      return response;
    }
  }
}