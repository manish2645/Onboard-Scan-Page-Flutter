import 'dart:io';
import 'package:flutter/material.dart';

class CropImagesPage extends StatefulWidget {
  final List<String> imagePaths;

  const CropImagesPage({Key? key, required this.imagePaths}) : super(key: key);

  @override
  _CropImagesPageState createState() => _CropImagesPageState();
}


class _CropImagesPageState extends State<CropImagesPage> {
  int currentIndex = 0;

  void goToNextImage() {
    if (currentIndex < widget.imagePaths.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void goToPreviousImage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  Future _cropImage() async {
  // handle the crop funtions  
  }

  Future<void> handleDone() async {
    // Handle the "Done" button tap event
    // You can save the cropped image or perform any other desired action
    Navigator.pushNamed(context, '/convert');
  }
  Future<void> handleRetake() async {
    // Handle the "Done" button tap event
    // You can save the cropped image or perform any other desired action
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
                Navigator.pushNamed(context, '/scan');
              },
              child: const Icon(Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 40, 40, 40)),
            ),
            const Text(
              "Crop",
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
          GestureDetector(
            onTap: handleDone,
            child: Container(
              margin: const EdgeInsets.all(15),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 40, 40, 40)),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 40, 40, 40),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    fontFamily: 'Lato-Black',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.file(
                File(widget.imagePaths[currentIndex]),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 40, 40, 40)),
                  onPressed: goToPreviousImage,
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        '${currentIndex + 1}/${widget.imagePaths.length}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 40, 40, 40),
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: 'Lato-Black',
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 40, 40, 40)),
                  onPressed: goToNextImage,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: const Color.fromARGB(255, 40, 40, 40),
        child: SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/scan_page_retake_icon.png'),
                        onPressed: () {
                          handleRetake();
                        },
                      ),
                      const Text(
                        "Retake",
                        style: TextStyle(
                          fontFamily: 'Lato-Black',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/scan_page_crop_icon.png'),
                        onPressed: _cropImage
                      ),
                      const Text(
                        "Crop",
                        style: TextStyle(
                          fontFamily: 'Lato-Black',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
