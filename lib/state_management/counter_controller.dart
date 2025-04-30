import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter =
      1.obs; // obs used for updating the variable, when the value got updated

  incrementCounter() {
    counter.value++;
  }
}
