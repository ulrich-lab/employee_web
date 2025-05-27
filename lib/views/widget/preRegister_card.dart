import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Models/pre_register_model.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/pre-register/pre_register_visitor_details.dart';

class PreRegisterCard extends StatelessWidget {
  const PreRegisterCard({
    Key? key,
    required this.item,
  
  }) : super(key: key);
  final Preregisters item;
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PreRegisterVisitorDetails(item: item,),duration: Duration(milliseconds: 400),
            transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: Container(
          height: 96,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColor.borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("./assets/images/avatar.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name??"",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColor.nameColor,
                          ),
                        ),
                        Text(
                          'expected_date'.tr + ': ' + item.expectedDate!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColor.hintColor,
                          ),
                        ),
                        Text(
                          'expected_time'.tr + ': ' + item.expectedTime!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColor.hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
