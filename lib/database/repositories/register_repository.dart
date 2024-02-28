import 'package:get/get.dart';
import 'package:mobile_test_task/database/models/register_model.dart';
import 'package:mobile_test_task/database/network/Enumerations/http_method.dart';
import 'package:mobile_test_task/database/network/network_service.dart';
import 'package:mobile_test_task/models/user_model.dart';
import '../network/Enumerations/body_type.dart';

class RegisterRepository {
  
  Future register(RegisterModel body) async {

    var response = await Get.find<NetworkService>().sendRequest(
      'user/register',
      method: HttpMethod.post,
      body: body.toJson(),
      bodyType: BodyType.formData,
    );

    if (response.status) {
      UserModel user = UserModel.fromJson(response.data);
      return user;
    }
  }
}
