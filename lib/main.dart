import 'package:fightnight_scores/pages/events.dart';
import 'package:fightnight_scores/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fighnight Scores',
        theme: ThemeData(
          primaryColor: Color(0xFF790000),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: AppController(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  
  //notifyListeners();

}

class AppController extends StatefulWidget {
  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

  Widget page;
  switch (selectedIndex) {
    case 0:
      page = HomePage();
      break;
    case 1:
      page = EventsPage();
      break;
    default:
      throw UnimplementedError('no widget for $selectedIndex');
  }

    return LayoutBuilder(
      builder: (context, constraints) {
        final theme = Theme.of(context);

        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.edit_document),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  selectedIconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
                  indicatorColor: theme.colorScheme.primary, 
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFFE6E6E6),
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}