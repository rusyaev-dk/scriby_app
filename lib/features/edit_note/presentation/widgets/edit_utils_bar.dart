import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class EditUtilsBar extends StatelessWidget {
  const EditUtilsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.table_chart,
              color: colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.text_format,
              color: colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.list,
              color: colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.photo,
              color: colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.draw,
              color: colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
