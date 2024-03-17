import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Receita 3 By Luiz",
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
      body: NewDataBody(
        objects: [
          "La Fin Du Monde - Bock - 65 ibu",
          "Sapporo Premiume - Sour Ale - 54 ibu",
          "Duvel - Pilsner - 82 ibu"
        ]
      ),
      bottomNavigationBar: MyNewNavBar(
        items: [
          NavBarItem(
            icon: Icon(Icons.phone, color: Color.fromARGB(255, 0, 162, 255)),
            label: "Phone",
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
      title: const Text("Receita 3"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 10, 130, 20),
      actions: [
        PopupMenuButton<Color>(
          itemBuilder: (context) => [
            PopupMenuItem<Color>(
              child: Text("Japonês"),
            ),
            PopupMenuItem<Color>(
              child: Text("Gabiquebra"),
            ),
            PopupMenuItem<Color>(
              child: Text("FullStack"),
            ),
            PopupMenuItem<Color>(
              child: Text("Esforçado"),
            ),
          ],
          onSelected: (color) {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewDataBody extends StatelessWidget {
  List<String> objects;

  NewDataBody( {this.objects = const [] });
  
  Expanded processarUmElemento(String obj){
    return Expanded(                
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: objects.map((obj) => Expanded(
        child: Center(child: Text(obj)),
      )
    ).toList());
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

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: items
        .map((item) => BottomNavigationBarItem(icon: item.icon, label: item.label))
      .toList(),
    );
  }
}
