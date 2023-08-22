import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slacker/components/appbar.dart';
import 'package:slacker/components/swipable_card.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mqw * 0.1),
          child: Column(
            children: [
              SizedBox(
                height: mqh * 0.20,
                width: mqw,
                child: Stack(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.shareTech(
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0,
                          color: AppTheme.kGreyShade800,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Find Best\n',
                          ),
                          TextSpan(
                            text: 'Mentors',
                            style: GoogleFonts.bebasNeue(
                                color: AppTheme.kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 40),
                          ),
                          const TextSpan(text: ' For\n'),
                          const TextSpan(
                            text: 'You',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 80.0,
                      left: 70.0,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return OverlappingWidget(
                            images: [
                              'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
                              'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
                              'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.shareTech(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: AppTheme.kSubheadingColor,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Explore :',
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        color: AppTheme.kGreyShade800,
                      ),
                      children: const [
                        TextSpan(
                          text:
                              'Find Perfect Match For You,\n Meet Your Dream Skills ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mqh * 0.05,
              ),
              SwipableCardStackWidget(
                cardDataList: [
                  CardData(
                      imagePath: 'assets/images/1.jpg',
                      subHeading: 'UI UX Designer',
                      heading: 'Keol Risen',
                      description: '5 Years of Experience'),
                  CardData(
                      imagePath: 'assets/images/2.jpg',
                      subHeading: 'Penetration Expert',
                      heading: 'Perter Panter',
                      description: '3 Years of Experience'),
                  CardData(
                      imagePath: 'assets/images/3.jpg',
                      subHeading: 'Professional Photographer',
                      heading: 'Tommy Styles',
                      description: '2 Years of Experience'),
                  CardData(
                      imagePath: 'assets/images/4.jpg',
                      subHeading: 'Graphics Designer',
                      heading: 'Kenny Parse',
                      description: '3 Years of Experience'),
                  CardData(
                      imagePath: 'assets/images/5.jpg',
                      subHeading: 'React Developer',
                      heading: 'Harry Parker',
                      description: '3 Years of Experience'),
                  CardData(
                      imagePath: 'assets/images/6.jpg',
                      subHeading: 'Mongo-DB Expert',
                      heading: 'Deneal Parker',
                      description: '6 Years of Experience'),
                  CardData(
                      imagePath: 'assets/images/7.jpg',
                      subHeading: 'UI UX Designer',
                      heading: 'Zore Kaido',
                      description: '4 Years of Experience'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OverlappingWidget extends StatefulWidget {
  final List<String> images;

  const OverlappingWidget({Key? key, required this.images}) : super(key: key);

  @override
  _OverlappingWidgetState createState() => _OverlappingWidgetState();
}

class _OverlappingWidgetState extends State<OverlappingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _popAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _popAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < widget.images.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Transform.scale(
              scale: _popAnimation.value,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: CachedNetworkImage(
                  imageUrl: widget.images[i],
                  imageBuilder: (context, imageProvider) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    child: Align(
                      widthFactor: 0.5,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: imageProvider,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ... (other classes and imports)
