import 'package:flutter/material.dart';
import 'package:visitor_pass/views/pages/onbording/user_type.dart';

import 'components/first_onbord.dart';
import 'components/second_onbord.dart';
import 'components/third_onbord.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController controller;
  double currentPageValue = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewItem = [
      FirstOnboardContent(position: currentPageValue, controller: controller),
       UserType()
      // SecondOnboardContent(position: currentPageValue, controller: controller),
      // ThirdOnboardContent(position: currentPageValue, controller: controller)
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView.builder(
          itemCount: pageViewItem.length,
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemBuilder: (context, position) {
            return pageViewItem[position];
          },
        ),
      ),
    );
  }
}
