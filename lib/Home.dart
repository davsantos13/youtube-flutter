import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIdx = 0;
  String _busca = '';

  @override
  Widget build(BuildContext context){

    List<Widget> _telas = [
      Inicio(_busca),
      EmAlta(),
      Incricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 20,
          ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState((){
                _busca = res;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _telas[_currentIdx],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIdx,
        onTap: (index){
          setState((){
            _currentIdx = index;
          });
        },
        //type: BottomNavigationBarType.fixed,
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            title: Text('Inicio'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            title: Text('Em Alta'),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            title: Text('Inscrições'),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black12,
            title: Text('Biblioteca'),
            icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}