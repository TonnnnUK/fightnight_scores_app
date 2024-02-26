import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/event_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> upcomingEvents = [];
  List<dynamic> recentEvents = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final upcomingresponse =
        await http.get(Uri.parse('https://fight-score.com/api/events/upcoming'));
    if (upcomingresponse.statusCode == 200) {
      setState(() {
        upcomingEvents = json.decode(upcomingresponse.body);
      });
    } else {
      throw Exception('Failed to load events');
    }

    final recentResponse = await http.get(Uri.parse('https://fight-score.com/api/events/recent'));
    if (recentResponse.statusCode == 200) {
      final jsonData = json.decode(recentResponse.body); // Parse JSON response
      final recentEventData = jsonData['data']; // Access data under 'data' index
      setState(() {
        recentEvents = recentEventData;
      });
    } else {
      throw Exception('Failed to load events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15.0,),
            const Text('Upcoming Events'),
            const SizedBox(height: 15.0,),
            Column(
              children: upcomingEvents.map<Widget>((event) {
                return EventCard(
                  event: event
                );
              }).toList(),
            ),
            const SizedBox(height: 15.0,),
            const Text('Recent Events'),
            const SizedBox(height: 15.0,),
            Column(
              children: recentEvents.map<Widget>((event) {
                return EventCard(
                  event: event
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
