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
    final int rounds = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scorecard - $fighterA vs $fighterB',
          style: const TextStyle(fontSize: 14.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.grey.shade300,
                    child: Text(
                      fighterA,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.grey.shade300,
                    child: const Text(
                      'Round',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.grey.shade300,
                    child: Text(
                      fighterB,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            _buildScorecard(rounds),
            _buildAddScoresButton(rounds),
          ],
        ),
      ),
    );
  }

  Widget _buildScorecard(int rounds) {
    List<Widget> scoreRows = [];

    // Score rows
    for (int i = 0; i < rounds; i++) {
      final String scoreA =
          '10'; // Replace this with the actual score for boxer A in each round
      final String scoreB =
          '9'; // Replace this with the actual score for boxer B in each round
      final int roundNumber = i + 1;

      scoreRows.add(Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(scoreA),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('$roundNumber'),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(scoreB),
            ),
          ),
        ],
      ));
    }

    return Column(
      children: scoreRows,
    );
  }

  Widget _buildAddScoresButton(rounds) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: () {
          _showScoreDialog(context);
        },
        child: Text('Score Round ${rounds + 1}'),
      ),
    );
  }

  void _showScoreDialog(BuildContext context) {
    // Initialize variables
    int homeMargin = 50; // Initial value for home margin
    int awayMargin = 50; // Initial value for home margin
    String selectedReason = ''; // Selected reason
    String comments = ''; // Comments

    // List of selectable reasons
    List<String> reasons = [
      'Reason 1',
      'Reason 2',
      'Reason 3',
      'Reason 4',
    ];

    TextEditingController controllerA = TextEditingController(text: '10');
    TextEditingController controllerB = TextEditingController(text: '10');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: const Text('Add Round Scores'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fighter A'),
                  Text('Fighter B'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Number input for Fighter A score
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              int currentValue = int.parse(controllerA.text);
                              if (currentValue > 6) {
                                controllerA.text =
                                    (currentValue - 1).toString();
                              }
                            });
                          },
                          icon: const Icon(Icons.remove, size: 10.0),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: controllerA,
                            onChanged: (value) {
                              // Ensure value is within range
                              if (int.parse(value) > 10) {
                                controllerA.text = '10';
                              } else if (int.parse(value) < 6) {
                                controllerA.text = '6';
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              int currentValue = int.parse(controllerA.text);
                              if (currentValue < 10) {
                                controllerA.text =
                                    (currentValue + 1).toString();
                              }
                            });
                          },
                          icon: const Icon(Icons.add, size: 10.0),
                        ),
                      ],
                    ),
                  ),
                  // Number input for Fighter B score
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              int currentValue = int.parse(controllerB.text);
                              if (currentValue > 6) {
                                controllerB.text =
                                    (currentValue - 1).toString();
                              }
                            });
                          },
                          icon: const Icon(Icons.remove, size: 10.0),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: controllerB,
                            onChanged: (value) {
                              // Ensure value is within range
                              if (int.parse(value) > 10) {
                                controllerB.text = '10';
                              } else if (int.parse(value) < 6) {
                                controllerB.text = '6';
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              int currentValue = int.parse(controllerB.text);
                              if (currentValue < 10) {
                                controllerB.text =
                                    (currentValue + 1).toString();
                              }
                            });
                          },
                          icon: const Icon(Icons.add, size: 10.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Winning Margin'),
              Slider(
                inactiveColor: const Color(0xFF444444),
                value: homeMargin.toDouble(),
                min: 0,
                max: 100,
                divisions: 20,
                label: homeMargin.toString(),
                onChanged: (value) {
                  setState(() {
                    homeMargin = value.round();
                    awayMargin = 100 - value.round();
                  });

                  print('Winning margin - $homeMargin - $awayMargin');
                },
              ),
              const SizedBox(height: 20),
              const Text('Select Reason'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: reasons.map((reason) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedReason = reason;
                      });
                      print('selected reason: $reason');
                    },
                    child: Row(
                      children: [
                        Radio(
                          value: reason,
                          groupValue: selectedReason,
                          onChanged: (value) {
                            setState(() {
                              selectedReason = value.toString();
                            });
                          },
                        ),
                        Text(reason),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('Comments'),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Enter comments'),
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    comments = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // You can access homeMargin, awayMargin, selectedReason, and comments here
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
