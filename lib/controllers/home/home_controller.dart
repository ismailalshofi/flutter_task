import 'package:get/get.dart';
import 'package:mobile_test_task/database/local_data/shared_pref.dart';
import 'package:mobile_test_task/database/repositories/get_user_repository.dart';
import 'package:mobile_test_task/models/user_model.dart';
import 'package:mobile_test_task/view/widgets/custom_snack_bar.dart';

import '../../core/values/values.dart';

class HomeController extends GetxController with StateMixin<UserModel> {
  
  @override
  void onInit() {
    //
    // Call [get user] Api immediately after the HomeController is initialized.
    getUser();
    super.onInit();
  }

  Future<void> getUser() async {
    //
    // Get user_id from local storage.
    int userId = int.parse(getStringAsync('user_id'));
    //
    // Set state to Loading.
    change(null, status: RxStatus.loading());

    try {
      final value = await Get.find<GetUserRepository>().getUser(userId);
      //
      // Set state to Success.
      change(value, status: RxStatus.success());
    } catch (e) {
      //
      // Set state to Empty or Initial.
      change(null, status: RxStatus.empty());
      showSnackBar(AppText.someError, e.toString(), SnackbarType.error);
    }
  }
}
