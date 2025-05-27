// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// class TextFieldPhone extends StatelessWidget {
//   const TextFieldPhone({
//     super.key,
//     required this.name,
//     this.validators = const [],
//     this.controller,
//     this.contryNameController,
//   });

//   final String name;
//   final List<String? Function(String?)> validators;
//   final TextEditingController? controller;
//   final TextEditingController? contryNameController;

//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderField(
//       initialValue: controller?.text,
//       name: name,
//       enabled: true,
//       builder: (FormFieldState<dynamic> field) {
//         return IntlPhoneField(
//           initialValue: controller?.text,
//           // controller: controller,
//           decoration: InputDecoration(
//             counterText: '',
//             labelText: "Phone number",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(color: Colors.grey[200]!),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(color: Colors.grey[200]!),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(color: Colors.grey[200]!),
//             ),
//             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
//           ),
//           style: const TextStyle(color: Colors.black),
//           initialCountryCode: "CM",
//           validator: (phone) {
//             for (var validate in validators) {
//               final error = validate(phone?.number ?? "");
//               if (error != null) {
//                 return error;
//               }
//             }
//             return null;
//           },
//           onChanged: (phone) {
//             // controller?.text = '${phone.countryCode}${phone.number}';
//             controller?.text = phone.number;

//             field.didChange('${phone.countryCode}${phone.number}');
//           },
//           onCountryChanged: (contry) {
//             contryNameController?.text = contry.name;
//           },
//         );
//       },
//     );
//   }
// }
