import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/main.dart';

class DopDownLang extends StatefulWidget {
  const DopDownLang({Key? key, required this.onChanged}) : super(key: key);
  final VoidCallback onChanged;

  @override
  State<DopDownLang> createState() => _DopDownLangState();
}

class _DopDownLangState extends State<DopDownLang> {
  String? selectedItem;

  List<String> list = [
    'french',
    'english',
  ];

  @override
  void initState() {
    super.initState();
    if (prefs.getString('lang') == "en") {
      selectedItem = 'english';
    } else {
      selectedItem = "french";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.70),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kWhiteColor.withOpacity(0.65), width: 1)),
        child: DropdownButton<String>(
          dropdownColor: AppColor.primaryColor,
          value: selectedItem ?? 'english',
          isExpanded: true,
          underline: Container(),
          iconDisabledColor: Colors.white,
          iconEnabledColor: Colors.white,
          onChanged: (String? newValue) async {
            setState(() {
              selectedItem = newValue;
            });

            if (newValue == "english") {
              setState(() {
                prefs.setString('lang', 'en');
                prefs.setString('langKey', 'US');
                prefs.setString('selectedValue', 'English');
                Get.updateLocale(const Locale('en', 'US'));
              });
            } else if (newValue == "french") {
              setState(() {
                prefs.setString('lang', 'fr');
                prefs.setString('langKey', 'FR');
                prefs.setString('selectedValue', 'France');
                Get.updateLocale(const Locale('fr', 'FR'));
              });
            }
             widget.onChanged();
          },
          items: list.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Row(
                children: [
                  const Icon(
                    Icons.language,
                    color: kWhiteColor,
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    option,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
