import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visitor_pass/constants/constants.dart';

class SearchAutoCompleted extends StatelessWidget {
  const SearchAutoCompleted({
    super.key,
    required this.name,
    required this.listOfString,
    required this.isLoading,
    this.hint,
    this.textController,
    this.contentColor,
    this.onChanged,
    this.onSummit,
  });
  final String name;
  final List<String> listOfString;
  final TextEditingController? textController;
  final bool isLoading;
  final String? hint;
  final Function(String?)? onChanged;
  final Function(String?)? onSummit;
  final Color? contentColor;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      initialValue: textController?.text,
      name: name,
      enabled: true,
      builder: (FormFieldState<dynamic> field) {
        return Container(
          margin: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(color: contentColor),
          child: EasyAutocomplete(
            controller: textController,
            suggestions: listOfString,
            cursorColor: AppColor.primaryColor,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 24,
              ),
              labelText: hint,
              labelStyle: TextStyle(color: Colors.grey),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
            ),
            suggestionBuilder: (data) {
              return Container(
                margin: EdgeInsets.all(2.w),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  data,
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
            onChanged: (value) {
              // field.didChange(value);
              if (onChanged != null) {
                onChanged!(value);
              }
            },
            onSubmitted: (value) {
              field.didChange(value);
              if (onSummit != null) {
                onSummit!(value);
              }
            },
          ),
        );
      },
    );
  }
}
