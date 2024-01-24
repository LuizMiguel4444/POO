import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: Scaffold(
      appBar: AppBar(title: Text(
        "Meu primeiro app",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 30.0,
          fontWeight: FontWeight.normal,
        )
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Receita 1',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "By",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              )   
            ),
            Text(
              "Luiz Miguel",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              )
            ),
          ]
        )
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Botão 1",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            )
          ),
          Text(
            "Botão 2",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            )
          ),
          Text(
            "Botão 3",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            )
          ),
        ]
      )
    )
  );
  runApp(app);
}
