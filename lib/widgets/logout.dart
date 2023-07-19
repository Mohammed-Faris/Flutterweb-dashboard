// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;

import '../constants/app_constants.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        logoutconfirmation,
        style: TextStyle(
          fontSize: fifteen,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: redcolor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(six),
                )),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(zero, sixteen, zero, sixteen),
              child: Text(cancel,
                  style: TextStyle(
                    fontSize: fifteen,
                  )),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: greencolor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(six),
                )),
            onPressed: () {
              html.window.localStorage.remove(authToken);

              context.go(loginroute);
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(zero, sixteen, zero, sixteen),
              child: Text(logout,
                  style: TextStyle(
                    fontSize: fifteen,
                  )),
            )),
      ],
    );
  }
}
