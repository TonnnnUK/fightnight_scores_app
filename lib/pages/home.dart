import 'package:flutter/material.dart';
import '../components/event_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EventCard(),
            EventCard(),
            EventCard(),
            EventCard(),
            EventCard(),
            EventCard(),
          ],
        ),
      ),
    );
  }
}