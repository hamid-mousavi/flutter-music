import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/common/color.dart';
import 'package:just_audio/just_audio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(Mytext.recentlyPlayed),
                  const Expanded(child: SizedBox(width: 5)),
                  const Icon(CupertinoIcons.bell),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Icon(CupertinoIcons.clock),
                  ),
                  const Icon(CupertinoIcons.settings),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return SliderWidget(
                        title: Mytext.recentlyPlayed,
                        imagePath:
                            'https://i1.sndcdn.com/artworks-WeYF2EHOzSyFZnuo-jucUhQ-t500x500.jpg',
                        imageWidth: 110,
                        imageHeigh: 110);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Mytext.special),
            ),
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return SliderWidget(
                        title: Mytext.special,
                        imagePath:
                            'https://i1.sndcdn.com/artworks-WeYF2EHOzSyFZnuo-jucUhQ-t500x500.jpg',
                        imageWidth: 50,
                        imageHeigh: 180);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(Mytext.popular),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return SliderWidget(
                        title: Mytext.recentlyPlayed,
                        imagePath:
                            'https://i1.sndcdn.com/artworks-WeYF2EHOzSyFZnuo-jucUhQ-t500x500.jpg',
                        imageWidth: 200,
                        imageHeigh: 200);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final double imageWidth;
  final double imageHeigh;
  const SliderWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeigh,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => TrakViewWidget(),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: imageWidth,
          height: imageHeigh,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  fit: BoxFit.fill,
                  imagePath,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isPlay = true;

class TrakViewWidget extends StatefulWidget {
  const TrakViewWidget({super.key});

  @override
  State<TrakViewWidget> createState() => _TrakViewWidgetState();
}

class _TrakViewWidgetState extends State<TrakViewWidget> {
  Duration? duration;
  final AudioPlayer audioPlayer = AudioPlayer();
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    audioPlayer
        .setUrl(
      'https://irsv.upmusics.com/AliBZ/Ahmad%20Solo%20%7C%20Labkhand%20(320).mp3',
    )
        .then((value) {
      duration = value;
      audioPlayer.play();
      timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
        setState(() {});
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: null,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff962419),
                  Color(0xff661710),
                  Color(0xff430E09),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(CupertinoIcons.ellipsis),
                        Icon(CupertinoIcons.chevron_down),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        height: MediaQuery.of(context).size.height / 2,
                        child: ClipRRect(
                          child: Image.network(
                            'https://i1.sndcdn.com/artworks-WeYF2EHOzSyFZnuo-jucUhQ-t500x500.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text('محمد باقر الخاقانی | لیالی الجروح'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'محمد باقر الخاقانی',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Icon(
                          CupertinoIcons.heart,
                          color: Color(0xffCBB7B5),
                        )
                      ],
                    ),
                    if (duration != null)
                      Slider(
                        value: audioPlayer.position.inMilliseconds.toDouble(),
                        max: duration!.inMilliseconds.toDouble(),
                        activeColor: Colors.amber,
                        inactiveColor: Colors.black,
                        onChangeStart: (value) => audioPlayer.pause(),
                        onChangeEnd: (value) => audioPlayer.play(),
                        onChanged: (value) {
                          audioPlayer
                              .seek(Duration(milliseconds: value.toInt()));
                        },
                      ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(durationToString(audioPlayer.position),
                              style: Theme.of(context).textTheme.bodySmall),
                          Text(durationToString(duration!),
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(CupertinoIcons.shuffle),
                        Icon(CupertinoIcons.forward_end_fill),
                        InkWell(
                            onTap: () {
                              setState(() {
                                if (audioPlayer.playing) {
                                  isPlay = false;
                                  audioPlayer.pause();
                                } else {
                                  audioPlayer.play();
                                  isPlay = true;
                                }
                              });
                            },
                            child: Icon(
                                isPlay
                                    ? CupertinoIcons.pause_circle_fill
                                    : CupertinoIcons.play_circle_fill,
                                size: 60)),
                        Icon(CupertinoIcons.backward_end_fill),
                        Icon(CupertinoIcons.repeat),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

String durationToString(Duration duration) {
  String negativeSign = duration.isNegative ? '-' : '';
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
  return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}
