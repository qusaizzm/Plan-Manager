import 'package:flutter/material.dart';
import 'package:plan_manager/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    this.isValid = false,
  });
  final VoidCallback? onPressed;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 15.0),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(isValid
            ? AppThemeManager.primaryColor
            : AppThemeManager.secondaryTextColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Text(
        "Submit",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppThemeManager.primaryTextColorWhite,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
