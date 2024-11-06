import 'package:flutter/material.dart';

class CountryDetailsWidget extends StatelessWidget {
  final String emoji;
  final String country;
  final String continent;

  const CountryDetailsWidget({
    super.key,
    required this.emoji,
    required this.country,
    required this.continent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 215, 214, 212),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Text(
                emoji,
                style: TextStyle(fontSize: 60),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    country,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                  Text(
                    continent,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
