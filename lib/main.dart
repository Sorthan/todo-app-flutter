import 'package:flutter/material.dart';
import 'package:todoapp/modules/Todo/index.dart';
import 'package:todoapp/modules/Home/index.dart';
import 'package:todoapp/modules/Security/index.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((view) {
    runApp(
      GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFCAEB7),
          brightness: Brightness.light,
          primaryColor: const Color(0xFFFFFFFF),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/home', page: () => const HomePage()),
          GetPage(name: '/security', page: () => SecurityPage()),
          GetPage(name: '/todo', page: () => TodoList())
        ],
      ),
    );
  });
}
