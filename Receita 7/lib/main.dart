import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DataService{
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);
  List<String> _columnNames = ["Nome", "Estilo", "IBU"];
  List<String> _propertyNames = ["name", "style", "ibu"];
  int _selectedQuantity = 5;
  bool loading = false;

  void carregar(index) async {
    loading = true;
    tableStateNotifier.value = [];
    if (index == 0) {
      await carregarCafes();
      _columnNames = ["Nome", "Origem", "Intensidade"];
      _propertyNames = ["blend_name", "origin", "intensifier"];
    }
    else if (index == 1) {
      await carregarCervejas();
      _columnNames = ["Nome", "Estilo", "IBU"];
      _propertyNames = ["name", "style", "ibu"];
    }
    else {
      await carregarNacoes();
      _columnNames = ["Nome", "Idioma", "Moeda"];
      _propertyNames = ["nationality", "language", "capital"];
    }
    loading = false;
  }

  void setSelectedQuantity(int quantity) {
    _selectedQuantity = quantity;
  }

  Future<void> carregarCafes() async {
    try {
      var dio = Dio();
      var response = await dio.get('https://random-data-api.com/api/coffee/random_coffee', queryParameters: {'size': '$_selectedQuantity'});
      tableStateNotifier.value = response.data;
    } catch (e) {
      print('Erro ao carregar cafés: $e');
    }
  }

  Future<void> carregarCervejas() async {
    try {
      var dio = Dio();
      var response = await dio.get('https://random-data-api.com/api/beer/random_beer', queryParameters: {'size': '$_selectedQuantity'});
      tableStateNotifier.value = response.data;
    } catch (e) {
      print('Erro ao carregar cervejas: $e');
    }
  }

  Future<void> carregarNacoes() async {
    try {
      var dio = Dio();
      var response = await dio.get('https://random-data-api.com/api/nation/random_nation', queryParameters: {'size': '$_selectedQuantity'});
      tableStateNotifier.value = response.data;
    } catch (e) {
      print('Erro ao carregar nações: $e');
    }
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
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Receita 7 By Luiz",
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
          brightness: Brightness.light,
        ),
      ),
      themeMode: _themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: MyNewAppBar(),
        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder:(_, value, __){
            List<String> propertyNames = dataService._propertyNames;
            List<String> columnNames = dataService._columnNames;

            if (dataService.loading) {
              return Center(
                child: CircularProgressIndicator()
              );
            } 
            else {
              return DataTableWidget(
                jsonObjects:value, 
                propertyNames: propertyNames, 
                columnNames: columnNames
              );
            }
          }
        ),
        bottomNavigationBar: NewNavBar(
          state: dataService.tableStateNotifier,
          itemSelectedCallback: dataService.carregar,
          icons: [
            Icons.coffee,
            Icons.local_drink_rounded,
            Icons.flag,
          ],
          iconColors: [
            Color.fromARGB(255, 20, 155, 0),
            Colors.purple,
            Color.fromARGB(255, 0, 150, 255)
          ],
          labels: ["Cafés", "Cervejas", "Nações"]
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
            dataService.carregar(Get.find<NewNavBar>().state.value);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewNavBar extends HookWidget {
  var itemSelectedCallback;
  final List<IconData> icons;
  final List<Color> iconColors;
  final List<String> labels;
  final ValueNotifier<List> state;

  NewNavBar({this.itemSelectedCallback, required this.icons, required this.iconColors, required this.labels, required this.state}){
    itemSelectedCallback ??= (_){} ;
  } 

  @override
  Widget build(BuildContext context) {
    assert(icons.length == labels.length && icons.length == iconColors.length);
    var state = useState(1);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        state.value = index;
        dataService.carregar(index);
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

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const [],
    this.propertyNames = const []
  });

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
                columns: columnNames
                  .map((name) => DataColumn(
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
