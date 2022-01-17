import 'package:flutter/material.dart';
import 'package:mobile/page/auth_page.dart';
import 'package:mobile/page/create_ifttt.dart';
import 'package:mobile/page/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const auth = auth_page();
    const settings = settings_page();
    const ifttt = create_ifttt();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          // child: auth.createState().build(context)
          // child: settings.createState().build(context)
            child: ifttt.createState().build(context)
        ),
      ),
    );
  }
}