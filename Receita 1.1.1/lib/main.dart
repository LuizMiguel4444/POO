import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialColor black = const MaterialColor(
      0xFF000000,
      <int, Color>{
        50: Color(0xFF000000),
        100: Color(0xFF000000),
        200: Color(0xFF000000),
        300: Color(0xFF000000),
        400: Color(0xFF000000),
        500: Color(0xFF000000),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      },
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cervejaria do Luiz 2.0",
      theme: ThemeData(
        primarySwatch: black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "CERVEJAS",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12),
            ExpansionTile(
              title: Text("La Fin Du Monde"),
              children: <Widget>[
                ListTile(
                  subtitle: Text(
                    "Bock",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  subtitle: Text(
                    "65",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Sapporo Premium"),
              children: <Widget>[
                ListTile(
                  subtitle: Text(
                    "Sour Ale",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  subtitle: Text(
                    "54",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Duvel"),
              children: <Widget>[
                ListTile(
                  subtitle: Text(
                    "Pilsner",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,                 
                  ),
                ),
                ListTile(
                  subtitle: Text(
                    "82",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Heineken"),
              children: <Widget>[
                ListTile(
                  subtitle: Text(
                    "Pale Lager",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  subtitle: Text(
                    "48",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
