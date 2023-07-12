import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text(
              'Page Not Found',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
