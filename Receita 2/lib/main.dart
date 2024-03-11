import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Luiz Revenue",
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyNewAppBar(),
      body: NewLittleBody(),
      bottomNavigationBar: MyNewNavBar(
        items: [
          NavBarItem(
            icon: Icon(Icons.phone, color: Color.fromARGB(255, 0, 162, 255)),
            label: "Phone",
          ),
          NavBarItem(
            icon: Icon(Icons.music_note, color: Color.fromARGB(255, 0, 255, 13)),
            label: "Music",
          ),
          NavBarItem(
            icon: Icon(Icons.calendar_today, color: Color.fromARGB(255, 236, 89, 187)),
            label: "Calendar",
          ),
          NavBarItem(
            icon: Icon(Icons.camera, color: Color.fromARGB(255, 255, 0, 0)),
            label: "Cam",
          ),
          NavBarItem(
            icon: Icon(Icons.email, color: Color.fromARGB(255, 255, 255, 255)),
            label: "Email",
          ),
          NavBarItem(
            icon: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 255, 230, 0)),
            label: "Car",
          ),
        ],
      ),
    );
  }
}

class MyNewAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyNewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Receita 2"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 175, 60, 255),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewLittleBody extends StatelessWidget {
  NewLittleBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("La Fin Du Monde - Bock - 65 ibu"),
            SizedBox(height: 100),
            Text("Sapporo Premiume - Sour Ale - 54 ibu"),
            SizedBox(height: 100),
            Text("Duvel - Pilsner - 82 ibu"),
          ],
        ),
      ),
    );
  }
}

class NavBarItem {
  Icon icon;
  String label;

  NavBarItem({required this.icon, required this.label});
}

class MyNewNavBar extends StatelessWidget {
  final List<NavBarItem> items;

  MyNewNavBar({required this.items});

  void touchedButton(int index) {
    print("Touched: $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: touchedButton,
      items: items
          .map((item) => BottomNavigationBarItem(icon: item.icon, label: item.label))
          .toList(),
    );
  }
}
