import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerMenu extends StatelessWidget {
  final Function(int) onItemTapped; // Callback function
  const DrawerMenu({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      backgroundColor: const Color(0xFFF9F9F9),
      child: Container(
        color: Colors.grey.shade100,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF)
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/icons/fns-logo.svg', width: 140.0,),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/x.svg', width: 20.0),
                      const SizedBox(width: 10.0),
                      SvgPicture.asset('assets/icons/yt.svg', width: 20.0),
                    ],
                  ),
                  
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Menu'),
                    ],
                  ),
                ],
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
      ),
    );
  }
}
