import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CameraScreen extends StatefulWidget {
  final String cameras;

  CameraScreen({this.cameras});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  bool isCapturing = false;

  @override
  void initState() {
    controller = CameraController(
      CameraDescription(
        name: "0",
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 90,
      ),
      ResolutionPreset.medium,
    );
    controller.initialize();
    super.initState();
  }

  Future<List<String>> _takePhoto() async {
    isCapturing = true;
    List<String> imagePaths = [];

    if (controller != null) {
      int count = 0;
      while (count < 3) {
        try {
          final tempDir = await getTemporaryDirectory();
          final path = join(
            tempDir.path,
            "${DateTime.now()}_${widget.cameras}_$count.png",
          );
          imagePaths.add(path);
          await controller.takePicture(path);
        } catch (e) {
          print(e);
        }
        count++;
      }
    }
    isCapturing = false;
    return imagePaths;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          if (isCapturing) {
            return;
          }
          final images = await _takePhoto();
          if (images.length > 0) {
            Navigator.of(context).pushNamed('/preview', arguments: images);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, cam, _) {
          if (controller.value.isInitialized) {
            return AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller),
            );
          } else if (controller.value.hasError) {
            return Center(
              child: Text("An Error occured while initialising the camera"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
