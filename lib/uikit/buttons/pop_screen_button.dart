import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class PopScreenButton extends StatelessWidget {
  const PopScreenButton({
    super.key,
    this.callback,
    this.iconColor,
  });

  final void Function()? callback;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return IconButton(
      onPressed: () async {
        await AutoRouter.of(context).maybePop();
        if (callback != null) {
          callback!();
        }
      },
      icon: Icon(
        color: iconColor ?? colorScheme.onBackground,
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        size: 25,
      ),
    );
  }
}
