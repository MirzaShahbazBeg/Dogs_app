import 'package:flutter/material.dart';

import './myhomepage.dart';

void main() {
  runApp(const MyApp());
}

//live_y5w2bn4ED89r4g0ZEN2GXmCOogpEjlrkyrIMCJBgqawD3Jy7DCB20lJX33UYWUak
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
