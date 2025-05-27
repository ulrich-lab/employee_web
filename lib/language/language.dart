import 'package:get/get.dart';
import 'package:visitor_pass/language/english.dart';
import 'package:visitor_pass/language/french.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
       
        'fr_FR': french,
         'en_US': english,
      };
}
