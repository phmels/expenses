import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  late final String label;
  late final TextEditingController controller;
  late final TextInputType? keyboardType;
  late final void Function(String) onSubmitted;

  AdaptativeTextField(
      {required this.controller,
      this.keyboardType,
      required this.onSubmitted,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            controller: controller,
            decoration: InputDecoration(labelText: label));
  }
}
