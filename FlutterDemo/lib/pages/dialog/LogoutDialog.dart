import 'package:flutter/material.dart';
import 'package:untitled/pages/dialog/GenericDialog.dart';

Future<bool> showLogOutDialog(
  BuildContext context,
) {
  return showGenericDialog<bool>(
      context: context,
      title: 'Log Out',
      content: 'Are you sure want to logout?',
      optionsBuilder: {
        'Logout': true,
        'Cancel': false,
      }).then((value) => value ?? false);
}
