import 'package:flutter/material.dart';
import 'package:fightnight_scores/components/fight_item.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final dynamic event;

  const EventCard({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final venueName = event['venue']['name'] ?? 'Unknown Event';
    final eventDate = formatDate(event['date']);
    final fightItems = event['fights'] ?? [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Card(
        color: const Color(0xFFECF7FC),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(venueName ?? 'Event Name'),
              Text(
                eventDate ?? 'Event Date',
                style: const TextStyle(fontSize: 11.0),
              ),
              const SizedBox(height: 10.0),
              Column(
                children: fightItems.map<Widget>((fightItem) {
                  return FightItem(
                    fightData: fightItem,
                    fighterA: fightItem['fighterA'],
                    fighterB: fightItem['fighterB'],
                    date: eventDate,
                    rounds: fightItem['rounds'],
                    homefighter: fightItem['homefighter'],
                    awayfighter: fightItem['awayfighter'],
                    venue: venueName,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatDate(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final formattedDate = DateFormat('E, d MMM yyyy').format(dateTime);
  return formattedDate;
}