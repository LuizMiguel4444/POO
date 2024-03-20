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
      body: NewDataBody(),
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
      title: const Text("Receita 3", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 255, 155, 0),
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color.fromARGB(255, 255, 155, 0), width: 3,
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.20),),
                ],
              ),
              child: DataTable(
                columnSpacing: 200,
                horizontalMargin: 150,
                columns: const <DataColumn>[
                  DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center,),),
                  DataColumn(label: Text('Style', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center,),),
                  DataColumn(label: Text('IBU', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center,),),
                ],
                rows: cervejas.map((cerveja) {
                  return DataRow(cells: [
                    DataCell(Text(cerveja.name,textAlign: TextAlign.center,),),
                    DataCell(Text(cerveja.style, textAlign: TextAlign.center,),),
                    DataCell(Text(cerveja.ibu.toString(), textAlign: TextAlign.center,),),
                  ]);
                }).toList(),
              ),
            ),
          ),
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

class Beer {
  String name;
  String style;
  double ibu;

  Beer({required this.name, required this.style, required this.ibu});
}

List<Beer> cervejas = [
  Beer(name: "La Fin Du Monde", style: "Bock", ibu: 65),
  Beer(name: "Sapporo Premium", style: "Sour Ale", ibu: 54),
  Beer(name: "Duvel", style: "Pilsner", ibu: 82),
  Beer(name: "Heineken", style: "Pale Lager", ibu: 48),
  Beer(name: "Guinness Draught", style: "Irish Dry Stout", ibu: 45),
  Beer(name: "Chimay Grande Réserve", style: "Belgian Strong Ale", ibu: 75),
  Beer(name: "Pliny the Elder", style: "Double IPA", ibu: 100),
  Beer(name: "Tripel Karmeliet", style: "Tripel", ibu: 30),
  Beer(name: "Westvleteren", style: "Quadrupel", ibu: 60),
  Beer(name: "Weihenstephaner Hefeweissbier", style: "Hefeweizen", ibu: 25),
  Beer(name: "Rochefort", style: "Quadrupel", ibu: 35),
  Beer(name: "American Amber Ale", style: "Amber Ale", ibu: 40),
  Beer(name: "Porter", style: "Porter", ibu: 50),
  Beer(name: "Pilsner Urquell", style: "Pilsner", ibu: 30),
  Beer(name: "Milk Stout", style: "Stout", ibu: 25),
  Beer(name: "Gose", style: "Sour Ale", ibu: 10),
  Beer(name: "Doppelbock", style: "Bock", ibu: 35),
  Beer(name: "Session IPA", style: "IPA", ibu: 40),
  Beer(name: "Red Ale", style: "Amber Ale", ibu: 28),
  Beer(name: "Barleywine", style: "Barleywine", ibu: 65),
  Beer(name: "Saison", style: "Farmhouse Ale", ibu: 20),
  Beer(name: "Witbier", style: "Belgian Ale", ibu: 12),
  Beer(name: "Mystic Mocha Madness", style: "Coffee Stout", ibu: 70),
  Beer(name: "Hoppy Haze", style: "IPA", ibu: 85),
  Beer(name: "Golden Glory", style: "Blonde Ale", ibu: 60),
  Beer(name: "Raspberry Ripple", style: "Fruit Lambic", ibu: 78),
  Beer(name: "Citra Sensation", style: "Pale Ale", ibu: 73),
  Beer(name: "Velvet Vanilla", style: "Cream Ale", ibu: 68),
  Beer(name: "Amber Ambition", style: "Amber Ale", ibu: 65),
  Beer(name: "Tropical Temptation", style: "Fruit IPA", ibu: 80),
  Beer(name: "Wheat Whimsy", style: "Wheat Beer", ibu: 72),
  Beer(name: "Midnight Moonshine", style: "Imperial Stout", ibu: 88),
];
