import 'package:get/get.dart';
import 'package:mobile_test_task/database/models/update_information_model.dart';
import 'package:mobile_test_task/database/network/Enumerations/body_type.dart';
import 'package:mobile_test_task/database/network/Enumerations/http_method.dart';
import 'package:mobile_test_task/database/network/network_service.dart';

class UpdateInformationRepository {

  Future update(UpdateInformationModel updateModel) async {
    
    var response = await Get.find<NetworkService>().sendRequest(
      'user/update',
      method: HttpMethod.post,
      body: updateModel.toJson(),
      bodyType: BodyType.formData,
    );
    if (response.status) {
      return response;
    }
  }
}
