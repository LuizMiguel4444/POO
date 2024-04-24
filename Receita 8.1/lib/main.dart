import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

MaterialColor customSwatch = MaterialColor(0xFF9600A5, {
    50:  Color(0xFF9600A5),
    100: Color(0xFF9600A5),
    200: Color(0xFF9600A5),
    300: Color(0xFF9600A5),
    400: Color(0xFF9600A5),
    500: Color(0xFF9600A5),
    600: Color(0xFF9600A5),
    700: Color(0xFF9600A5),
    800: Color(0xFF9600A5),
    900: Color(0xFF9600A5),
  });
MaterialColor customSwatchSecundary = MaterialColor(0xFF00FF69, {
  50:  Color(0xFF00FF69),
  100: Color(0xFF00FF69),
  200: Color(0xFF00FF69),
  300: Color(0xFF00FF69),
  400: Color(0xFF00FF69),
  500: Color(0xFF00FF69),
  600: Color(0xFF00FF69),
  700: Color(0xFF00FF69),
  800: Color(0xFF00FF69),
  900: Color(0xFF00FF69),
});

enum TableStatus{idle,loading,ready,error}
enum ItemType{coffee, beer, nation, none}

class DataService{
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = 
        ValueNotifier({'status':TableStatus.idle, 'dataObjects':[]});
  int _selectedQuantity = 10;

  void loadData(Uri uri, ItemType itemType, List<String> propertyNames) {
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;
    if (tableStateNotifier.value['itemType'] != itemType) {
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': itemType
      };
    }

    http.read(uri).then((jsonString) {
      var jsonData = jsonDecode(jsonString);

      if (tableStateNotifier.value['status'] != TableStatus.loading) {
        jsonData = [
          ...tableStateNotifier.value['dataObjects'],
          ...jsonData,
        ];
      }

      tableStateNotifier.value = {
        'itemType': itemType,
        'status': TableStatus.ready,
        'dataObjects': jsonData,
        'propertyNames': propertyNames,
        'columnNames': ["Nome", ...propertyNames]
      };
    });
  }

  void carregar(ItemType itemType) {
    switch (itemType) {
      case ItemType.coffee:
        carregarCafes();
        break;
      case ItemType.beer:
        carregarCervejas();
        break;
      case ItemType.nation:
        carregarNacoes();
        break;
      default:
        break;
    }
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
    loadData(coffeeUri, ItemType.coffee, ["blend_name", "origin", "intensifier"]);
  }

  void carregarCervejas() {
    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': '$_selectedQuantity'}
    );
    loadData(beersUri, ItemType.beer, ["name", "style", "ibu"]);
  }

  void carregarNacoes() {
    var nationsUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': '$_selectedQuantity'}
    );
    loadData(nationsUri, ItemType.nation, ["nationality", "language", "capital"]);
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
  final functionsMap = {
    ItemType.beer: dataService.carregarCervejas,
    ItemType.coffee: dataService.carregarCafes,
    ItemType.nation: dataService.carregarNacoes
  };

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Receita 8.1 By Luiz",
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: customSwatch,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: customSwatchSecundary,
          brightness: Brightness.dark,
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
                      color: Colors.blueAccent
                    ),
                  ),
                );
              case TableStatus.ready: 
                return ListWidget(
                  jsonObjects: value['dataObjects'], 
                  propertyNames: value['propertyNames'],
                  scrollEndedCallback: functionsMap[value['itemType']]
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
            Icons.coffee,
            Icons.local_drink,
            Icons.public,
          ],
          iconColors: [
            Color.fromARGB(255, 125, 125, 125),
            Color.fromARGB(255, 180, 160, 25),
            Color.fromARGB(255, 0, 170, 215),
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
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? customSwatchSecundary : customSwatch,
      title: Text("Infinite Scroll", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 28,
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white)),
      centerTitle: true,
      actions: [
        Obx(() => IconButton(
          icon: Icon(
            Get.find<ThemeController>().isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
          ),
          onPressed: () {
            Get.find<ThemeController>().toggleTheme();
          },
        )),
        // PopupMenuButton<int>(
        //   icon: Icon(Icons.more_vert, color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white),
        //   itemBuilder: (context) => [
        //     PopupMenuItem<int>(
        //       child: Text("Add 5 Items"),
        //       value: 5,
        //     ),
        //     PopupMenuItem<int>(
        //       child: Text("Add 10 Items"),
        //       value: 10,
        //     ),
        //     PopupMenuItem<int>(
        //       child: Text("Add 15 Items"),
        //       value: 15,
        //     ),
        //   ],
        //   onSelected: (int quantity) {
        //     dataService.setSelectedQuantity(quantity);
        //   },
        // ),
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
    var state = useState(1);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        state.value = index;
        _itemSelectedCallback(ItemType.values[index]);
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

class ListWidget extends HookWidget {
  final dynamic _scrollEndedCallback;
  final List jsonObjects;
  final List<String> propertyNames;

  ListWidget({
    this.jsonObjects = const [],
    this.propertyNames = const ["name", "style", "ibu"],
    void Function()? scrollEndedCallback,
  }) : _scrollEndedCallback = scrollEndedCallback ?? false;

  @override
  Widget build(BuildContext context) {
    var controller = useScrollController();
    useEffect(() {
      controller.addListener(() {
        if (controller.position.pixels == controller.position.maxScrollExtent)
          print('end of scroll');
        if (_scrollEndedCallback is Function) _scrollEndedCallback();
      });
    }, [controller]);

    String itemCountText = "Mostrando ${jsonObjects.length} itens";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            itemCountText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            controller: controller,
            padding: EdgeInsets.all(10),
            separatorBuilder: (_, __) => Divider(
              height: 10,
              thickness: 3,
              indent: 10,
              endIndent: 10,
              color: Theme.of(context).brightness == Brightness.dark ? customSwatchSecundary : customSwatch,
            ),
            itemCount: jsonObjects.length + 1,
            itemBuilder: (_, index) {
              if (index == jsonObjects.length)
                return Center(
                  child: LinearProgressIndicator(),
                );
              var title = jsonObjects[index][propertyNames[0]];
              var content = propertyNames
                  .sublist(1)
                  .map((prop) => jsonObjects[index][prop])
                  .join("  -  ");

              return Card(
                color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.withOpacity(0.60) : Colors.white,
                elevation: 5,
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    Text(
                      "${title}\n",
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(content),
                    SizedBox(height: 12)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
