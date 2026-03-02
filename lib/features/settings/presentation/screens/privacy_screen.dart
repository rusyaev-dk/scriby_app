import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Scaffold(
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              padding: EdgeInsetsDirectional.zero,
              leading: const Padding(
                padding: EdgeInsets.all(7),
                child: PopScreenButton(
                  iconSize: 25,
                ),
              ),
              middle: Text(
                "Privacy",
                style: textScheme.headline.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: colorScheme.onBackground,
                ),
              ),
              backgroundColor: colorScheme.settingsBackgroundColor,
            )
          : AppBar(
              forceMaterialTransparency: true,
              leading: const Padding(
                padding: EdgeInsets.all(7),
                child: PopScreenButton(
                  iconSize: 25,
                ),
              ),
              title: Text(
                "Privacy",
                style: textScheme.headline.copyWith(
                  fontSize: 25,
                  color: colorScheme.onBackground,
                ),
              ),
              toolbarHeight: 60,
              leadingWidth: 60,
            ),
      backgroundColor:
          Platform.isIOS ? colorScheme.settingsBackgroundColor : null,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Platform.isIOS
            ? const CupertinoActivityIndicator()
            : const CircularProgressIndicator(),
      ),
    );
  }
}
