import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SpinKitCircle(color: Colors.black),
            ),
            const Text('Now loading...')
          ],
        ),
      ),
    );
  }
}
