import 'package:camera/camera.dart';
import 'Screens/cameraScreen.dart';
import 'package:flutter/material.dart';
import 'Screens/homeScreen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "openSans",
        accentColor: Color(0xFF128C7E),
        primaryColor: Color(0xFF075E54),
      ),
      home: homeScreen(),
    );
  }
}
