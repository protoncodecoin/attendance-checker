import 'package:flutter/material.dart';

showMsg(BuildContext context, String msg) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}
