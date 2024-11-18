import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plan_manager/core/theme/app_colors.dart';

///
/// File: text_field.dart
///
/// Author: Qusai Alsimat
///
/// Date: March 21, 2024
///
/// **Description: This file contains the implementation of the AppTextFormField widget, for customized TextFormField widget with predefined styling.**
///

/// A customized TextFormField widget with predefined styling.
class AppTextFormField extends StatelessWidget {
  /// Constructs an `AppTextFormField`.
  ///
  /// Parameters:
  ///
  /// - `contentPadding`: The padding around the text field's content.
  ///
  /// - `focusedBorder`: The border to display when the text field is focused.
  ///
  /// - `enabledBorder`: The border to display when the text field is enabled but not focused.
  ///
  /// - `inputTextStyle`: The text style of the input text.
  ///
  /// - `hintStyle`: The text style of the hint text.
  ///
  /// - `hintText`: The hint text to display when the text field is empty.
  ///
  /// - `isObscureText`: Whether the text field hides the entered text.
  ///
  /// - `suffixIcon`: The icon to display at the end of the text field.
  ///
  /// - `backgroundColor`: The background color of the text field.
  ///
  /// - `controller`: The controller for the text field.
  ///
  /// - `validator`: The validation function for the text field.
  ///
  /// - `onChanged`: Callback function that is called when the text field's value changes.
  ///
  /// - `keyboardType`: The type of keyboard to display.
  ///
  /// - `focusNode`: The focus node that controls the focus behavior of this widget.
  ///
  /// - `onTap`: Callback function that is called when the text field is tapped.
  ///
  /// - `readOnly`: Whether the text field is read-only.
  ///
  /// - `textInputAction`: The type of action button to display on the keyboard.
  ///
  /// - `onFieldSubmitted`: Callback function that is called when the user submits the form.
  ///
  /// - `onEditingComplete`: Callback function that is called when editing is complete.
  ///
  /// - `autovalidateMode`: The mode for automatically validating fields.
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.onChanged,
    this.keyboardType,
    this.focusNode,
    this.onTap,
    this.readOnly,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLength,
    this.onEditingComplete,
    this.autovalidateMode,
    this.prefixIcon,
    this.isValid = false,
    this.labelText,
    this.validationMessage,
    this.labelStyle,
    this.inputFormatters,
    this.enabledBorderColors,
    this.leadingGap,
    this.gapBetween,
  });

  /// The padding around the text field's content.
  final EdgeInsetsGeometry? contentPadding;

  /// The border to display when the text field is focused.
  final InputBorder? focusedBorder;

  /// The border to display when the text field is enabled but not focused.
  final InputBorder? enabledBorder;

  /// The text style of the input text.
  final TextStyle? inputTextStyle;

  /// The text style of the hint text.
  final TextStyle? hintStyle;

  /// The text style of the label text.
  final TextStyle? labelStyle;

  /// The hint text to display when the text field is empty.
  final String? hintText;

  /// The label text to display when the text field is empty.
  final String? labelText;

  /// Whether the text field hides the entered text.
  final bool? isObscureText;

  /// The icon to display at the front of the text field.
  final Widget? prefixIcon;

  /// The icon to display at the end of the text field.
  final Widget? suffixIcon;

  /// The background color of the text field.
  final Color? backgroundColor;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// The validation function for the text field.
  final Function(String?) validator;

  /// Callback function that is called when the text field's value changes.
  final Function(String?)? onChanged;

  /// The type of keyboard to display.
  final TextInputType? keyboardType;

  /// The focus node that controls the focus behavior of this widget.
  final FocusNode? focusNode;

  /// Callback function that is called when the text field is tapped.
  final void Function()? onTap;

  /// Whether the text field is read-only.
  final bool? readOnly;

  /// The type of action button to display on the keyboard.
  final TextInputAction? textInputAction;

  /// Callback function that is called when the user submits the form.
  final void Function(String)? onFieldSubmitted;

  /// The maximum number of characters allowed in the text field.
  final int? maxLength;

  /// Callback function that is called when editing is complete.
  final void Function()? onEditingComplete;

  /// The mode for automatically validating fields.
  final AutovalidateMode? autovalidateMode;

  /// The above code is declaring a nullable boolean variable named `isValid` in Dart. The `?` after the
  /// `bool` type indicates that the variable can be `null`.
  final bool? isValid;

  /// The above Dart code snippet is declaring a final nullable String variable named
  /// `validationMessage`. This variable can hold a String value or be null.
  final String? validationMessage;

  /// The above Dart code is declaring a final variable `inputFormatters` of type
  /// `List<TextInputFormatter>` which can hold a list of `TextInputFormatter` objects. The `?` indicates
  /// that the variable can be `null` or have a value.
  final List<TextInputFormatter>? inputFormatters;
  final Color? enabledBorderColors;
  final double? leadingGap;
  final double? gapBetween;

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      autovalidateMode: autovalidateMode,
      onEditingComplete: onEditingComplete,
      maxLength: maxLength ?? 100,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      onTap: onTap,
      textInputAction: textInputAction ?? TextInputAction.next,
      readOnly: readOnly ?? false,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        counterText: "",
        isDense: true,
        contentPadding: contentPadding,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColors ??
                    AppThemeManager.textFieldBorderFouceColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                  color: enabledBorderColors ??
                      AppThemeManager.textFieldBorderColor,
                  width: 1.3),
              borderRadius: BorderRadius.circular(10.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodySmall,
        hintText: hintText,
        label: hintText == null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  labelText ?? "",
                  style: labelStyle ?? Theme.of(context).textTheme.bodySmall,
                ),
              )
            : null,
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: suffixIcon,
              ),
        suffixIconConstraints: const BoxConstraints(),
        fillColor: backgroundColor ?? AppThemeManager.textFieldBackgroundColor,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value) {
        return validator(value);
      },
    );
  }
}

class CustomInputFormatter extends TextInputFormatter {
  // Add " " between latters Like = [A B C D E]
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    debugPrint(text);
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    text = text.replaceAll(" ", "");
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i < (text.length - 1)) buffer.write(" ");
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
