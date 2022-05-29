import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:OpaMind/providers/rock_provider.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';
import 'package:OpaMind/models/rock.dart';
import 'package:provider/provider.dart';

class RockScreen extends StatefulWidget{
  @override
  createState() => _RockScreen();
}

class _RockScreen extends State<RockScreen>{
  @override
  Widget build(BuildContext context) {

    final rockProvider = Provider.of<RockProvider>(context);
    final List<Rock> listaRocks = rockProvider.listaRocks;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 54, 99),
        title: Text('Rock'),
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
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: 200,
                    width: 490,
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Image.network("https://media.istockphoto.com/vectors/rock-and-roll-banner-rock-and-roll-in-the-form-of-an-electric-guitar-vector-id1010461224?k=20&m=1010461224&s=170667a&w=0&h=pJBqjL7IX04KCO3QdfQkWmPgWey4m5pwBhjtOV6TyPg=",
                       ),
                      ),
                  ),
                ),
              ),
              Flexible(child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: listaRocks.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => 
                ListTile(
                 onTap: (() {
                   Navigator.pushReplacementNamed(context, 'reproductor');
                 }),
                 title: Text(listaRocks[index].cancion,
                 style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 25,
                 color: Color.fromARGB(255, 255, 255, 255)
                 )
                 ),
                 subtitle: Text(listaRocks[index].banda,
                 style: TextStyle(
                 color: Color.fromARGB(255, 151, 151, 151),
                 fontSize: 15,
                 ),
                 ),
                 leading: Image.network("https://m.media-amazon.com/images/I/81RLLYEF3gL._SL1500_.jpg", height: 60, width: 60,),
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