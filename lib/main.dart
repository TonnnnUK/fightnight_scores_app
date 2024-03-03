import 'package:fightnight_scores/components/bottom_nav.dart';
import 'package:fightnight_scores/components/drawer_menu.dart';
import 'package:fightnight_scores/pages/analysis.dart';
import 'package:fightnight_scores/pages/boxers.dart';
import 'package:fightnight_scores/pages/events.dart';
import 'package:fightnight_scores/pages/home.dart';
import 'package:fightnight_scores/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,

          // Define the default brightness and colors.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            brightness: Brightness.light,
          ),

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
            // ···
            titleLarge: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

        // ThemeData(
        //   primaryColor: const Color(0xFF790000),
        //   useMaterial3: true,
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900),
        // ),
        title: 'Fightnight Scores',
        home: AppController(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  bool isLoggedIn = false;
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = Provider.of<MyAppState>(context).isLoggedIn;
    return AppController();
  }
}

class AppController extends StatefulWidget {
  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {
  var selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Widget page;
    String appBarTitle = '';

    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        appBarTitle = 'Home';
        break;
      case 1:
        page = const EventsPage();
        appBarTitle = 'Events';
        break;
      case 2:
        // Add new case for additional menu item
        page = const AnalysisPage();
        appBarTitle = 'Analysis';
        break;
      case 3:
        // Add new case for additional menu item
        page = const BoxersPage();
        appBarTitle = 'Boxers';
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      key: _scaffoldKey, // Set the scaffold key
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Open slide-out drawer screen
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
        backgroundColor: const Color(0xFF790000),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 16.0),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Consumer<MyAppState>(
              builder: (context, appState, _) {
                return appState.isLoggedIn
                    ? const Text('Account')
                    : const LoginPage();
              },
            ),
          ],
        ),
      ),
      drawer: DrawerMenu(
        onItemTapped: (index) {
          // Update the selectedIndex state when a menu item is tapped
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: page,
      bottomNavigationBar: BottomNav(
        selectedIndex: selectedIndex, // Pass selectedIndex value
        onItemTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
