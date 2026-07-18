import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const headline = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static const body = TextStyle(
    fontSize: 16,
    color: AppColors.text,
  );

  static const subtitle = TextStyle(
    fontSize: 15,
    color: AppColors.subtitle,
  );
}