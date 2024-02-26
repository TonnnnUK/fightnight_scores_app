import 'package:flutter/material.dart';

class ScorecardScreen extends StatefulWidget {
  final dynamic fight; // Add any necessary parameters here

  const ScorecardScreen({Key? key, required this.fight}) : super(key: key);

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Fight'),
      ),
      body: Center(
        child: Text('Fight ID: ${widget.fight}'), // Display the fight ID or other relevant information
      ),
    );
  }
}
