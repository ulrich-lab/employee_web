
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/utils/shared_pref.dart';
import 'package:visitor_pass/views/widget/custom_button.dart';
import 'package:visitor_pass/views/widget/textfield_builder_widget.dart';

import '../../Controllers/auth-controller.dart';
import '../../constants/constants.dart';
import '../../constants/size_config_data.dart';
import '../widget/loader.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.type}) : super(key: key);
  final String? type;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  bool isChecked = false;
  bool _isObscure = true;

//   bool gotKeyboardHeight = false;

//   @override
//   void initState() {
//     if (gotKeyboardHeight) return;

//     double keyboardSize = MediaQuery.of(context).viewInsets.bottom;
//     SharedPref.instance.setDouble('keyboardHeight', keyboardSize);

//     if (keyboardSize < 300) return;
//     gotKeyboardHeight = true;

//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    SizeConfigData sizeConfig = SizeConfigData();
    sizeConfig.init(context);
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (auth) => Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/ornament.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            "Login to your account by entering your email and password  below. Happy to see you back.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 40.h),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                widget.type ?? "",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  // color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 42,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                const SizedBox(
                                  height: 21,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'remember_me'.tr,
                                          style: TextStyle(
                                              color: AppColor.nameColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'forget password'.tr,
                                      style: TextStyle(
                                          color: AppColor.primaryColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                                /* Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size.fromHeight(60),
                                          backgroundColor: AppColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10), // <-- Radius
                                          ),
                                          // fromHeight use double.infinity as width and 40 is the height
                                        ),
                                        onPressed: () async {
                                          // if (_formKey.currentState!.validate()) {
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
                                        child: Text(
                                          "login".tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),*/
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
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                    ),
                  )
                ],
              ),
              auth.loader
                  ? Positioned(
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white60,
                          child: const Center(child: LoaderCircle())),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
