import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  final String videoFilePath;
  const VideoPreview(this.videoFilePath, {Key? key}) : super(key: key);

  @override
  _VideoPreviewState createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    print('Video preview init state called...');
    print('Video file path : ${widget.videoFilePath}');
    _videoPlayerController = VideoPlayerController.file(
        File(widget.videoFilePath))
      // VideoPlayerController.network(
      //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((value) {
        _videoPlayerController.setLooping(true);
        print('Aspect ratio: ${_videoPlayerController.value.aspectRatio}');
        print(
            '_videoPlayerController.value.isInitialize: ${_videoPlayerController.value.isInitialized}');
        setState(() {});
      });
    //         .initialize()
    //         .then((_) {
    //   if (!mounted) {
    //     // return;
    //   }
    //   _videoPlayerController.setLooping(true);
    //
    //   print('Aspect ratio: ${_videoPlayerController.value.aspectRatio}');
    //
    //   setState(() {});
    //   return _videoPlayerController;
    // });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          // height: (MediaQuery.of(context).size.width),
          margin: const EdgeInsets.all(0),
          child: GestureDetector(
            onTap: () {
              if (_videoPlayerController.value.isPlaying) {
                _videoPlayerController.pause();
              }
              setState(() {});
            },
            child: Stack(
              children: _videoPlayerController.value.isInitialized
                  ? <Widget>[
                      RotatedBox(
                          quarterTurns: Platform.isAndroid ? 1 : 0,
                          child: VideoPlayer(_videoPlayerController)),
                      if (!_videoPlayerController.value.isPlaying)
                        Positioned.fill(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _videoPlayerController.play();
                                setState(() {});
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 40,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffEFA83C),
                                  radius: 38,
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      FontAwesome5Solid.play,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    ]
                  : <Widget>[
                      Container(
                        child: const Center(child: CircularProgressIndicator()),
                      )
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
