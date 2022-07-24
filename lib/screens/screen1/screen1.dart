import 'package:flutter/material.dart';

import 'components/screen1_body.dart' show Body;

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
      ),
      body: const Body(),
    );
  }
}
