import 'package:flutter/material.dart';
import 'package:fightnight_scores/pages/webview.dart';
import '../pages/scorecard.dart';

class FightItem extends StatelessWidget {
  final dynamic fightData;
  final String fighterA;
  final String fighterB;
  final String date;
  final int rounds;
  final Map<String, dynamic>? homefighter;
  final Map<String, dynamic>? awayfighter;
  final String? venue;

  const FightItem({
    required this.fightData,
    required this.fighterA,
    required this.fighterB,
    required this.date,
    required this.rounds,
    this.homefighter,
    this.awayfighter,
    this.venue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract first and last names from homefighter and awayfighter maps
    final String fightId = '${fightData['id']}';
    final String fighterA =
        '${homefighter?['first_name']} ${homefighter?['last_name']}';
    final String fighterB =
        '${awayfighter?['first_name']} ${awayfighter?['last_name']}';
    final String fightSlug = '${fightData['slug']}';

    return Card(
      color: const Color(0xFFFFFFFF),
      child: ExpansionTile(
        // backgroundColor: Colors.grey.shade200,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fighterA,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF1C1A96),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5.0),
            const Text(
              'vs',
              style: TextStyle(fontSize: 12.0, color: Colors.black),
            ),
            const SizedBox(width: 5.0),
            Text(
              fighterB,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF961A1A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        children: [
          const SizedBox(height: 10.0),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.red.shade900), // Change the background color
              foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.white), // Change the text color
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 16), // Change the text size
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // Adjust padding
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5), // Adjust border radius
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScorecardScreen(fight: fightData, venue: venue),
                ),
              );
            },
            child: const Text('Create a scorecard'),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewContainer(
                        url:
                            'https://fight-score.com/analysis/$fightSlug/combined-scorecard',
                      ),
                    ),
                  );
                },
                child: const Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text('Analysis'),
                            Icon(Icons.analytics_outlined),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScorecardScreen(
                        fight: 'Average scorecard screen',
                      ), // Pass the fight ID or other necessary data
                    ),
                  );
                },
                child: const Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text('Average'),
                            Icon(Icons.view_column_outlined),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
