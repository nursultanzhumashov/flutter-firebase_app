import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.widget,
    required this.widget2,
  }) : super(key: key);

  final Widget widget;
  final Widget widget2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          SizedBox(
              height: 280,
              width: 275,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget,
                const SizedBox(height: 28),
                  widget2,
                ],
              )),
        ]);
  }
}
