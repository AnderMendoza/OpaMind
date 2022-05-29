
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Reproductor extends StatefulWidget {
  @override
 createState() => _ReproductorState();
}

class _ReproductorState extends State<Reproductor> {

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override 
  void initState(){
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state){
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    }); 

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
     });

     audioPlayer.onAudioPositionChanged.listen((newPosition) {
       setState(() {
         position = newPosition;
       });
      });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    final player = AudioCache(prefix: "assets/");
    final url = await player.load("SMHTL.mp3");
    audioPlayer.setUrl(url.path, isLocal: true);
  }


  @override 
  void dispose(){
    audioPlayer.dispose();

    super.dispose();
  } 

  
  String formatTime(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":");
  }

  @override
  Widget build(BuildContext context)  => Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:Image.network(
                "https://i.scdn.co/image/ab67616d0000b273a7292b6863258e889b78d787",
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Show Me How to Live",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "AudioSlave",
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  await audioPlayer.resume(); 
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  iconSize: 50,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    }else{
                      await audioPlayer.resume();
                    }
                  },
                ),
              )
            ]
          ),
        )
      );
  }
