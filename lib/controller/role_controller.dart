import 'package:get/get.dart';

class RoleController extends GetxController {
  final RxBool isplayer = true.obs;

  bool get role => isplayer.value;

  void setRole({required bool isPlayer}) {
    isplayer.value = isPlayer;
  }
}
