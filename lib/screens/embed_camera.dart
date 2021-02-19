import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class EmbedCamera extends StatefulWidget {
  @override
  _EmbedCameraState createState() => _EmbedCameraState();
}

class _EmbedCameraState extends State<EmbedCamera> {
  CameraController controller;
  Future<void> initializeControllerFuture;

  @override
  void initState() {
    initializeCamera();
    super.initState();
  }

  @override
  // ignore: override_on_non_overriding_member
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller != null
          ? initializeControllerFuture = controller.initialize()
          : null; //on pause camera is disposed, so we need to call again "issue is only for android"
    }
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.length > 0) {
      if (cameras.length > 1) {
        final firstCamera = cameras[1];
        controller = CameraController(firstCamera, ResolutionPreset.high);
      } else {
        final firstCamera = cameras.first;
        controller = CameraController(firstCamera, ResolutionPreset.high);
      }
      initializeControllerFuture = controller.initialize();
      if (!mounted) {
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return FutureBuilder<void>(
      future: initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Transform.scale(
              scale: controller.value.aspectRatio / deviceRatio,
              child: Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: CameraPreview(controller), //cameraPreview
                ),
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
