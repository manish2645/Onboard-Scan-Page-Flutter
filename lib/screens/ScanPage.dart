import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

late CameraController _controller;
late Future<void> _initializeControllerFuture;
bool _isFlashOn = false;
List<File> _imageFiles = [];
final picker = ImagePicker();
String imagePath = "NA";

class _ScanPageState extends State<ScanPage> {

  changeFlashMode() {
    setState(() {
      _isFlashOn = !_isFlashOn;
      }
    );
    if (_isFlashOn) {
      _controller.setFlashMode(FlashMode.torch);
    } else {
      _controller.setFlashMode(FlashMode.off);
    }
  }

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
                  Navigator.pushNamed(context, '/');
                },
                child: const Icon(Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 40, 40, 40)),
              ),
              const Text(
                "Scan",
                style: TextStyle(
                  color: Color.fromARGB(255, 40, 40, 40),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Lato-Black',
                  fontSize: 18,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Handle the button tap event
                changeFlashMode();
              },
              icon: Image.asset(
                'assets/scan_page_flash_icon.png',
                width: 24,
                height: 24,
              ),
            ),
          ]),
      body: Container(
        child: CameraScreenScan(),
      ),
    );
  }
}

class CameraScreenScan extends StatefulWidget {
  @override
  _CameraScreenScanState createState() => _CameraScreenScanState();
}

class _CameraScreenScanState extends State<CameraScreenScan> {

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      final camera = cameras.first;
      _controller = CameraController(camera, ResolutionPreset.high);
      _initializeControllerFuture = _controller.initialize().then((_) {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  clickImage() async {
    try {
      final image = await _controller.takePicture();
      setState(() {
      imagePath = image.path;
      }
    );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _pickImage() async {
    if (_imageFiles.length >= 3) {
      print('Maximum number of images reached.');
      return;
    }

    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _imageFiles.add(File(pickedImage.path));
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomSheet: Container(
        color: const Color.fromARGB(255, 40, 40, 40),
        child: SizedBox(
          height: 110,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Image.asset('scan_page_gallery_icon.png',height: 40,width: 40,)
              ),
              GestureDetector(
                onTap: () async {
                  await clickImage();
                  // try {
                  //   await _initializeControllerFuture;
                  //   final image = await _controller.takePicture();
                  // } catch (e) {
                  //   print('Error: $e');
                  // }
                },
                child: Image.asset('scan_page_gallery_icon.png',height: 40,width: 40,)
              ),
              GestureDetector(
                onTap: () {

                },
                child: Stack(
                  children: [
                  // Display the picked images
                  for (int i = 0; i < _imageFiles.length; i++)
                    Positioned(
                      left: i * 90.0, // Adjust the position of each image
                      child: Image.file(
                        _imageFiles[i],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  // Icon widget for display settings
                  Image.asset('scan_page_gallery_icon.png',height: 40,width: 40,)
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
