import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus{idle,loading,ready,error}

class DataService{
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier({'status':TableStatus.idle, 'dataObjects':[]});
  int _selectedQuantity = 5;
  bool loading = false;

  void carregar(index) {
    loading = true;
    
    final funcoes = [carregarPessoas, carregarCafes, carregarCervejas, carregarNacoes, carregarCarros];
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': []
    };
    funcoes[index]();
    
    loading = false;
  }

  void setSelectedQuantity(int quantity) {
    _selectedQuantity = quantity;
  }

  void carregarCafes() {
    var coffeeUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/coffee/random_coffee',
      queryParameters: {'size': '$_selectedQuantity'}
    );

    http.read(coffeeUri).then((jsonString){
      var coffeeJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': coffeeJson,
        'columnNames' : ["Nome", "Origem", "Intensidade"],
        'propertyNames': ["blend_name", "origin", "intensifier"]
      };
    }).catchError((err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
    });
  }

  void carregarCervejas() {
    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': '$_selectedQuantity'}
    );

    http.read(beersUri).then((jsonString){
      var beersJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'columnNames' : ["Nome", "Estilo", "IBU"],
        'propertyNames': ["name","style","ibu"]
      };
    }).catchError((err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
    });
  }

  void carregarNacoes() async {
    var nationsUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': '$_selectedQuantity'}
    );
    try {
      var jsonString = await http.read(nationsUri);

      var nationsJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': nationsJson,
        'columnNames' : ["Nome", "Idioma", "Moeda"],
        'propertyNames': ["nationality", "language", "capital"]
      };
    } catch (err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
    }
  }

  void carregarCarros() {
    var carrosUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/vehicle/random_vehicle',
      queryParameters: {'size': '$_selectedQuantity'}
    );

    http.read(carrosUri).then((jsonString){
      var carroJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': carroJson,
        'columnNames' : ["Modelo", "Transmissão", "Tipo"],
        'propertyNames': ["make_and_model", "transmission", "car_type"]
      };
    }).catchError((err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
    });
  }

  void carregarPessoas() {
    var pessoasUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/users/random_user',
      queryParameters: {'size': '$_selectedQuantity'}
    );

    http.read(pessoasUri).then((jsonString){
      var pessoaJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': pessoaJson,
        'columnNames' : ["Nome", "Gênero", "Aniversário"],
        'propertyNames': ["first_name", "gender", "date_of_birth"]
      };
    }).catchError((err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
    });
  }
}

final dataService = DataService();

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    
    MaterialColor customSwatch = MaterialColor(0xFF0019A4, {
      50: Color(0xFF0019A4),
      100: Color(0xFF0019A4),
      200: Color(0xFF0019A4),
      300: Color(0xFF0019A4),
      400: Color(0xFF0019A4),
      500: Color(0xFF0019A4),
      600: Color(0xFF0019A4),
      700: Color(0xFF0019A4),
      800: Color(0xFF0019A4),
      900: Color(0xFF0019A4),
    });
    MaterialColor customSwatchSecundary = MaterialColor(0xFFABCDEF, {
      50: Color(0xFFABCDEF),
      100: Color(0xFFABCDEF),
      200: Color(0xFFABCDEF),
      300: Color(0xFFABCDEF),
      400: Color(0xFFABCDEF),
      500: Color(0xFFABCDEF),
      600: Color(0xFFABCDEF),
      700: Color(0xFFABCDEF),
      800: Color(0xFFABCDEF),
      900: Color(0xFFABCDEF),
    });

    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Receita 8 By Luiz",
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: customSwatch,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: customSwatchSecundary,
          brightness: Brightness.light,
        ),
      ),
      themeMode: _themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: MyNewAppBar(),
        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder:(_, value, __) {
            switch (value['status']) {
              case TableStatus.idle:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'initial_image.png',
                        width: 550,
                        height: 225,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Toque algum botão",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              case TableStatus.loading:
                return Center(
                  child: SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[350],
                      color: Color.fromARGB(255, 45, 165, 255),
                    ),
                  ),
                );
              case TableStatus.ready: 
                return DataTableWidget(
                  jsonObjects: value['dataObjects'], 
                  propertyNames: value['propertyNames'], 
                  columnNames: value['columnNames'], 
                );
              case TableStatus.error:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Erro ao carregar os dados!",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Verifique sua conexão com a internet e tente novamente.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
            }
            return Text("...");
          }
        ),
        bottomNavigationBar: NewNavBar(
          itemSelectedCallback: dataService.carregar,
          icons: [
            Icons.people,
            Icons.coffee,
            Icons.local_drink,
            Icons.public,
            Icons.directions_car
          ],
          iconColors: [
            Color.fromARGB(255, 255, 0, 235),
            Color.fromARGB(255, 125, 65, 0),
            Color.fromARGB(255, 255, 220, 0),
            Color.fromARGB(255, 0, 135, 0),
            Color.fromARGB(255, 255, 0, 0)
          ],
          labels: ["Pessoas", "Cafés", "Cervejas", "Nações", "Carros"]
        ),
      )
    );
  }
}

class MyNewAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyNewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Future", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 28)),
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
        PopupMenuButton<int>(
          icon: Icon(Icons.more_vert),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              child: Text("Add 5 Items"),
              value: 5,
            ),
            PopupMenuItem<int>(
              child: Text("Add 10 Items"),
              value: 10,
            ),
            PopupMenuItem<int>(
              child: Text("Add 15 Items"),
              value: 15,
            ),
          ],
          onSelected: (int quantity) {
            dataService.setSelectedQuantity(quantity);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;
  final List<IconData> icons;
  final List<Color> iconColors;
  final List<String> labels;

  NewNavBar({itemSelectedCallback, required this.icons, required this.iconColors, required this.labels}):
    _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    assert(icons.length == labels.length && icons.length == iconColors.length);
    var state = useState(2);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        state.value = index;
        _itemSelectedCallback(index);
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

class DataTableWidget extends HookWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const ["Nome","Estilo","IBU"],
    this.propertyNames= const ["name", "style", "ibu"]
  });

  dynamic _compareMaker(String property, bool asc) {
    return asc
      ? (a, b) => a[property].compareTo(b[property]) as int
      : (a, b) => b[property].compareTo(a[property]) as int;
  }

  @override
  Widget build(BuildContext context) {

    var internalState = useState({
      'asc': true,
      'sortColumn': null,
      'objects': jsonObjects,
    });

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
                sortAscending: internalState.value['asc'] as bool,
                sortColumnIndex: internalState.value['sortColumn'] != null
                    ? internalState.value['sortColumn'] as int
                    : null,
                columns: columnNames
                  .map((name) => DataColumn(
                    onSort: (index, isAscending) {
                      final compare = _compareMaker(propertyNames[index], isAscending);
                      jsonObjects.sort(compare);
                      internalState.value = {
                        'objects': jsonObjects,
                        'sortColumn': index,
                        'asc': isAscending
                      };
                    },
                    label: Expanded(
                      child: Text(name, style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 16))
                    )
                  )
                ).toList(),
                rows: jsonObjects
                  .map((obj) => DataRow(
                    cells: propertyNames
                      .map((propName) => DataCell(Text(obj[propName])))
                    .toList()
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
