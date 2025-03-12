import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPickerScreen extends StatefulWidget {
  const VideoPickerScreen({super.key});

  @override
  State<VideoPickerScreen> createState() => _VideoPickerScreenState();
}

class _VideoPickerScreenState extends State<VideoPickerScreen> {
  late VideoPlayerController _videoPlayerController;
  File? _video;
  final picker = ImagePicker();

  Future getGalleryVideo() async {
    final video = await picker.pickVideo(source: ImageSource.gallery);

    _video = File(video!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Video Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_video != null)
              _videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),
                    )
                  : Container()
            else
              const Text('Pick video from gallery'),
            ElevatedButton(
                onPressed: () {
                  getGalleryVideo();
                }, child: const Text('Select a video'))
          ],
        ),
      ),
    );
  }
}
