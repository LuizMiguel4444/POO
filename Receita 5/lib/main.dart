import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

var dataObjects = [
  {"modelo": "Ferrari 458 Italia", "tipo": "Sports Car", "cavalos": "562"},
  {"modelo": "Lamborghini Aventador", "tipo": "Supercar", "cavalos": "691"},
  {"modelo": "Porsche 911", "tipo": "Sports Car", "cavalos": "379"},
  {"modelo": "Bugatti Veyron", "tipo": "Hypercar", "cavalos": "1001"},
  {"modelo": "McLaren 720S", "tipo": "Sports Car", "cavalos": "710"},
  {"modelo": "Aston Martin DB11", "tipo": "Grand Tourer", "cavalos": "600"},
  {"modelo": "Ford Mustang GT", "tipo": "Muscle Car", "cavalos": "460"},
  {"modelo": "Chevrolet Camaro ZL1", "tipo": "Muscle Car", "cavalos": "650"},
  {"modelo": "Nissan GT-R", "tipo": "Sports Car", "cavalos": "565"},
  {"modelo": "Audi R8", "tipo": "Supercar", "cavalos": "562"},
  {"modelo": "Mercedes-Benz AMG GT", "tipo": "Sports Car", "cavalos": "550"},
  {"modelo": "BMW M5", "tipo": "Sports Sedan", "cavalos": "600"},
  {"modelo": "Tesla Model S Plaid", "tipo": "Electric Sedan", "cavalos": "1020"},
  {"modelo": "Dodge Challenger Hellcat", "tipo": "Muscle Car", "cavalos": "717"},
  {"modelo": "Rolls-Royce Phantom", "tipo": "Luxury Car", "cavalos": "563"},
  {"modelo": "Maserati GranTurismo", "tipo": "Grand Tourer", "cavalos": "454"},
  {"modelo": "Bentley Continental GT", "tipo": "Grand Tourer", "cavalos": "626"},
  {"modelo": "Pagani Huayra", "tipo": "Hypercar", "cavalos": "720"},
  {"modelo": "Koenigsegg Agera RS", "tipo": "Hypercar", "cavalos": "1160"},
  {"modelo": "Lexus LC 500", "tipo": "Luxury Coupe", "cavalos": "471"},
  {"modelo": "Subaru WRX STI", "tipo": "Sports Sedan", "cavalos": "310"},
  {"modelo": "Toyota Supra", "tipo": "Sports Car", "cavalos": "382"},
  {"modelo": "Honda Civic Type R", "tipo": "Hot Hatch", "cavalos": "306"},
  {"modelo": "Volkswagen Golf R", "tipo": "Hot Hatch", "cavalos": "315"},
  {"modelo": "Mazda MX-5 Miata", "tipo": "Roadster", "cavalos": "181"},
  {"modelo": "Porsche Cayman GT4", "tipo": "Sports Car", "cavalos": "414"},
  {"modelo": "Chevrolet Corvette Stingray", "tipo": "Sports Car", "cavalos": "495"},
  {"modelo": "Acura NSX", "tipo": "Sports Car", "cavalos": "573"},
  {"modelo": "Ford GT", "tipo": "Supercar", "cavalos": "660"},
  {"modelo": "Lotus Evora", "tipo": "Sports Car", "cavalos": "416"}
];

void main() {
  runApp(MyApp());
}

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Receita 4 By Luiz",
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
        ),
      ),
      themeMode: _themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyNewAppBar(),
      body: Container(),
      // FutureBuilder<List<String>>(
      //   future: ExtratorDeChavesJson.extraiChaves(dataObjects),
      //   builder: (context, snapshot) {
      //     return NewDataBody(keys: snapshot.data!, objects: dataObjects);
      //   },
      // ),
      bottomNavigationBar: MyNewNavBar(
        icons: [
          Icons.traffic,
          Icons.ev_station,
          Icons.shopping_cart,
        ],
        iconColors: [
          Color.fromARGB(255, 255, 0, 0),
          Theme.of(context).colorScheme.primary,
          Color.fromARGB(255, 255, 230, 0)
        ],
        labels: ["Fárois", "Posto", "Carro"]
      ),
    );
  }
}

class MyNewAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyNewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Gerência de Estados", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
      centerTitle: true,
      actions: [
        Obx(() => IconButton(
          icon: Icon(
            Get.find<ThemeController>().isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: () {
            Get.find<ThemeController>().toggleTheme();
          },
        )),
        PopupMenuButton<Color>(
          icon: Icon(Icons.more_vert),
          itemBuilder: (context) => [
            PopupMenuItem<Color>(
              child: Text("Primeiro"),
            ),
            PopupMenuItem<Color>(
              child: Text("Segundo"),
            ),
            PopupMenuItem<Color>(
              child: Text("Terceiro"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewDataBody extends StatelessWidget {
  final List<Map<String, dynamic>> objects;
  final List<String> keys;

  NewDataBody({required this.keys, this.objects = const []});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.withOpacity(0.20) : Colors.grey.withOpacity(0.60),
                  ),
                ],
              ),
              child: DataTable(
                columns: keys.map((key) {
                  return DataColumn(
                    label: Text(key, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                  );
                }).toList(),
                rows: objects.map((obj) {
                  return DataRow(
                    cells: keys.map((key) => DataCell(Text(obj[key].toString()))).toList(),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyNewNavBar extends HookWidget {
  final List<IconData> icons;
  final List<Color> iconColors;
  final List<String> labels;

  MyNewNavBar({required this.icons, required this.iconColors, required this.labels});

  @override
  Widget build(BuildContext context) {
    assert(icons.length == labels.length && icons.length == iconColors.length);
    var state = useState(1);
    
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        state.value = index;
      },
      currentIndex: state.value,
      items: List.generate(icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(icons[index], color: iconColors[index]),
          label: labels[index],
        );
      }),
    );
  }
}

class MyNewNavBar2 extends StatefulWidget {
  final List<IconData> icons;
  final List<Color> iconColors;
  final List<String> labels;

  MyNewNavBar2({required this.icons, required this.iconColors, required this.labels});

  @override
  _MyNewNavBar2Obj createState() => _MyNewNavBar2Obj();
}

class _MyNewNavBar2Obj extends State<MyNewNavBar2> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.icons.length == widget.labels.length && widget.icons.length == widget.iconColors.length);
    
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
      items: List.generate(widget.icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(widget.icons[index], color: widget.iconColors[index]),
          label: widget.labels[index],
        );
      }),
    );
  }
}

class ExtratorDeChavesJson {
  static Future<List<String>> extraiChaves(List<Map<String, dynamic>> dataObjects) async {
    if (dataObjects.isNotEmpty) {
      return dataObjects.first.keys.toList();
    } else {
      return [];
    }
  }
}
