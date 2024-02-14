import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
   late VideoPlayerController _controller;
  bool _showControls = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height / 3.5,
                //   width: MediaQuery.of(context).size.width,
                //   color: Colors.red,
                // ),

               Center(
          child: _controller.value.isInitialized
              ? GestureDetector(
                onTap: (){
                    _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                },
                child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
              )
              : Container(),
        ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Lastest",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: <Widget>[
                    for (int i = 0; i < 5; i++)
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          imgList[i],
                          width: MediaQuery.of(context).size.width / 2 - 15,
                        ),
                      )
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
