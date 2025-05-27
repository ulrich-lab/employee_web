import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/onbording/components/drop_down_lang.dart';

import 'dot_indicator.dart';

class FirstOnboardContent extends StatefulWidget {
  const FirstOnboardContent(
      {super.key, required this.position, required this.controller});
  final double position;
  final PageController controller;

  @override
  State<FirstOnboardContent> createState() => _FirstOnboardContentState();
}

class _FirstOnboardContentState extends State<FirstOnboardContent> {
  String _selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Image.asset("assets/new/logo.png"),
            //const SizedBox(height: kDefaultPadding,),
            Text(
              "sys_desc".tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kWhiteColor.withOpacity(0.8),
                  fontWeight: FontWeight.normal),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => DotIndicator(isActive: index == widget.position),
              ),
            ),
            const Spacer(
              flex: 1,
            ),

            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //         horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            //     decoration: BoxDecoration(
            //         color: kSecondaryColor.withOpacity(0.70),
            //         borderRadius: BorderRadius.circular(8),
            //         border: Border.all(
            //             color: kWhiteColor.withOpacity(0.65), width: 1)),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         const Icon(
            //           Icons.language,
            //           color: kWhiteColor,
            //         ),
            //         // Matrix4.rotationX(radians)
            //         Text(
            //           'select_lang'.tr(),
            //           style: TextStyle(
            //             color: kWhiteColor,
            //           ),
            //         ),
            //         Transform(
            //           transform: Matrix4.identity()..rotateZ(4.75),
            //           alignment: Alignment.center,
            //           origin: const Offset(0, -6),
            //           child: const Icon(
            //             Icons.arrow_back_ios,
            //             color: kWhiteColor,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            DopDownLang(
              onChanged: () {
                widget.controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),

            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
