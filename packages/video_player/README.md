# video player demo

```dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTestScreen extends StatefulWidget {
  const VideoTestScreen({Key? key}) : super(key: key);

  @override
  State<VideoTestScreen> createState() => _VideoTestScreenState();
}

const String source = 'https://xs-image-proxy.yinjietd.com/video/145434426_62bd45ec622a84.14704885.mov';

class _VideoTestScreenState extends State<VideoTestScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(source)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('video'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
                children: [
                  Hero(
                    tag: "player",
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VideoFullScreen(controller: _controller),
                            settings: RouteSettings(name: '/VideoFullScreen'),
                          ),
                        );
                      },
                      style: ButtonStyle(),
                      child: Text(
                        'videoFullScreen',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

class VideoFullScreen extends StatefulWidget {
  final VideoPlayerController? controller;

  const VideoFullScreen({Key? key, this.controller}) : super(key: key);

  @override
  State<VideoFullScreen> createState() => _VideoFullScreenState();
}

class _VideoFullScreenState extends State<VideoFullScreen> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    controller?.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: (controller?.value.isInitialized ?? false)
            ? Hero(
                tag: "player",
                child: AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: VideoPlayer(controller!),
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}


```


