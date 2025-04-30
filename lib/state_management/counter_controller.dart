import 'package:get/get.dart';

class CounterController extends GetxController {
  // Counter example
  RxInt counter =
      1.obs; // obs used for updating the variable, when the value got updated

  incrementCounter() {
    counter.value++;
  }

  // Slider example
  RxDouble opacity = 0.4.obs;

  setOpacity(double value) {
    opacity.value = value;
  }
}
