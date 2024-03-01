import 'package:flutter/material.dart';

class ScorecardScreen extends StatefulWidget {
  final dynamic fight;
  final String? venue;

  const ScorecardScreen({Key? key, required this.fight, this.venue})
      : super(key: key);

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen> {
  @override
  Widget build(BuildContext context) {
    // Extracting relevant data
    final String fighterA =
        '${widget.fight['homefighter']['first_name']} ${widget.fight['homefighter']['last_name']}';
    final String fighterB =
        '${widget.fight['awayfighter']['first_name']} ${widget.fight['awayfighter']['last_name']}';
    final int rounds = widget.fight['rounds'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Fight'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '$fighterA vs $fighterB',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildScorecard(rounds),
          ],
        ),
      ),
    );
  }

  Widget _buildScorecard(int rounds) {
    List<Widget> scoreRows = [];

    // Header row
    scoreRows.add(Row(
      children: List.generate(rounds, (index) {
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.grey.shade300,
            child: Text(
              'Round ${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }),
    ));

    // Boxer A row
    scoreRows.add(Row(
      children: List.generate(rounds, (index) {
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              '10', // Replace this with the actual score for boxer A in each round
            ),
          ),
        );
      }),
    ));

    // Boxer B row
    scoreRows.add(Row(
      children: List.generate(rounds, (index) {
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              '9', // Replace this with the actual score for boxer B in each round
            ),
          ),
        );
      }),
    ));

    return Column(
      children: scoreRows,
    );
  }
}
