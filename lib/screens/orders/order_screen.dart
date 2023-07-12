import 'package:flutter/material.dart';
import 'package:web_evaluation/constants/app_constants.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(orders),
      ),
    );
  }
}
