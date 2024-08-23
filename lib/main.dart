
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Budget_Tracker/view/homeScreen.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        )
      ],
    );
  }
}
