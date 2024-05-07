import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import '../data/data_service.dart';

MaterialColor customSwatch = MaterialColor(0xFF000000, {
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
  });
MaterialColor customSwatchSecundary = MaterialColor(0xFF00CDFF, {
  50: Color(0xFF00CDFF),
  100: Color(0xFF00CDFF),
  200: Color(0xFF00CDFF),
  300: Color(0xFF00CDFF),
  400: Color(0xFF00CDFF),
  500: Color(0xFF00CDFF),
  600: Color(0xFF00CDFF),
  700: Color(0xFF00CDFF),
  800: Color(0xFF00CDFF),
  900: Color(0xFF00CDFF),
});

class ThemeController extends GetxController {
  var isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}

class Selection {
  static const List<int> selection = [10, 15, 20];
}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    AxisDirection axisDirection,
    Widget child,
  ) {
    return GlowingOverscrollIndicator(
      axisDirection: axisDirection,
      child: child,
      color: Colors.pink,
      showTrailing: false,
      showLeading: false,
    );
  }
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Receita 10 By Luiz",
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
                      color: Colors.lightBlue
                    ),
                  ),
                );
              case TableStatus.ready: 
                return SingleChildScrollView(
                  child: DataTableWidget(
                    jsonObjects: value['dataObjects'], 
                    propertyNames: value['propertyNames'], 
                    columnNames: value['columnNames'],
                    onSearchChanged: (query) {}
                  ),
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
            Color.fromARGB(255, 125, 65, 0),
            Color.fromARGB(255, 220, 190, 15),
            Color.fromARGB(255, 0, 195, 0)
          ],
          labels: ["Cafés", "Cervejas", "Nações"]
        ),
      )
    );
  }
}

class MyNewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<int> load = Selection.selection;
  
  MyNewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? customSwatchSecundary : customSwatch,
      title: Text("Polimorfismo", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 28,
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
        PopupMenuButton<int>(
          icon: Icon(Icons.more_vert),
          color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
          itemBuilder: (_) => load.map(
            (num) => PopupMenuItem(
              value: num,
              child: Text("Carregar $num itens por vez"),
            ) 
          ).toList(),
          onSelected: (number){
            dataService.numberOfItems = number;
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
    var state = useState(1);

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
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
      selectedItemColor: Theme.of(context).brightness == Brightness.dark ? customSwatchSecundary : customSwatch,
    );
  }
}

class DataTableWidget extends HookWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;
  final Function(String) onSearchChanged;

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const [],
    this.propertyNames= const [],
    required this.onSearchChanged
  });

  @override
  Widget build(BuildContext context) {
    final sortAscending = useState(true);
    final sortColumnIndex = useState(0);
    final searchQuery = useState('');

    List filteredObjects = jsonObjects.where((obj) {
      return propertyNames.any((propName) =>
          obj[propName].toLowerCase().contains(searchQuery.value.toLowerCase()));
    }).toList();


    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Container(
              width: 600,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar...',
                  iconColor: Theme.of(context).brightness == Brightness.dark ? customSwatchSecundary : customSwatch,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {
                  searchQuery.value = value; 
                  onSearchChanged(value); 
                },
              ),
            ),
          ),
          SingleChildScrollView(
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
                        color: Colors.grey.withOpacity(0.60),
                      ),
                    ],
                  ),
                  child: DataTable(
                    sortAscending: sortAscending.value,
                    sortColumnIndex: sortColumnIndex.value,
                    columns: columnNames.map(
                      (name) => DataColumn(
                        onSort: (columnIndex, ascending) {
                          sortColumnIndex.value = columnIndex;
                          sortAscending.value = !sortAscending.value;
                          dataService.ordenarEstadoAtual(
                              propertyNames[columnIndex], sortAscending.value);
                        },
                        label: Expanded(
                          child: Text(name, style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 16))
                        )
                      )
                    ).toList(),
                    rows: filteredObjects.map(
                      (obj) => DataRow(
                        cells: propertyNames.map(
                          (propName) => DataCell(Text(obj[propName])))
                        .toList()
                      ),
                    ).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
