import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'My Order Screen',
        ),
      ),
    );
  }
}
