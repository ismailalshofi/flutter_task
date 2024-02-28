import 'package:get/get.dart';
import 'package:mobile_test_task/database/models/change_password_model.dart';
import 'package:mobile_test_task/database/network/Enumerations/body_type.dart';
import 'package:mobile_test_task/database/network/Enumerations/http_method.dart';
import 'package:mobile_test_task/database/network/network_service.dart';

class ChangePasswordRepository {

  Future changePassword(ChangePasswordModel passwordModel) async {

    var response = await Get.find<NetworkService>().sendRequest(
      'user/changepassword',
      method: HttpMethod.post,
      body: passwordModel.toJson(),
      bodyType: BodyType.formData,
    );
    
    if (response.status) {
      return response;
    }
  }
}
