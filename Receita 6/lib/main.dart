import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class DataService{
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);
  List<String> _columnNames = ["Nome", "Estilo", "IBU"];
  List<String> _propertyNames = ["name", "style", "ibu"];

  void carregar(index){
  if (index == 0) {
    carregarCafes();
    _columnNames = ["Nome", "Sabor", "Intensidade"];
    _propertyNames = ["name", "flavor", "intensity"];
  }
  else if (index == 1) {
    carregarCervejas();
    _columnNames = ["Nome", "Estilo", "IBU"];
    _propertyNames = ["name", "style", "ibu"];
  }
  else {
    carregarNacoes();
    _columnNames = ["Nome", "Localização", "Idioma"];
    _propertyNames = ["name", "place", "language"];
  }
}

  void carregarCafes(){
    tableStateNotifier.value = [
      {"name": "Caturra", "flavor": "Doce", "intensity": "Leve"},
      {"name": "Catuaí", "flavor": "Frutado", "intensity": "Média"},
      {"name": "Bourbon", "flavor": "Floral", "intensity": "Suave"},
      {"name": "Typica", "flavor": "Achocolatado", "intensity": "Média"},
      {"name": "Geisha", "flavor": "Cítrico", "intensity": "Média"},
      {"name": "Maragogipe", "flavor": "Nutty", "intensity": "Forte"},
      {"name": "Pacamara", "flavor": "Picante", "intensity": "Forte"},
      {"name": "Mundo Novo", "flavor": "Terra", "intensity": "Média"},
      {"name": "Sarchimor", "flavor": "Amargo", "intensity": "Forte"},
      {"name": "Bourbon Amarelo", "flavor": "Doce", "intensity": "Média"},
      {"name": "SL28", "flavor": "Cítrico", "intensity": "Média"},
      {"name": "Pacas", "flavor": "Chocolate", "intensity": "Média"},
      {"name": "Acaia", "flavor": "Frutado", "intensity": "Leve"},
      {"name": "Batian", "flavor": "Amendoim", "intensity": "Forte"},
      {"name": "Bourbon Vermelho", "flavor": "Doce", "intensity": "Suave"}
    ];
  }

  void carregarCervejas(){
    tableStateNotifier.value = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
      {"name": "Guinness Draught", "style": "Dry Stout", "ibu": "45"},
      {"name": "Heineken Lager", "style": "Pale Lager", "ibu": "23"},
      {"name": "Sierra Nevada Pale Ale", "style": "American Pale Ale", "ibu": "38"},
      {"name": "Chimay Blue", "style": "Belgian Strong Dark Ale", "ibu": "30"},
      {"name": "Weihenstephaner Hefeweissbier", "style": "Hefeweizen", "ibu": "14"},
      {"name": "Stone IPA", "style": "India Pale Ale", "ibu": "70"},
      {"name": "Pilsner Urquell", "style": "Czech Pilsner", "ibu": "40"},
      {"name": "Samuel Adams Boston Lager", "style": "Vienna Lager", "ibu": "30"},
      {"name": "Boddingtons Pub Ale", "style": "English Bitter", "ibu": "38"},
      {"name": "Hoegaarden Witbier", "style": "Witbier", "ibu": "15"},
      {"name": "Paulaner Oktoberfest Bier", "style": "Märzen", "ibu": "20"},
      {"name": "Founders Breakfast Stout", "style": "American Stout", "ibu": "60"}
    ];
  }

  void carregarNacoes(){
    tableStateNotifier.value = [
      {"name": "Brasil", "place": "América do Sul", "language": "Português"},
      {"name": "Estados Unidos", "place": "América do Norte", "language": "Inglês"},
      {"name": "China", "place": "Ásia Oriental", "language": "Chinês"},
      {"name": "Índia", "place": "Ásia Meridional", "language": "Hindi"},
      {"name": "Rússia", "place": "Eurásia", "language": "Russo"},
      {"name": "Japão", "place": "Ásia Oriental", "language": "Japonês"},
      {"name": "Alemanha", "place": "Europa Central", "language": "Alemão"},
      {"name": "Reino Unido", "place": "Europa Ocidental", "language": "Inglês"},
      {"name": "França", "place": "Europa Ocidental", "language": "Francês"},
      {"name": "Canadá", "place": "América do Norte", "language": "Inglês/Francês"},
      {"name": "Austrália", "place": "Oceania", "language": "Inglês"},
      {"name": "Itália", "place": "Europa Meridional", "language": "Italiano"},
      {"name": "Espanha", "place": "Europa Meridional", "language": "Espanhol"},
      {"name": "Coreia do Sul", "place": "Ásia Oriental", "language": "Coreano"},
      {"name": "México", "place": "América do Norte", "language": "Espanhol"}
    ];
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
      title: "Receita 6 By Luiz",
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
            
            return DataTableWidget(
              jsonObjects:value, 
              propertyNames: propertyNames, 
              columnNames: columnNames
            );
          }
        ),
        bottomNavigationBar: NewNavBar(
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

class NewNavBar extends HookWidget {
  var itemSelectedCallback;
  final List<IconData> icons;
  final List<Color> iconColors;
  final List<String> labels;

  NewNavBar({this.itemSelectedCallback, required this.icons, required this.iconColors, required this.labels}){
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
        itemSelectedCallback(index);
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
                      .map((propName) => DataCell(Text(obj[propName]))
                    ).toList()
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
