import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Controllers/auth-controller.dart'
    show AuthController;
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/login.dart';
import 'package:visitor_pass/views/widget/custom_button.dart';
import 'package:visitor_pass/views/widget/textfield_builder_widget.dart'
    show TextFieldBuilder;

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  bool switch_to_login = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ScreenSize(context).mainWidth > 640 ? AppColor.primaryColor : null,
      body: SafeArea(
        child: ScreenSize(context).mainWidth > 640
            ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/ornament.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 7,
                        child: Center(
                            child: SvgPicture.asset(
                                './assets/icons/type_icon.svg'))),
                    // child: SizedBox(),

                    Flexible(
                      flex: 3,
                      child: Container(
                        height: 0.5.sh,
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.all(7.w),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: switch_to_login
                            ? GetBuilder<AuthController>(
                                init: AuthController(),
                                builder: (auth) => SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 21.h,
                                      ),
                                      TextFieldBuilder(
                                        name: "name",
                                        hint: "Email, Id or Phone",
                                        borderRadius: 30,
                                        controller: _emailController,
                                      ),
                                      SizedBox(height: 16.h),
                                      TextFieldBuilder(
                                        name: "name",
                                        hint: "password".tr,
                                        obscureText: true,
                                        borderRadius: 30,
                                        controller: _passwordController,
                                      ),
                                      SizedBox(
                                        height: 21.h,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'forget password'.tr,
                                          style: TextStyle(
                                              color: AppColor.primaryColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 26.h,
                                      ),
                                      CustomButton(
                                        onPressed: () async {
                                          if (_passwordController.text != "" &&
                                              _emailController.text != "") {
                                            auth.loginOnTap(
                                                login: _emailController.text
                                                    .toString()
                                                    .trim(),
                                                pass: _passwordController.text
                                                    .toString()
                                                    .trim());
                                          }
                                        },
                                        text: 'login',
                                        loading: auth.loader,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    onPressed: () {
                                      setState(() {
                                        switch_to_login = true;
                                      });
                                    },
                                    text: 'Admin',
                                  ),
                                  SizedBox(height: 16.h),
                                  CustomBorderButton(
                                    onPressed: () {
                                      setState(() {
                                        switch_to_login = true;
                                      });
                                    },
                                    text: 'Staff',
                                  ),
                                ],
                              ),
                      ),
                    )
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  SvgPicture.asset('./assets/icons/type_icon.svg'),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomButton(
                          onPressed: () {
                            Get.to(() => LoginPage(
                                  type: "Admin",
                                ));
                          },
                          text: 'Admin',
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomBorderButton(
                          onPressed: () {
                            Get.to(() => LoginPage(
                                  type: "Staff",
                                ));
                          },
                          text: 'Staff',
                        ),
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
