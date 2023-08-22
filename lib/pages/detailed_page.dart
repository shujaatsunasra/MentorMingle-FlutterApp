import 'package:flutter/material.dart';
import 'package:slacker/theme.dart';

import '../components/swipable_card.dart';

class DetailPage extends StatelessWidget {
  final CardData cardData;

  const DetailPage({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cardData.heading),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/1.jpg')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                cardData.subHeading,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text(
                'This cource lecture is related to ${cardData.subHeading}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                cardData.description,
                style: const TextStyle(
                    fontSize: 16,
                    color: AppTheme.kSubheadingColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.030,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel nisl sit amet purus lacinia facilisis vel non nulla. Fusce vulputate tristique libero, vel pellentesque odio iaculis nec. ',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppTheme.kPrimaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    'Enroll Now',
                    style: TextStyle(
                        color: AppTheme.kScaffoldBackgroundColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
