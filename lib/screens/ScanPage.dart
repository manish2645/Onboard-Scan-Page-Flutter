import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:onboard_member_scan/screens/Camera.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/');
                  },
                  child: const Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 40, 40, 40)),
                ),
            const Text("Scan",
            style: TextStyle(
              color: Color.fromARGB(255, 40, 40, 40),
              fontWeight: FontWeight.normal,
              fontFamily: 'Lato-Black',
              fontSize: 18,
            ),),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on,color: Color.fromARGB(255, 40, 40, 40),),
            onPressed: () {
              // Handle search button press
            },
          ),
        ]
      ),
      body: Container(
        child: CameraScreen(),
      ),
      bottomSheet: Container(

        child: const SizedBox(
          height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: null, 
                  icon: Icon(Icons.image, 
                  color: Color.fromARGB(255, 40, 40, 40), size: 50,)
                ),
                 IconButton(
                  onPressed: null, 
                  icon: Icon(Icons.camera_alt, 
                  color: Color.fromARGB(255, 40, 40, 40), size: 50,)
                ),
                 IconButton(
                  onPressed: null, 
                  icon: Icon(Icons.image, 
                  color: Color.fromARGB(255, 40, 40, 40), size: 50,)
                )
              ],
            )
          ),
      ),
    );
  }
}