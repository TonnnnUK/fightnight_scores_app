import 'package:fightnight_scores/pages/webview.dart';
import 'package:flutter/material.dart';
import '../pages/scorecard.dart';

class FightItem extends StatefulWidget {
  const FightItem({
    super.key,
  });

  @override
  State<FightItem> createState() => _FightItemState();
}

class _FightItemState extends State<FightItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFF),
      child: ExpansionTile(
        backgroundColor: Colors.grey.shade200,
        title:
            const Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'Oleksandr Usyk',
            style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF1C1A96),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5.0),
          Text('vs'),
          SizedBox(width: 5.0),
          Text(
            'Anthony Joshua',
            style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF961A1A),
                fontWeight: FontWeight.bold),
          ),
        ]),
        children: [
          const SizedBox(
            height: 10.0,
          ),
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
                  builder: (context) => const ScorecardScreen(
                      fightId:
                          'Score the fight'), // Pass the fight ID or other necessary data
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
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewContainer(
                          url: 'https://fight-score.com'),
                    ),
                  )
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
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScorecardScreen(
                          fightId:
                              'Average scorecard screen'), // Pass the fight ID or other necessary data
                    ),
                  )
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
