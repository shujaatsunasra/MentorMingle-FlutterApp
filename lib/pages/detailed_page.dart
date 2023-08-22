import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slacker/theme.dart';
import 'package:slacker/components/swipable_card.dart';

class DetailPage extends StatefulWidget {
  final CardData cardData;

  const DetailPage({Key? key, required this.cardData}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late AnimationController _loadingAnimationController;
  late Animation<double> _moneyAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _loadingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _moneyAnimation = Tween<double>(begin: 0, end: 109).animate(
      CurvedAnimation(
        parent: _loadingAnimationController,
        curve: Curves.linear,
      ),
    );

    // Trigger loading animation after a delay
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _loadingAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _loadingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Text(
            widget.cardData.heading,
            style: GoogleFonts.shareTech(
              color: AppTheme.kPrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.kPrimaryColor),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {
              if (_animationController.isAnimating) {
                _animationController.stop();
              } else {
                _animationController.repeat(reverse: true);
              }
            },
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                );
              },
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cardData.subHeading,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.kScaffoldBackgroundColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'This course lecture is related to ${widget.cardData.subHeading}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppTheme.kScaffoldBackgroundColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.cardData.description,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppTheme.kSubheadingColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'In the immersive world of education, every detail matters. Welcome to a learning experience that transcends the ordinary—where aesthetics meet functionality and engagement is paramount.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 35),
                // Animated price container with loading animation
                AnimatedBuilder(
                  animation: _loadingAnimationController,
                  builder: (context, child) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color:
                            AppTheme.kScaffoldBackgroundColor.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'PRICE : ',
                              style: GoogleFonts.shareTech(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              '\$ ',
                              style: GoogleFonts.bebasNeue(
                                fontSize: 35,
                                fontWeight: FontWeight.w100,
                                color: Colors.white70,
                              ),
                            ),
                            // Money animation for the dollar text
                            AnimatedBuilder(
                              animation: _moneyAnimation,
                              builder: (context, child) {
                                return Text(
                                  _moneyAnimation.value.toStringAsFixed(0),
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white70,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    // Add your enrollment logic here
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Enroll Now',
                        style: TextStyle(
                          color: AppTheme.kScaffoldBackgroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
