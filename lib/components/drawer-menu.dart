import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final Function(int) onItemTapped; // Callback function

  const DrawerMenu({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Other Page'),
            onTap: () {
              // Call the callback function with the index of the selected item
              onItemTapped(2);
              Navigator.pop(context); // Close the Drawer
            },
          ),
          ListTile(
            title: const Text('Another Page'),
            onTap: () {
              // Call the callback function with the index of the selected item
              onItemTapped(3);
              Navigator.pop(context); // Close the Drawer
            },
          ),
        ],
      ),
    );
  }
}
