//Importamos los paquetes
import 'package:OpaMind/models/pop.dart';
import 'package:OpaMind/providers/pop_provider.dart';
import 'package:OpaMind/search/pop_search_delegate.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_list_tile.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';

class PopScreen extends StatefulWidget {
  const PopScreen({Key? key}) : super(key: key);

  @override
  createState() => _PopScreen();
}

class _PopScreen extends State<PopScreen> {
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
    final popProvider = Provider.of<PopProvider>(context);
    final List<Pop> listaPops = popProvider.listaPops;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 54, 99),
        title: const Text(
          "Pop",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: PopSearchDelegate(listaPops));
            },
          )
        ],
      ),
      drawer: const MenuLateral(),
      //Mostramos las canciones
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: listaPops.length,
                itemBuilder: (context, index) => customListTile(
                      onTap: () {
                        playMusic(listaPops[index].url);
                        setState(() {
                          currentTitle = listaPops[index].cancion;
                          currentCover = listaPops[index].portada;
                          currentSinger = listaPops[index].banda;
                        });
                      },
                      title: listaPops[index].cancion,
                      cover: listaPops[index].portada,
                      singer: listaPops[index].banda,
                    )),
          ),
          //Creamos el espacio del player
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 56, 39, 98),
                boxShadow: [
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
                                color: Color.fromARGB(255, 251, 251, 251),
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
                                  color: Color.fromARGB(255, 251, 251, 251),
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      //Funcion para reproducir y pausar las canciones
                      IconButton(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        onPressed: () {
                          if (isPlaying) {
                            audioPlayer.resume();
                            setState(() {
                              btnIcon = Icons.pause;
                              isPlaying = false;
                            });
                          } else {
                            audioPlayer.pause();
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
