import 'package:doe_mixer/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:doe_mixer/constants.dart';
import 'package:doe_mixer/components.dart';
import 'package:doe_mixer/doe_calculation_brain.dart';

const activeColour = Color(0xFFF5F5F5);
const inActiveColour = Color(0xFF9E9E9E);

// const activeColour = Color(0xFF1D1E33);
// const inActiveColour = Color(0xFF111328);

enum StoneType { crushed, natural }

class Input_Page extends StatefulWidget {
  const Input_Page({super.key});

  @override
  State<Input_Page> createState() => _Input_PageState();
}

class _Input_PageState extends State<Input_Page> {
  Color naturalColour = inActiveColour;
  Color crushedColour = inActiveColour;

  Color tenAggSizeColour = inActiveColour;
  Color twentyAggSizeColour = inActiveColour;
  Color thirtyAggSizeColour = inActiveColour;

  StoneType? selectedStoneType;
  int slump = 0;
  int percentagePassing = 0;
  double fc = 0;
  int selectedAggType = 0;
  late int selectedAggSize;
  List<double> specificgravity = [2.4, 2.5, 2.6, 2.7, 2.8, 2.9];
  List<double> defective = [1, 2.5, 5, 10];
  double? _selectedSpecificGravity;
  double? _selectedDefective;

  void updateColour(int size) {
    if (size == 10) {
      if (tenAggSizeColour == inActiveColour) {
        tenAggSizeColour = activeColour;
        twentyAggSizeColour = inActiveColour;
        thirtyAggSizeColour = inActiveColour;
      } else {
        tenAggSizeColour = inActiveColour;
      }
    }
    if (size == 20) {
      if (twentyAggSizeColour == inActiveColour) {
        twentyAggSizeColour = activeColour;
        tenAggSizeColour = inActiveColour;
        thirtyAggSizeColour = inActiveColour;
      } else {
        twentyAggSizeColour = inActiveColour;
      }
    }
    if (size == 40) {
      if (thirtyAggSizeColour == inActiveColour) {
        thirtyAggSizeColour = activeColour;
        tenAggSizeColour = inActiveColour;
        twentyAggSizeColour = inActiveColour;
      } else {
        thirtyAggSizeColour = inActiveColour;
      }
    }
  }

  final TextEditingController _controller = TextEditingController();
  late double charateristicStrength;

