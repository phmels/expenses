import 'dart:ffi';
import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  late final String label;
  late final void Function() onpressed;

  AdaptativeButton({required this.label, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: null,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : ElevatedButton(
            child: Text(label),
            onPressed: onpressed,
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
          );
  }
}
