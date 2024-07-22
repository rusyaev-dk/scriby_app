import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.onPressed,
    required this.text,
    this.width = 110,
    this.height = 45,
  });

  final void Function()? onPressed;
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer,
              ],
              stops: const [0.65, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTextScheme.of(context).label.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: ColorPalette.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
