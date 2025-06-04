import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visitor_pass/constants/constants.dart';

class TextFieldBuilder extends StatefulWidget {
  final String name;
  final List<String? Function(String?)> validators;
  final TextAlign textAlign;
  final String? hint;
  final String? label;
  final String? initialValue;
  final bool seeEyesIcon;
  final bool? readOnly, autoFocus, visible;
  final bool enable, filled;
  final AutovalidateMode autovalidateMode;
  final Color? fillColor, focusBorderColor, obscureTextColor;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Function(String value)? onChange;
  final Function()? onTap;
  final Function(String v)? onActionClick;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputType keyboardType;
  final obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final int? minLines, maxLines;
  final FocusNode? focusNode;
  final double? borderRadius;
  final Color? hintColor;
  final Color? labelColor;
  final Color? contentColor;
  const TextFieldBuilder({
    Key? key,
    required this.name,
    this.textAlign = TextAlign.start,
    this.validators = const [],
    this.hint,
    this.contentColor,
    this.onTap,
    this.label,
    this.seeEyesIcon = true,
    this.enable = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChange,
    this.prefix,
    this.prefixIcon,
    this.onActionClick,
    this.textInputAction,
    this.floatingLabelBehavior,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.focusNode,
    this.readOnly,
    this.fillColor,
    this.filled = false,
    this.autoFocus = false,
    this.focusBorderColor,
    this.obscureTextColor,
    this.initialValue,
    this.borderRadius,
    this.hintColor,
    this.labelColor,
    this.visible,
  }) : super(key: key);

  @override
  _TextFieldBuilderState createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  bool _isObscure = true;

  BorderRadius getBorder() {
    return BorderRadius.only(
      topRight: Radius.circular(widget.borderRadius ?? 5),
      bottomRight: Radius.circular(widget.borderRadius ?? 5),
      topLeft: Radius.circular(widget.borderRadius ?? 5),
      bottomLeft: Radius.circular(widget.borderRadius ?? 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    var enabledBorder = OutlineInputBorder(
        borderRadius: getBorder(),
        borderSide: BorderSide(width: 1, color: AppColor.borderColor));

    var border = OutlineInputBorder(
        borderRadius: getBorder(),
        borderSide: BorderSide(
            width: 1, color: widget.focusBorderColor ?? AppColor.borderColor));

    var focusedBorder = OutlineInputBorder(
        borderRadius: getBorder(),
        borderSide: BorderSide(
            width: 1, color: widget.focusBorderColor ?? AppColor.borderColor));

    var errorBorder = OutlineInputBorder(
        borderRadius: getBorder(),
        borderSide: const BorderSide(width: 1, color: Colors.redAccent));

    return FormBuilderField(
      initialValue: widget.controller?.text,
      name: widget.name,
      // validator: FormBuilderValidators.compose(widget.validators),
      enabled: true,
      builder: (FormFieldState<dynamic> field) {
        return SizedBox(
          // height: 0.h,
          // width: size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.label != null)
                Column(
                  children: [
                    Text(
                      (widget.label ?? ""),
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              Container(
                height: 55.h,
                decoration: BoxDecoration(color: widget.contentColor),
                child: TextFormField(
                  
                  initialValue: widget.controller != null ? null : field.value,
                  obscuringCharacter: '*',
                  enabled: widget.visible ?? widget.enable,
                  readOnly: widget.readOnly ?? false,
                  onTap: widget.onTap,
                  onChanged: (value) {
                    field.didChange(value);
                    if (widget.onChange != null) widget.onChange!(value);
                  },
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  focusNode: widget.focusNode,
                  autocorrect: false,
                  controller: widget.controller,
                  autofocus: widget.autoFocus ?? false,
                  validator: (value) {
                    if (field.hasError) {
                      return "";
                    }
                    return null;
                  },
                  autovalidateMode: widget.autovalidateMode,
                  textInputAction:
                      widget.textInputAction ?? TextInputAction.none,
                  onFieldSubmitted: widget.onActionClick ?? (String val) {},
                  keyboardType: widget.keyboardType,
                  style: TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                  ),
                  obscureText: widget.obscureText ? _isObscure : false,
                  cursorColor: widget.focusBorderColor ?? Colors.grey,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: widget.textAlign,
                  decoration: InputDecoration(
                    suffixIcon: widget.obscureText
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _isObscure = !_isObscure;
                                print(_isObscure);
                              });
                            },
                            child: _isObscure
                                ? Visibility(
                                    visible: widget.seeEyesIcon,
                                    child: Container(
                                      width: 20,
                                      alignment: Alignment.centerRight,
                                      child: Center(
                                        child: SvgPicture.asset(
                                            './assets/icons/hide.svg',
                                            width: 20,
                                            color: const Color(0xFF18ba9b)),
                                      ),
                                    ),
                                  )
                                : Visibility(
                                    visible: widget.seeEyesIcon,
                                    child: Container(
                                      width: 20,
                                      alignment: Alignment.centerRight,
                                      child: Center(
                                        child: SvgPicture.asset(
                                            './assets/icons/eye.svg',
                                            width: 20,
                                            color: const Color(0xFF18ba9b)),
                                      ),
                                    ),
                                  ),
                          )
                        : SizedBox(
                            width: 20,
                            height: 65,
                          ),
                    fillColor: Colors.white,
                    filled: widget.filled,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    hintText:
                        widget.hint != null ? (widget.hint ?? '') : widget.hint,
                    alignLabelWithHint: true,
                    floatingLabelBehavior: widget.floatingLabelBehavior ??
                        FloatingLabelBehavior.auto,
                    prefixIcon: widget.prefixIcon,
                    prefix: widget.prefix,
                    errorStyle: TextStyle(
                        height: 0,
                        textBaseline: TextBaseline.alphabetic,
                        color: Colors.redAccent),
                    hintStyle: TextStyle(
                        color: widget.hintColor ?? Colors.grey[300],
                        textBaseline: TextBaseline.alphabetic,
                        fontWeight: FontWeight.w600
                        // height: 1
                        ),
                    errorMaxLines: 2,
                    focusedErrorBorder: errorBorder,
                    errorBorder: errorBorder,
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    border: border,
                    hintMaxLines: 1,
                  ),
                ),
              ),
              if (field.hasError)
                const SizedBox(
                  height: 5,
                ),
              if (field.hasError)
                Text(
                  field.errorText ?? '',
                  style: TextStyle(
                    color: Colors.redAccent,
                    // height: 1
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
