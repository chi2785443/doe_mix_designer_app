import 'package:flutter/material.dart';
import '../components.dart';

class Result_Page extends StatelessWidget {
  const Result_Page({
    super.key,
    required this.standardDeviationResult,
    required this.defectiveResult,
    required this.targetMeanStrengthResult,
    required this.freeWaterRatioResult,
    required this.freeWaterContentResult,
    required this.cementContentResult,
    required this.wetdensityofConcretetResult,
    required this.totalAggregateContentResult,
    required this.fineAggregateContentResult,
    required this.percentageofFineAggregateResult,
    required this.coasreAggregateContentResult,
    required this.cementRatioResult,
    required this.fineAggRatioResult,
    required this.coasreAggRatioResult,
    required this.rawCementRatioResult,
    required this.rawFineAggRatioResult,
    required this.rawCoasreAggRatioResult,
  });

  final String standardDeviationResult;
  final String defectiveResult;
  final String targetMeanStrengthResult;
  final String freeWaterRatioResult;
  final String freeWaterContentResult;
  final String cementContentResult;
  final String wetdensityofConcretetResult;
  final String totalAggregateContentResult;
  final String percentageofFineAggregateResult;
  final String fineAggregateContentResult;
  final String coasreAggregateContentResult;
  final String cementRatioResult;
  final String fineAggRatioResult;
  final String coasreAggRatioResult;
  final String rawCementRatioResult;
  final String rawFineAggRatioResult;
  final String rawCoasreAggRatioResult;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'YOUR RESULT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    color: const Color(0xFFBDBDBD),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'CONCRETE MIX RATIO',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$cementRatioResult:$fineAggRatioResult:$coasreAggRatioResult',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Actually ($rawCementRatioResult : $rawFineAggRatioResult : $rawCoasreAggRatioResult)',
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Variables',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Values',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Resultcard(
                          title: 'Standard Deviation(s)',
                          value: standardDeviationResult,
                        ),
                        Resultcard(
                          title: 'Defective(k)',
                          value: defectiveResult,
                        ),
                        Resultcard(
                          title: 'Target Mean Strength(fm)',
                          value: '$targetMeanStrengthResult N/mm2',
                        ),
                        Resultcard(
                          title: 'Free Water-cement Ratio(Fw/c)',
                          value: freeWaterRatioResult,
                        ),
                        Resultcard(
                          title: 'Free Water content(Fwc)',
                          value: '$freeWaterContentResult  kg/m3',
                        ),
                        Resultcard(
                          title: 'Cement Content(Cc)',
                          value: '$cementContentResult kg/m3',
                        ),
                        Resultcard(
                          title: 'Concrete wet-density(Wdcc)',
                          value: '$wetdensityofConcretetResult kg/m3',
                        ),
                        Resultcard(
                          title: 'Total Aggregate Content(Ac)',
                          value: '$totalAggregateContentResult kg/m3',
                        ),
                        Resultcard(
                          title: 'Percent of Fine Aggregate(Pfa)',
                          value: '$percentageofFineAggregateResult %',
                        ),
                        Resultcard(
                          title: 'Fine Aggregate Content(Fa)',
                          value: '$fineAggregateContentResult kg/m3',
                        ),
                        Resultcard(
                          title: 'Coarse Aggregate Content(Ca)',
                          value: '$coasreAggregateContentResult kg/m3',
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              color: const Color(0xFFFF5252),
              width: double.infinity,
              height: 50,
              child: const Center(
                  child: Text(
                'RE-CALCULATE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              )),
            ),
          ),
        ]),
      ),
    );
  }
}
