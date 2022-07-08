import 'package:flutter/material.dart';
import 'package:untitled/pages/dialog/GenericDialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
      context: context,
      title: 'An error occurred',
      content: text,
      optionsBuilder: {
        'OK': null,
      });
}
