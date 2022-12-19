import 'dart:io';

import 'package:camera/camera.dart';
import 'package:revirew/CustomUI/const_fun.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatefulWidget {
  const VideoPlayerApp({Key? key, required this.videSrc}) : super(key: key);
  final XFile videSrc;
  @override
  State<VideoPlayerApp> createState() => _VideoPlayerAppState();
}

class _VideoPlayerAppState extends State<VideoPlayerApp> {
  VideoPlayerController? videoController;

  // String videSrcNetwork =
  //     "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.file(File(widget.videSrc.path))
      ..initialize().then((value) {
        setState(() {
          videoController!.play();
        });
      });
  }

  // final ImagePicker imagePicker = ImagePicker();
  // Future<void> getVideoFromGallary() async {
  //   XFile? video = await imagePicker.pickVideo(source: ImageSource.gallery);
  //   videSrc = File(video!.path);
  //   videoController = VideoPlayerController.file(videSrc)
  //     ..initialize().then((value) {
  //       setState(() {
  //         videoController!.play();
  //       });
  //     });

  // @override
  // void initState() {
  //   super.initState();
  //   videoController = VideoPlayerController.file(File(widget.videSrc.path))
  //     ..initialize().then((value) {
  //       setState(() {
  //         videoController!.play();
  //       });
  //     });
  // }
  @override
  void dispose() {
    videoController!.dispose();
    super.dispose();
  }

  bool isplayVideo = true;
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  FocusNode focusNode = FocusNode();
  bool showAppBar = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBarEdit(() {
          setState(() {
            focusNode.unfocus();
            focusNode.canRequestFocus = false;
            emojiShowing = !emojiShowing;
          });
        }),
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              videoController!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videoController!.value.aspectRatio,
                      child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              isplayVideo = !isplayVideo;

                              videoController!.pause();
                            });
                          },
                          onLongPressUp: () {
                            setState(() {
                              isplayVideo = !isplayVideo;
                              videoController!.play();
                            });
                          },
                          child: VideoPlayer(videoController!)))
                  : Center(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "NOT FOUND VIDEO",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            CircularProgressIndicator(
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: VideoProgressIndicator(
                    videoController!,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                        backgroundColor: Colors.grey,
                        playedColor: Colors.white),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isplayVideo = !isplayVideo;
                          if (isplayVideo) {
                            videoController!.play();
                          } else {
                            videoController!.pause();
                          }
                        });
                      },
                      icon: Icon(
                        isplayVideo ? Icons.pause : Icons.play_arrow,
                        size: 40,
                        color: Colors.white,
                      ))),
              TextFromFill(size, _controller, focusNode, emojiShowing)
            ],
          ),
        ));
  }
}
