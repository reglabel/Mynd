import 'dart:js';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            width: 100,
            child: Image.asset("assets/app-logo.png"),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          Container(
            width: 60,
            child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.black38,
              onPressed: () => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/user-picture.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            
            cardItem(),
            cardsCarrosel(),
            /*cardItem(),*/
            /*cardItem(),*/
            /*cardItem(),*/
            /*cardItem(),*/
          ],
        ),
      ),
    );
  }
}

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          /*leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://baltaio.blob.core.windows.net/student-images/1edd5c50-bae9-11e8-8eb4-39de303632c1.jpg"),
          ),*/
          title: Text("Bruce Wayne"),
          subtitle: Text("09/05/2019 18:37"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          child: Image.asset("assets/post-picture-001.png"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis ex sem. Praesent elit dui, iaculis at interdum eu, rutrum et mi. "),
        ),
      ],
    ),
  );
}

Widget cardsCarrosel() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [
                Color.fromARGB(255, 89, 46, 109),
                Color.fromARGB(255, 75, 45, 243),
              ],
            ),
            image: DecorationImage(  
              image: NetworkImage("https://i.ibb.co/VSSG3MG/logo.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    ],
  );
}
