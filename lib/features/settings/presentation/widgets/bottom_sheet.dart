import 'package:flutter/material.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      child: const Column(
        children: [
          Text("dsafasdfas"),
          Text("dsafasdfas"),
          Text("dsafasdfas"),
          Text("dsafasdfas"),
        ],
      ),
    );
  }
}
