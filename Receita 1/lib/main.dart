import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(primarySwatch: Colors.lightBlue),
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          "My First App",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Receita 01",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "By",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              )   
            ),
            Text(
              "Luiz Miguel",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              )
            ),
            Text(
              "",
            ),
            Image.network(
              'https://avatars.githubusercontent.com/u/127552648?v=4',
              width: 125,
              height: 125,
              fit: BoxFit.cover,
            ),
          ]
        )
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
              },
            child: Text("Botão 1"),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.headphones),
              onPressed: () {
              },
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
              },
            child: Text("Botão 3"),
            ),
          ),
        ]
      )
    )
  );
  runApp(app);
}
