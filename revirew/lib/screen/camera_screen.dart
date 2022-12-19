import 'dart:async';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:revirew/screen/camera_view_page.dart';
import 'package:revirew/screen/video_player.dart';
// import 'package:revirew/main.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
// import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

List<CameraDescription>? camers;

class CmaeraScreen extends StatefulWidget {
  const CmaeraScreen({Key? key}) : super(key: key);

  @override
  State<CmaeraScreen> createState() => _CmaeraScreenState();
}

class _CmaeraScreenState extends State<CmaeraScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(camers![0], ResolutionPreset.medium);
    cameraValue = cameraController.initialize();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    cameraController.dispose();
  }

  bool isRecorde = false;
  bool flash = false;
  bool isCameraFront = true;
  double tranform = 0.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FutureBuilder(
                future: cameraValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(cameraController);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black.withOpacity(0.3),
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                flash = !flash;
                              });
                              flash
                                  ? cameraController
                                      .setFlashMode(FlashMode.torch)
                                  : cameraController
                                      .setFlashMode(FlashMode.off);
                            },
                            icon: Icon(
                              flash ? Icons.flash_on : Icons.flash_off,
                              size: 28,
                              color: Colors.white,
                            )),
                        GestureDetector(
                          onTap: () => takePhoto(context),
                          onLongPress: () {
                            setState(() {
                              isRecorde = true;
                            });
                            cameraController.startVideoRecording();
                          },
                          onLongPressUp: () {
                            setState(() {
                              isRecorde = false;
                            });
                            takevideo(context);
                          },
                          child: Icon(
                            isRecorde
                                ? Icons.radio_button_on
                                : Icons.panorama_fish_eye,
                            size: 70,
                            color: isRecorde ? Colors.red : Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isCameraFront = !isCameraFront;
                                tranform = tranform + pi;
                              });
                              print(isCameraFront);
                              print(tranform);
                              int cameraPOs = isCameraFront ? 0 : 1;
                              cameraController = CameraController(
                                  camers![cameraPOs], ResolutionPreset.medium);
                              cameraValue = cameraController.initialize();
                            },
                            icon: Transform.rotate(
                              angle: tranform,
                              child: const Icon(
                                Icons.flip_camera_ios,
                                size: 28,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                    const Text(
                      "Hold For Video, Tap For Photo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  takePhoto(BuildContext context) {
    // final path =
    //       join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");

    // late XFile imageXFILE;
    cameraController.takePicture().then((imagefile) {
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => CameraViewPage(
                  image: imagefile,
                )));
      });
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  takevideo(BuildContext context) {
    cameraController.stopVideoRecording().then((imagefile) {
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => VideoPlayerApp(videSrc: imagefile)));
      });
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
