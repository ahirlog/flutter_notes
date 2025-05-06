import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }

// static double averageRating(List<int> rating) {
//   double avgRating = 0;
//   for (int i = 0; i < rating.length; i++) {
//     avgRating = avgRating + rating[i];
//   }
//   return double.parse((avgRating / rating.length).toStringAsFixed(1));
// }

// static void flushBarErrorMessage(String message, BuildContext context) {
//   showFlushbar(
//     context: context,
//     flushbar: Flushbar(
//       forwardAnimationCurve: Curves.decelerate,
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.all(15),
//       message: message,
//       duration: const Duration(seconds: 3),
//       flushbarPosition: FlushbarPosition.TOP,
//       backgroundColor: Colors.red,
//       reverseAnimationCurve: Curves.easeInOut,
//       positionOffset: 20,
//       icon: const Icon(
//         Icons.error,
//         size: 28,
//         color: Colors.white,
//       ),
//     )..show(context),
//   );
// }
}