  void _getIntvaluen() {
    try {
      charateristicStrength = double.parse(_controller.text);
    } catch (e) {
      charateristicStrength = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF212121),
        elevation: 20,
        title: const Text(
          'Mix design (DOE)',
          style: TextStyle(color: Color(0xFFF5F5F5)),
        ),
      ),
      body: ListView(
        children: [
          FlatCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'CONCRETE STRENGTH',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextField(
                      enabled: true,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _getIntvaluen();
                      },
                      style: const TextStyle(
                        fontFamily: 'worksans',
                      ),
                      textAlign: TextAlign.center,
                      decoration: kDecorationTextField),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    height: 10,
                    color: Color(0xFFFF5252),
                  ),
                ),
                const Text(
                  'SLUMP VALUE',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      slump.toString(),
                      style: kTextStyleBold,
                    ),
                    const Text(
                      'mm',
                      style: kTextStyle,
                    )
                  ],
                ),
                Slider(
                    value: slump.toDouble(),
                    min: 0.0,
                    max: 180.0,
                    activeColor: const Color(0xFFFF5252),
                    inactiveColor: const Color(0xFF757575),
                    onChanged: (double newValue) {
                      setState(() {
                        slump = newValue.toInt();
                      });
                    }),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFBDBDBD),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'TYPE OF AGGREGATE',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: ReusableCard(
                        colour: selectedStoneType == StoneType.natural
                            ? activeColour
                            : inActiveColour,
                        cardIcon: const Icon(Icons.landscape,
                            color: Color(0xFFFF5252)),
                        cardText: 'NATURAL',
                      ),
                      onTap: () {
                        selectedAggType = 1;
                        setState(() {
                          selectedStoneType = StoneType.natural;
                        });
                      },
                    ),
                    GestureDetector(
                      child: ReusableCard(
                        colour: selectedStoneType == StoneType.crushed
                            ? activeColour
                            : inActiveColour,
                        cardIcon: const Icon(Icons.construction,
                            color: Color(0xFFFF5252)),
                        cardText: 'CRUSHED',
                      ),
                      onTap: () {
                        selectedAggType = 2;
                        setState(() {
                          selectedStoneType = StoneType.crushed;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          //
          FlatCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'SPECIFIC GRAVITY (u)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFFF5252),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton(
                    hint: const Text('Select specific gravity?'),
                    isExpanded: true,
                    value: _selectedSpecificGravity,
                    items: specificgravity.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSpecificGravity = value!;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    height: 10,
                    color: Color(0xFF757575),
                  ),
                ),
                const Text(
                  'DEFECTIVE PERCENTAGE (%)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFFF5252),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton(
                    hint: const Text('Select defective percent?'),
                    isExpanded: true,
                    value: _selectedDefective,
                    items: defective.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDefective = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          FlatCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'PERCENTAGE PASSING (600um)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      percentagePassing.toString(),
                      style: kTextStyleBold,
                    ),
                    const Text(
                      '%',
                      style: kTextStyle,
                    )
                  ],
                ),
                Slider(
                    value: percentagePassing.toDouble(),
                    min: 0.0,
                    max: 100.0,
                    activeColor: const Color(0xFFFF5252),
                    inactiveColor: const Color(0xFF757575),
                    onChanged: (double newValue) {
                      setState(() {
                        percentagePassing = newValue.toInt();
                      });
                    }),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFBDBDBD),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'SELECT AGGREGATE SIZE',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: ReusableCard(
                        colour: tenAggSizeColour,
                        cardIcon: const Icon(
                          Icons.landscape,
                          color: Color(0xFFFF5252),
                        ),
                        cardText: '10mm',
                      ),
                      onTap: () {
                        setState(() {
                          updateColour(10);
                        });
                        selectedAggSize = 10;
                      },
                    ),
                    GestureDetector(
                      child: ReusableCard(
                        colour: twentyAggSizeColour,
                        cardIcon: const Icon(Icons.landscape,
                            color: Color(0xFFFF5252)),
                        cardText: '20mm',
                      ),
                      onTap: () {
                        setState(() {
                          updateColour(20);
                        });
                        selectedAggSize = 20;
                      },
                    ),
                    GestureDetector(
                      child: ReusableCard(
                        colour: thirtyAggSizeColour,
                        cardIcon: const Icon(Icons.landscape,
                            color: Color(0xFFFF5252)),
                        cardText: '40mm',
                      ),
                      onTap: () {
                        setState(() {
                          updateColour(40);
                        });
                        selectedAggSize = 40;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              DoeCalculationBrain calc = DoeCalculationBrain(
                fc: charateristicStrength,
                slump: slump,
                aggtype: selectedAggType,
                sg: _selectedSpecificGravity,
                defective: _selectedDefective,
                agg_size: selectedAggSize,
                Pp: percentagePassing,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result_Page(
                    standardDeviationResult:
                        calc.getStandardDeviation().toStringAsFixed(1),
                    defectiveResult: calc.getDefective().toString(),
                    targetMeanStrengthResult:
                        calc.getTargetMeanStrength().toStringAsFixed(1),
                    freeWaterRatioResult:
                        calc.getFreeWaterRatio().toStringAsFixed(2),
                    freeWaterContentResult:
                        calc.getFreeWaterContent().toStringAsFixed(0),
                    cementContentResult:
                        calc.getCementContent().toStringAsFixed(1),
                    wetdensityofConcretetResult:
                        calc.getWetdensityofConcrete().toStringAsFixed(1),
                    totalAggregateContentResult:
                        calc.getTotalAggregateContent().toStringAsFixed(1),
                    percentageofFineAggregateResult:
                        calc.getPercentageofFineAggregate().toStringAsFixed(1),
                    fineAggregateContentResult:
                        calc.getFineAggregateContent().toStringAsFixed(1),
                    coasreAggregateContentResult:
                        calc.getCoarseAggregateContent().toStringAsFixed(1),
                    cementRatioResult: calc.getCementRatio().toStringAsFixed(0),
                    fineAggRatioResult:
                        calc.getFineAggRatio().toStringAsFixed(0),
                    coasreAggRatioResult:
                        calc.getCoarseAggRatio().toStringAsFixed(0),
                    rawCementRatioResult:
                        calc.getCementRatio().toStringAsFixed(1),
                    rawFineAggRatioResult:
                        calc.getFineAggRatio().toStringAsFixed(1),
                    rawCoasreAggRatioResult:
                        calc.getCoarseAggRatio().toStringAsFixed(1),
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              color: const Color(0xFFFF5252),
              width: double.infinity,
              height: 50,
              child: const Center(
                  child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
