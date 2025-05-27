import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/utils/get_access_token.dart';
import 'package:visitor_pass/views/pages/login.dart';
import 'package:visitor_pass/views/pages/onbording/user_type.dart';
import 'dot_indicator.dart';

class ThirdOnboardContent extends StatelessWidget {
  const ThirdOnboardContent(
      {super.key, required this.position, required this.controller});
  final double position;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(color: kSecondaryColor, width: 1.0),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(0)),
      iconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return kSecondaryColor;
        } else {
          return kSecondaryColor;
        }
      }),
    );
    return Scaffold(
      backgroundColor: AppColor.greyBck,
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Image.asset(
                "assets/new/car_onboard.png",
                height: 220.h,
                width: 199.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Spacer(),
          Column(
            children: [
              Container(
                width: 120,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
                decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => DotIndicator(
                      inActiveColor: const Color(0xFF969FAB).withOpacity(0.2),
                      isActive: index == position,
                    ),
                  ),
                ),
              ),
              Container(
                height: .37.sh,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  right: kDefaultPadding,
                  left: kDefaultPadding,
                  top: 8,
                  bottom: 28.h,
                ),
                margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      "Capture automatique de la plaque d'immatriculation du véhicule",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    const Text(
                      " Gérez les véhicules en scannant automatiquement les numéros de plaque d’immatriculation des véhicules et en gardant une trace de toutes les informations.",
                      textAlign: TextAlign.center,
                      //style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: buttonStyle,
                          icon: const Icon(Icons.arrow_back),
                        ),
                        FilledButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return kSecondaryColor;
                                } else {
                                  return kSecondaryColor;
                                }
                              }),
                            ),
                            onPressed: () {},
                            child: const Text("Scan Now")),
                        Transform.rotate(
                          angle: 3.15,
                          child: IconButton(
                            onPressed: () {
                              // saveAsSeen();
                              Get.to(() => UserType());
                            },
                            style: buttonStyle,
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
