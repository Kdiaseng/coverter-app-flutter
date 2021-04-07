import 'package:flutter/material.dart';

import 'app/views/home_view.dart';

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.amber, brightness: Brightness.dark),
      home: HomeView(),
    );
  }
}
