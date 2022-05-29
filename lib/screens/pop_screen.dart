import 'package:flutter/material.dart';
import 'package:OpaMind/providers/pop_provider.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';
import 'package:OpaMind/models/pop.dart';
import 'package:provider/provider.dart';

class PopScreen extends StatefulWidget{
  @override
  createState() => _PopScreen();
}

class _PopScreen extends State<PopScreen>{
  @override
  Widget build(BuildContext context) {

    final popProvider = Provider.of<PopProvider>(context);
    final List<Pop> listaPops = popProvider.listaPops;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 54, 99),
        title: Text('Pop'),
        centerTitle: true,
      ),
      drawer: const MenuLateral(),
      body: 
Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: 250,
                    width: 490,
                    margin: EdgeInsets.all(3),
                    child: Center(
                      child: Image.network("https://st4.depositphotos.com/1001599/25731/v/450/depositphotos_257318874-stock-illustration-popular-music-concept-vector-illustration.jpg",
                       ),
                      ),
                  ),
                ),
              ),
              Flexible(child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: listaPops.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => 
                ListTile(
                 onTap: (() {  
                 }),
                 title: Text(listaPops[index].cancion,
                 style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 25,
                 color: Color.fromARGB(255, 255, 255, 255)
                 )
                 ),
                 subtitle: Text(listaPops[index].banda,
                 style: TextStyle(
                 color: Color.fromARGB(255, 151, 151, 151),
                 fontSize: 15,
                 ),
                 ),
                 leading: Image.network("https://upload.wikimedia.org/wikipedia/en/b/b2/Good_Vibrations_single.jpg", height: 60, width: 60,),
                 trailing: Icon(Icons.arrow_forward_ios,
                 color: Color.fromARGB(255, 151, 151, 151),
                 size: 30,),
                ),
              ))
            ],
          ),
        )
      )
    );
  }
}