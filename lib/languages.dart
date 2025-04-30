import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'What is your name',
          'name': 'Rahul',
        },
        'hi_IN': {
          'message': 'आपका क्या नाम है',
          'name': 'राहुल',
        },
      };
}
