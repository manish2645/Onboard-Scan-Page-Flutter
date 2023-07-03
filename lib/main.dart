import 'package:flutter/material.dart';
import 'package:onboard_member_scan/screens/Camera.dart';
import 'package:onboard_member_scan/screens/MemberPageScreen.dart';
import 'package:onboard_member_scan/screens/ScanPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnBoard Member Scan',
      initialRoute: '/',
      routes: {
        '/': (context) => const MemberScan(),
        '/scan':(context) => const ScanPage(),
        '/camera' : (context) => CameraScreen(),
      },
    );
  }
}

