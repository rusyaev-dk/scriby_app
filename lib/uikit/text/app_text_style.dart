import 'package:flutter/material.dart';

enum AppTextStyle {
  displayLarge(TextStyle(
    fontSize: 57,
    height: 1.2,
  )),
  displayMedium(TextStyle(
    fontSize: 45,
    height: 1.15,
    fontFamily: "ProductSans",
  )),
  displaySmall(TextStyle(
    fontSize: 36,
    height: 1.1,
  )),
  headlineLarge(TextStyle(
    fontSize: 32,
    height: 1.1,
  )),
  headlineMedium(TextStyle(
    fontSize: 28,
    fontFamily: "ProductSans",
  )),
  headlineSmall(TextStyle(
    fontSize: 24,
    height: 1.1,
    fontFamily: "ProductSans",
  )),
  titleLarge(TextStyle(
    fontSize: 22,
    height: 1.1,
  )),
  titleMedium(TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.1,
  )),
  titleSmall(TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.1,
  )),
  labelLarge(TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.1,
  )),
  labelMedium(TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.1,
    fontFamily: "ProductSans",
  )),
  labelSmall(TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.1,
  )),
  bodyLarge(TextStyle(
    fontSize: 16,
    height: 1.15,
  )),
  bodyMedium(TextStyle(
    fontSize: 14,
    height: 1.15,
  )),
  bodySmall(TextStyle(
    fontSize: 12,
    height: 1.15,
  ));

  final TextStyle value;

  const AppTextStyle(this.value);
}
