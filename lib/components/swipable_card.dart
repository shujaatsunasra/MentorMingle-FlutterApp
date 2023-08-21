import 'package:flutter/material.dart';

import '../pages/detailed_page.dart';
import '../theme.dart';

class SwipableCardStackWidget extends StatefulWidget {
  final List<CardData> cardDataList;

  SwipableCardStackWidget({required this.cardDataList});

  @override
  _SwipableCardStackWidgetState createState() =>
      _SwipableCardStackWidgetState();
}

class _SwipableCardStackWidgetState extends State<SwipableCardStackWidget> {
  int currentIndex = 0;
  PageController _pageController = PageController();
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateEntrance();
    });
  }

  void _animateEntrance() async {
    for (int i = 0; i < widget.cardDataList.length; i++) {
      await Future.delayed(Duration(milliseconds: 300));
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextCard() {
    if (!_isAnimating) {
      _isAnimating = true;
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          currentIndex = (currentIndex + 1) % widget.cardDataList.length;
          _isAnimating = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400, // Adjust as needed
          child: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0) {
                _nextCard();
              }
            },
            child: GestureDetector(
              onTap: () {
                // Navigate to the DetailPage with the selected card data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      cardData: widget.cardDataList[currentIndex],
                    ),
                  ),
                );
              },
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.cardDataList.length,
                itemBuilder: (context, index) {
                  return CardItem(
                    cardData: widget.cardDataList[index],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final CardData cardData;

  CardItem({
    required this.cardData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(85))),
      color: Colors.white60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              cardData.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardData.subHeading,
                  style: TextStyle(fontSize: 16, color: AppTheme.kGreyShade800),
                ),
                SizedBox(height: 4),
                Text(
                  cardData.heading,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.kGreyShade800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  cardData.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.kGreyShade800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardData {
  final String imagePath;
  final String subHeading;
  final String heading;
  final String description;

  CardData({
    required this.imagePath,
    required this.subHeading,
    required this.heading,
    required this.description,
  });
}
