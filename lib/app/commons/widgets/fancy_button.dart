import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:quiz/app/commons/style/text_style.dart';

class FancyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final IconData? icon;
  final double? buttonWidth;
  final bool enabled;
  final Color? buttonColor;
  final double? elevation;
  FancyButton(
      {this.buttonWidth,
      required this.title,
      this.buttonColor,
      this.enabled = true,
      required this.onPressed,
      this.icon,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: buttonWidth == 0.0 ? 0.0 : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor == null
              ? enabled
                  ? Colors.amber
                  : Colors.amber.withOpacity(0.3)
              : enabled
                  ? buttonColor
                  : buttonColor!.withOpacity(0.3)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: AppTextStyle.semiBoldStyle(
                      fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
