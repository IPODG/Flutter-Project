import 'package:flutter/material.dart';
import 'package:testme/Pages/about.dart';
import 'package:testme/Pages/home.dart';
import 'package:testme/Pages/contact.dart';
import 'package:testme/Pages/event.dart';
import 'package:testme/provider/theme_provider.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  static const String title = 'Light & Dark Theme';
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: title,
    themeMode: ThemeMode.system,
    theme: MyThemes.lightTheme,
  darkTheme: MyThemes.darkTheme,
  debugShowCheckedModeBanner: false,
  home: const MyHomePage(),
  );



}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: [
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              label: tabItem.title,
            )
        ],
      ),
    );
  }

}

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
  });

   static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: const HomePage(),
      icon: const Icon(Icons.home),
      title: "Home",
    ),

    TabNavigationItem(
      page: const AboutPage(),
      icon: const Icon(Icons.info),
      title: "About",
    ),
    TabNavigationItem(
      page: const ContactPage(),
      icon: const Icon(Icons.email),
      title: "Contact",
    ),
    TabNavigationItem(
      page: const EventPage(),
      icon: const Icon(Icons.event),
      title: "Event",
    ),

  ];
}


