import 'package:flutter/material.dart';
import 'package:untitled/pages/dialog/GenericDialog.dart';

Future<bool> showDeleteDialog(
  BuildContext context,
) {
  return showGenericDialog<bool>(
      context: context,
      title: 'Delete',
      content: 'Are you sure want to delete?',
      optionsBuilder: {
        'Delete': true,
        'Cancel': false,
      }).then((value) => value ?? false);
}
