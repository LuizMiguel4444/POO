import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class Tradutor extends Translations {
  
  @override
  Map<String, Map<String, String>> get keys => {
    'pt_BR': {
      'title': 'Roteamento',
      'hello_world': 'Olá Mundo!',
      'lesson_routing': 'Aula - Roteamento',
      'page_1': 'Página 1',
      'page_2': 'Página 2',
      'home': 'Home',
      'second_page': 'Segunda Página',
      'third_page': 'Terceira Página',
      'back_to_home': 'Voltar para a Home',
    },
    'en_US': {
      'title': 'Routing',
      'hello_world': 'Hello World!',
      'lesson_routing': 'Lesson - Routing',
      'page_1': 'Page 1',
      'page_2': 'Page 2',
      'home': 'Home',
      'second_page': 'Second Page',
      'third_page': 'Third Page',
      'back_to_home': 'Back to Home',
    },
  };
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Routing By Luiz",
      translations: Tradutor(),
      locale: Locale('pt', 'BR'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      themeMode: _themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'title'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Get.find<ThemeController>().isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              Get.find<ThemeController>().toggleTheme();
            },
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                child: Text('Português'),
                value: 'pt_BR',
              ),
              PopupMenuItem<String>(
                child: Text('Inglês'),
                value: 'en_US',
              ),
            ],
            onSelected: (value) {
              Get.updateLocale(Locale(value));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hello_world'.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'lesson_routing'.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.primary),
            label: 'page_1'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.primary),
            label: 'page_2'.tr,
          ),
        ],
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.to(() => SecondPage());
              break;
            case 1:
              Get.to(() => ThirdPage());
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'second_page'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'back_to_home'.tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'third_page'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'back_to_home'.tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
