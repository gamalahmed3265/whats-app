import 'package:camera/camera.dart';
import 'package:revirew/constent.dart';
import 'package:revirew/screen/camera_screen.dart';
import 'package:revirew/screen/home_page.dart';
import 'package:flutter/material.dart';

// List<CameraDescription>? camers;

// void main() async {
// void main() {
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  camers = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "OpenSans",
          appBarTheme: const AppBarTheme(backgroundColor: accentColorg),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: accentColorg),
          primaryColor: accentColorg,
          iconTheme: const IconThemeData(
            color: accentColorg,
          )),
      home: MyHomePage(),
    );
  }
}
