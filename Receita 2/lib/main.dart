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
            icon: Icon(Icons.calendar_today, color: Color.fromARGB(255, 255, 0, 0)),
            label: "Calendar",
          ),
          NavBarItem(
            icon: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 255, 230, 0)),
            label: "Car",
          ),
        ],
        backgroundColor: Color.fromARGB(255, 60, 60, 60),
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
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: const [
                  Text(
                    "La Fin Du Monde - Bock - 65 ibu",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Sapporo Premiume - Sour Ale - 54 ibu",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Duvel - Pilsner - 82 ibu",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Matuta - Umburana - 30 reais",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
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
  final Color backgroundColor;

  MyNewNavBar({required this.items, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundColor,
      items: items
          .map((item) => BottomNavigationBarItem(icon: item.icon, label: item.label))
        .toList(),
    );
  }
}
