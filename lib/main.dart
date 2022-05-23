//Importamos los paquetes
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'components/custom_list_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Este widget es la raíz de su aplicación.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MusicApp(),
    );
  }
}

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  //Lista ade musicas(prueba)
  List musicList = [
    {
      'title': "Tech House Vibes",
      'singer': "Alejandro Magaña",
      'url':
          "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverUrl':
          "https://th.bing.com/th/id/OIP.QdvYPJETYNTY7LTPPmQiNwAAAA?pid=ImgDet&rs=1"
    },
    {
      'title': "Sun and His Daughter",
      'singer': "Eugenio Mininni",
      'url':
          "https://assets.mixkit.co/music/preview/mixkit-sun-and-his-daughter-580.mp3",
      'coverUrl':
          "https://i1.sndcdn.com/artworks-000076158811-zsifa4-t500x500.jpg"
    },
    {
      'title': "Raising Me Higher",
      'singer': "Ahjay Stelino",
      'url':
          "https://assets.mixkit.co/music/preview/mixkit-raising-me-higher-34.mp3",
      'coverUrl': "https://m.media-amazon.com/images/I/51DGF7eXc6L.jpg"
    },
    {
      'title': "Deep Urban",
      'singer': "Eugenio Mininni",
      'url': "https://assets.mixkit.co/music/preview/mixkit-deep-urban-623.mp3",
      'coverUrl':
          "https://img.discogs.com/4RboV8xZEeh5nkLH9SJ0GJP7IVI=/fit-in/600x598/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-545921-1320012464.jpeg.jpg"
    }
  ];

  //Asignamos valores la variables para titulo de la cancion, cover y cantante
  String currentTitle = "";
  String currentCover = "";
  String currentSinger = "";
  IconData btnIcon = Icons.play_arrow;

  //Creamos el player
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";

  //Creamos la barra de reproduccion
  Duration duration = const Duration();
  Duration position = const Duration();

  //Creamos los botones de reproduccion y pausa
  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.play_arrow;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((Duration p) {
      setState(() {
        duration = p;
        print('duration:$duration');
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
        print('position:$position');
      });
    });
  }

  //Creamos el area de trabajo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "My Playlist",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      //Mostramos las canciones
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: musicList.length,
                itemBuilder: (context, index) => customListTile(
                      onTap: () {
                        playMusic(musicList[index]['url']);
                        setState(() {
                          currentTitle = musicList[index]["title"];
                          currentCover = musicList[index]["coverUrl"];
                          currentSinger = musicList[index]["singer"];
                        });
                      },
                      title: musicList[index]['title'],
                      singer: musicList[index]['singer'],
                      cover: musicList[index]['coverUrl'],
                    )),
          ),
          //Creamos el espacio del player
          Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color(0x55212121),
                blurRadius: 8.0,
              ),
            ]),
            child: Column(
              children: [
                Slider(
                  value: position.inSeconds.toDouble(),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);

                    await audioPlayer.resume();
                  },
                ),
                //Agregamos los covers de cada cancion
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                                image: NetworkImage(currentCover))),
                      ),
                      //Agregamos el nombre del cantante y nombre de la cnacion
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentTitle,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              currentSinger,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      //Funcion para reproducir y pausar las canciones
                      IconButton(
                        onPressed: () {
                          if (isPlaying) {
                            audioPlayer.pause();
                            setState(() {
                              btnIcon = Icons.pause;
                              isPlaying = false;
                            });
                          } else {
                            audioPlayer.resume();
                            setState(() {
                              btnIcon = Icons.play_arrow;
                              isPlaying = true;
                            });
                          }
                        },
                        iconSize: 42.0,
                        icon: Icon(btnIcon),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
