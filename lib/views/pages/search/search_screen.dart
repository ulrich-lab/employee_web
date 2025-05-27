import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Controllers/visitor-controller.dart';

import 'package:visitor_pass/constants/constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => SearchPage()),
      child: Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SvgPicture.asset('./assets/new/search.svg'),
                  SizedBox(width: 12.w),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: IconButton(
                icon: SvgPicture.asset(
                  './assets/new/filter.svg',
                  height: 46,
                  width: 46,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchTextController = TextEditingController();

  // final TextEditingController clockInController = TextEditingController();
  final VisitorController visitorController = Get.put(VisitorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        controller: searchTextController,
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        cursorColor: AppColor.primaryColor,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 0, left: 15, right: 15),
                          hintText: 'search'.tr,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset('./assets/new/search.svg'),
                          ),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey[300],
                          ),
                          fillColor: Colors.red,
                          border: InputBorder.none,
                        ),
                        onFieldSubmitted: (value) {
                          visitorController
                              .getSearchedVisitors(searchTextController.text);
                          //add code
                        },
                        onChanged: (value) {
                          setState(() {
                            visitorController
                                .getSearchedVisitors(searchTextController.text);
                          });
                        },
                      ),
                    ),
                    Center(
                      child: IconButton(
                        icon: SvgPicture.asset(
                          './assets/new/filter.svg',
                          height: 46,
                          width: 46,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          visitorController
                              .getSearchedVisitors(searchTextController.text);
                          //add code
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 8, child: SizedBox())
          ],
        ),
      ),
    );
  }
}
