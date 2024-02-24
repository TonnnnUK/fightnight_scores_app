import 'package:flutter/material.dart';
import 'fight_item.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Card(
        color: Color(0xFFECF7FC),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('MGM Grand'),
              Text(
                'Jan 20 2024',
                style: TextStyle(fontSize: 11.0),
              ),
              SizedBox(height: 10.0),
              FightItem(),
              FightItem()
            ],
          ),
        ),
      ),
    );
  }
}

