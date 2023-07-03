import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboard_member_scan/screens/CropImagesPage.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  late CameraController _controller;
  late Future<void> _initializeControllerFuture = Future.value();
  bool isCameraLoaded = false;

  Future<void> _initializeCamera() async {
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  _controller = CameraController(
    firstCamera,
    ResolutionPreset.ultraHigh,
      enableAudio: false,
  );
  _initializeControllerFuture = _controller.initialize();
  setState(() {
    isCameraLoaded = true;
  });
}


  bool _isFlashOn = false;
  bool cameraLoading = false;
  bool cameraError = false;
  List<File> _imageFiles = [];
  final picker = ImagePicker();
  List<String> imagePaths = [];


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
  void initState() {
    super.initState();
    // availableCameras().then((cameras) async{
    //   final camera = cameras.first;
    //   _controller = CameraController(camera, ResolutionPreset.high);
    //   _initializeControllerFuture = _controller.initialize().then((_) {
    //     setState(() {});
    //   });
    // });
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void clickImage() async {
  try {
    if (imagePaths.length >= 3) {
      Fluttertoast.showToast(
        msg: 'Maximum number of images reached.',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
      return;
    }

    final XFile? image = await _controller.takePicture();
    _isFlashOn = false;
    if (image != null) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Image Preview'),
            content: Image.file(
              File(image.path),
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    imagePaths.add(image.path);
                  });
                },
                child: const Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }
  } catch (e) {
    print(e);
  }
}



  Future<void> _pickImage() async {
  final pickedImages = await ImagePicker().pickMultiImage(
    imageQuality: 90,
    maxWidth: 800,
    maxHeight: 800,
  );

  if (pickedImages.length <= 3) {
    List<File> selectedFiles = [];

      for (var pickedImage in pickedImages) {
        final imageFile = File(pickedImage.path);
        selectedFiles.add(imageFile);
      }

      setState(() {
        _imageFiles = selectedFiles;
      }
    );
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
        child: Scaffold(
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
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Scan", style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255,),
                    fontFamily: 'Lato-Black',
                    fontSize: 16,
                    fontWeight: FontWeight.bold

                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pickImage();
                        },
                        child: Image.asset('assets/scan_page_gallery_icon.png', height: 60)
                      ),
                      GestureDetector(
                        onTap: () async {
                          clickImage();
                          _isFlashOn = false;
                        },
                        child: Image.asset('assets/scan_page_shutter_icon.png',height: 80,)
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CropImagesPage(imagePaths: imagePaths),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            // Stacked Images
                            ...imagePaths.map((path) {
                              return Positioned(
                                child: Image.file(
                                  File(path),
                                  height: 80,
                                  width: 60,
                                ),
                              );
                            }),
                            // Circular Counters
                            ...List.generate(imagePaths.length, (index) {
                              return Positioned(
                                top: 0,
                                left: 0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/scap_page_eclipse_icon.png', 
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      (index + 1).toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class CameraScreenScan extends StatefulWidget {
//   @override
//   _CameraScreenScanState createState() => _CameraScreenScanState();
// }

// class _CameraScreenScanState extends State<CameraScreenScan> {

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_controller);
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       bottomSheet: Container(
//         color: const Color.fromARGB(255, 40, 40, 40),
//         child: SizedBox(
//           height: 130,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("Scan", style: TextStyle(
//                 color: Color.fromARGB(255, 255, 255, 255,),
//                 fontFamily: 'Lato-Black',
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold

//               )),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       _pickImage();
//                     },
//                     child: Image.asset('assets/scan_page_gallery_icon.png', height: 60)
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       clickImage();
//                       _isFlashOn = false;
//                     },
//                     child: Image.asset('assets/scan_page_shutter_icon.png',height: 80,)
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CropImagesPage(imagePaths: imagePaths),
//                         ),
//                       );
//                     },
//                     child: Stack(
//                       children: [
//                         // Stacked Images
//                         ...imagePaths.map((path) {
//                           return Positioned(
//                             child: Image.file(
//                               File(path),
//                               height: 80,
//                               width: 60,
//                             ),
//                           );
//                         }),
//                         // Circular Counters
//                         ...List.generate(imagePaths.length, (index) {
//                           return Positioned(
//                             top: 0,
//                             left: 0,
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Image.asset(
//                                   'assets/scap_page_eclipse_icon.png', 
//                                   height: 20,
//                                   width: 20,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 Text(
//                                   (index + 1).toString(),
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;

  const ImagePreviewScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: Center(
        child: Image.file(
          File(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
