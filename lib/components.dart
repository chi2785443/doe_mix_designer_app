import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key,
      required this.colour,
      required this.cardText,
      required this.cardIcon});

  // Color colour;
  final Color colour;
  final Icon cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardIcon,
          Text(
            cardText,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class FlatCard extends StatelessWidget {
  const FlatCard({super.key, required this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFBDBDBD),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: cardChild,
    );
  }
}

class Resultcard extends StatelessWidget {
  const Resultcard({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF9E9E9E),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 15,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.red.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
