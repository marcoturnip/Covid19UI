import 'package:covid19/constant.dart';
import 'package:covid19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(
                image: "assets/icons/coronadr.svg",
                textTop: "Get to know",
                textBottom: "About Covid-19.",
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Symptoms",
                      style: kTitleTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymtomsCard(
                          image: "assets/images/headache.png",
                          title: "Headache",
                          isActive: true,
                        ),
                        SymtomsCard(
                          image: "assets/images/caugh.png",
                          title: "Cough",
                        ),
                        SymtomsCard(
                          image: "assets/images/fever.png",
                          title: "Fever",
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text("Prevention", style: kTitleTextStyle),
                    SizedBox(height: 20),
                    PreventCard(
                      text:
                          "Since the start of the Coronavirus outbreak some places have fully embraced wearing facemask",
                      image: "assets/images/wear_mask.png",
                      title: "Wear face mask",
                    ),
                    PreventCard(
                      text:
                          "Since the start of the Coronavirus outbreak some places have fully embraced wearing facemask",
                      image: "assets/images/wash_hands.png",
                      title: "Wear face mask",
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 126,
                width: MediaQuery.of(context).size.width - 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/icons/forward.svg"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymtomsCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;

  const SymtomsCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 60,
            width: 90,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
