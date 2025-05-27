// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visitor_pass/constants/constants.dart';

class DashboardCard extends StatelessWidget {
  DashboardCard({
    Key? key,
    required this.icon,
    this.hours,
    required this.topic,
    required this.isCkockOut,
    this.isLate,
  }) : super(key: key);
  final String icon;
  final String? hours;
  final String topic;
  final bool isCkockOut;
  final bool? isLate;

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenSize(context).mainWidth > 640
                        ?ScreenSize(context).mainHeight / 4.7: ScreenSize(context).mainHeight / 6.7,
        width:ScreenSize(context).mainWidth > 640
                        ?0.20.sw: 0.45.sw,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 0.42.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              icon,
                              height: 18,
                              width: 18,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Text(isCkockOut ? 'Départ' : 'Arrivée'),
                    ],
                  ),
                  !isCkockOut
                      ? isLate == null
                          ? SizedBox()
                          : !isLate!
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.redAccent),
                                  child: Icon(
                                    Icons.close,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                )
                      : SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                hours ?? "--:--",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: isCkockOut ? Colors.red : Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                topic,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
