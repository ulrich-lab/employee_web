import 'package:flutter/material.dart';
import 'package:visitor_pass/constants/constants.dart';

class EmptyScreen extends StatelessWidget {

  final String message;

  const EmptyScreen({
    super.key,
    required this.message,
  
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/empty_state.png"),
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // Text(
            //   title,
            //   style: TextStyle(
            //       fontSize: 20,
            //       color: AppColor.primaryColor,
            //       fontWeight: FontWeight.w700),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
