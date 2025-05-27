// import 'package:flutter/material.dart';
// import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:visitor_pass/Controllers/global-controller.dart';
// import 'package:visitor_pass/constants/constants.dart';
// import 'package:visitor_pass/views/pages/chat/create_group.dart';
// import 'package:visitor_pass/views/widget/cachedImage.dart';
// import 'package:visitor_pass/views/widget/shimer_widget.dart';

// class CreateGroupScreen extends StatelessWidget {
//   CreateGroupScreen({Key? key}) : super(key: key);
//   // final List<EmployeeModel> l;
//   final MultiSelectController<String> _controller = MultiSelectController();
//   ColleugueController colleugueController = Get.put(ColleugueController());
//   List<String> selectedElement=[];
//   @override
//   Widget build(BuildContext context) {
//     // final _items = CryptoModel.getCrypto();
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 2,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         onPressed: () => Get.back(),
//                         icon: Icon(Icons.arrow_back_ios_new_rounded),
//                       ),
//                       Text(
//                         "Membre du groupe",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 17),
//                       ),
//                       SizedBox(),
//                       SizedBox(),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12.w),
//                     child: Column(
//                       children: [
                       
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TextButton(
//                               onPressed: () {
//                                 _controller.deselectAll();
//                               },
//                               child: Text(
//                                 "Cancel",
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 _controller.selectAll();
//                               },
//                               child: Text(
//                                 "Select all",
//                                 style: TextStyle(color: Colors.blue),
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 8,
//               child: Obx(() {
//                 return colleugueController.isLoadingGetColleagueList.value
//                     ? ShimmerColumnWidget(
//                         itemWith: double.infinity,
//                         itemHeight: 50,
//                         shimmerHeight: 0.6.sh,
//                       )
//                     : MultiSelectCheckList<String>(
//                         textStyles: const MultiSelectTextStyles(
//                           selectedTextStyle: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         listViewSettings: ListViewSettings(
//                           separatorBuilder: (context, index) =>
//                               const Divider(height: 0),
//                         ),
//                         controller: _controller,
//                         items: List.generate(
//                           colleugueController.colleagueList.length,
//                           (index) => CheckListCard<String>(
//                             value: colleugueController.colleagueList[index].id
//                                 .toString(),
//                             title: Row(
//                               children: [
//                                 CachedImage(
//                                     width: 50,
//                                     height: 50,
//                                     imageUrl: colleugueController
//                                             .colleagueList[index].image ??
//                                         ""),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       colleugueController
//                                               .colleagueList[index].name ??
//                                           "",
//                                       style: TextStyle(
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     Text("Hi, i'm using VVIMS"),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             // subtitle:
//                             selectedColor: Colors.white,
//                             checkColor: AppColor.primaryColor,
//                             checkBoxBorderSide:
//                                 BorderSide(color: AppColor.primaryColor),
//                             decorations: MultiSelectItemDecorations(
//                               decoration: BoxDecoration(
//                                   color:
//                                       AppColor.primaryColor.withOpacity(0.1)),
//                               selectedDecoration: BoxDecoration(
//                                 color: AppColor.primaryColor.withOpacity(0.8),
//                               ),
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                           ),
//                         ),
//                         onChange: (allSelectedItems, selectedItem) {
//                           // print(selectedItem);
//                         selectedElement =   allSelectedItems;

//                           // selectedElement.a
//                         },
//                         onMaximumSelected: (allSelectedItems, selectedItem) {
//                         },
//                       );
//               }),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (selectedElement.isNotEmpty) {
//             // Get.off(()=>CreateGroup(l:selectedElement),);
//           }
//         },
//         child: Icon(Icons.arrow_forward),
//       ),
//     );
//   }
// }
