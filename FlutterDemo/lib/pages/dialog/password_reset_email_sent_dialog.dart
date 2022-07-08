import 'package:flutter/cupertino.dart';
import 'package:untitled/pages/dialog/GenericDialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: 'Password Reset',
      content:
          'We have now sent you a password reset link. Please check your email for more information',
      optionsBuilder: {
        'OK': null,
      });
}
