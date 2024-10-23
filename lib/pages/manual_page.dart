import 'package:flutter/material.dart';
import 'input_page.dart';

class Manual_Page extends StatelessWidget {
  const Manual_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'USER MANUAL',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'THE MIX DESIGN PROCESS',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'This procedure simplifies and automate the DOE concrete mix process by transforming the graph coordinates into linear or polynomial equations by the use of python libraries algorithms and python development environment',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Input parameters required',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF9E9E9E),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 5,
                          bottom: 5,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: const Column(
                          children: [
                            Text(
                              '''1) Select a charateristic strength of concrete (Fc) \n\2) Select concrete slump value using the slider (mm) \n\3) Select the type of aggregate. either crushed or uncrushed. \n\4) Enter the specific gravity of the aggregate(u). \n\5) select the percentage defective. The constant k is derived from the mathematics of the normal distribution and increases as the
proportion of defectives is decreased \n\6) Enter the percentage passing of the fine aggregate, passing througn sieve 600um. \n\7) Select the maximun size of aggregate. ranging from 10mm - 20mm - 40mm. \n\8) Click on the calculate botton and the concrete mix design will be carried out behind the scene using this equations obtain. 
                              ''',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Output values to be obtained',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF9E9E9E),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 5,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: const Column(
                          children: [
                            Text(
                              '''1) Calculate target mean strength (Fm) \n\2)  find the free water ratio for an aggregate size, type of aggregate, slump of concrete for workability \n\3) Find the cement content, Cc. \n\4) Determine Wet density of concrete. \n\5) Find Total volume of aggregate \n\6) Determination of volume of fine aggregate based on aggregate size, free water-cement ratio and grading zone of sand (passing through 600 micron sieve). \n\7) Calculate coarse aggregate content. \n\8) Provide the concrete mix ratio. 
                              ''',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Input_Page(),
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
                'I have read the user manual',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFF5F5F5),
                ),
              )),
            ),
          ),
        ]),
      ),
    );
  }
}
