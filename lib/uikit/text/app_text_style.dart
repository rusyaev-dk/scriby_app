import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/app_sizes.dart';

const _double57 = 57.0;
const _double45 = 45.0;
const _double36 = 36.0;
const _double32 = 32.0;
const _double28 = 28.0;
const _double24 = 24.0;
const _double22 = 22.0;
const _double11 = 11.0;

enum AppTextStyle {
  displayLarge(TextStyle(fontSize: _double57, height: 1.2)), // Примерно 57 / 64
  displayMedium(
      TextStyle(fontSize: _double45, height: 1.15)), // Примерно 45 / 52
  displaySmall(TextStyle(fontSize: _double36, height: 1.1)), // Примерно 36 / 44
  headlineLarge(
      TextStyle(fontSize: _double32, height: 1.1)), // Примерно 32 / 40
  headlineMedium(
      TextStyle(fontSize: _double28, height: 1.1)), // Примерно 28 / 36
  headlineSmall(
      TextStyle(fontSize: _double24, height: 1.1)), // Примерно 24 / 32
  titleLarge(TextStyle(fontSize: _double22, height: 1.1)), // Примерно 22 / 28
  titleMedium(TextStyle(
      fontSize: AppSizes.double16,
      fontWeight: FontWeight.w500,
      height: 1.1)), // Примерно 16 / 24
  titleSmall(TextStyle(
      fontSize: AppSizes.double14,
      fontWeight: FontWeight.w500,
      height: 1.1)), // Примерно 14 / 20
  labelLarge(TextStyle(
      fontSize: AppSizes.double14,
      fontWeight: FontWeight.w500,
      height: 1.1)), // Примерно 14 / 20
  labelMedium(TextStyle(
      fontSize: AppSizes.double12,
      fontWeight: FontWeight.w500,
      height: 1.1)), // Примерно 12 / 16
  labelSmall(TextStyle(
      fontSize: _double11,
      fontWeight: FontWeight.w500,
      height: 1.1)), // Примерно 11 / 16
  bodyLarge(
      TextStyle(fontSize: AppSizes.double16, height: 1.15)), // Примерно 16 / 24
  bodyMedium(
      TextStyle(fontSize: AppSizes.double14, height: 1.15)), // Примерно 14 / 20
  bodySmall(
      TextStyle(fontSize: AppSizes.double12, height: 1.15)); // Примерно 12 / 16

  final TextStyle value;

  const AppTextStyle(this.value);
}
