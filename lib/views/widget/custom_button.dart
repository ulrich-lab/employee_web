import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:visitor_pass/constants/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, required this.onPressed, required this.text, this.loading});
  final VoidCallback onPressed;
  final String text;
  bool? loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: loading ?? false
          ? Container(
              margin: EdgeInsets.all(2.w),
              width: ScreenSize(context).mainWidth > 640 ? 10.w : 40.w,
              height: ScreenSize(context).mainWidth > 640 ? 10.w : 40.h,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            )
          : Text(
              text.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
    );
  }
}

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton(
      {super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        side: BorderSide(
            color: AppColor.primaryColor.withOpacity(0.5),
            width: 2), // Bordure du bouton
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: AppColor.primaryColor, // Couleur du texte
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}

class CustomButtonCheck extends StatelessWidget {
  const CustomButtonCheck(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.background});
  final VoidCallback onPressed;
  final String text;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text.tr,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
