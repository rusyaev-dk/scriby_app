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
          CustomIconButton(
            onPressed: () {},
            icon: Icons.table_chart,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.text_format,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.list,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.photo,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.draw,
          ),
        ],
      ),
    );
  }
}
