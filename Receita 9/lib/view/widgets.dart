import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import '../data/data_service.dart';

MaterialColor customSwatch = MaterialColor(0xFFFF00EB, {
    50: Color(0xFFFF00EB),
    100: Color(0xFFFF00EB),
    200: Color(0xFFFF00EB),
    300: Color(0xFFFF00EB),
    400: Color(0xFFFF00EB),
    500: Color(0xFFFF00EB),
    600: Color(0xFFFF00EB),
    700: Color(0xFFFF00EB),
    800: Color(0xFFFF00EB),
    900: Color(0xFFFF00EB),
  });
MaterialColor customSwatchSecundary = MaterialColor(0xFFFF6F00, {
  50: Color(0xFFFF6F00),
  100: Color(0xFFFF6F00),
  200: Color(0xFFFF6F00),
  300: Color(0xFFFF6F00),
  400: Color(0xFFFF6F00),
  500: Color(0xFFFF6F00),
  600: Color(0xFFFF6F00),
  700: Color(0xFFFF6F00),
  800: Color(0xFFFF6F00),
  900: Color(0xFFFF6F00),
});

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}

class Selection {
  static const List<int> selection = [10, 15, 20];
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Receita 9 By Luiz",
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
            Icons.coffee,
            Icons.local_drink,
            Icons.public,
          ],
          iconColors: [
            Color.fromARGB(255, 125, 65, 0),
            Color.fromARGB(255, 255, 220, 0),
            Color.fromARGB(255, 0, 135, 0)
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
      title: Text("Visibility", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 28,
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
      selectedItemColor: Theme.of(context).brightness == Brightness.dark ? customSwatchSecundary : customSwatch,
      unselectedItemColor: Theme.of(context).brightness == Brightness.dark ? Colors.white.withOpacity(0.75) : Colors.black.withOpacity(0.5),
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
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.withOpacity(0.60) : Colors.grey.withOpacity(0.40),
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
