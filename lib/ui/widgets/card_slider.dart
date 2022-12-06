import 'dart:math';

import 'package:credit_card_animation/model/card_model.dart';
import 'package:credit_card_animation/utils/extensions/context_extension.dart';
import 'package:credit_card_animation/utils/i18n.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  final double height;
  final Function(bool) confirm;
  const CardSlider({
    Key? key,
    required this.height,
    required this.confirm,
  }) : super(key: key);

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  late double positionY_line1;
  late double positionY_line2;
  late List<CardInfo> _cardInfoList;
  late double _middleAreaHeight;
  late double _outsiteCardInterval;
  late double scrollOffsetY;

  @override
  void initState() {
    super.initState();
    positionY_line1 = widget.height * 0.1;
    positionY_line2 = positionY_line1 + 200;
    widget.confirm(false);

    _middleAreaHeight = positionY_line2 - positionY_line1;
    _outsiteCardInterval = 30.0;
    scrollOffsetY = 0.0;

    _cardInfoList = [
      CardInfo(
        userName: "CHARLES ALBERT".i18n,
        leftColor: Color.fromARGB(255, 234, 94, 190),
        rightColor: Color.fromARGB(255, 224, 63, 92),
        numberCard: "5434 3443 654453",
        cardCategory: "VISA",
      ),
      CardInfo(
        userName: "CHARLES ALBERT CP".i18n,
        leftColor: Color.fromARGB(255, 10, 10, 10),
        rightColor: Color.fromARGB(255, 10, 10, 10),
        numberCard: "3324 4242 2322 4234",
        cardCategory: "MASTER",
      ),
      CardInfo(
        userName: "CHARLES ALBERT".i18n,
        leftColor: Colors.pinkAccent,
        rightColor: Colors.pinkAccent,
        numberCard: "3324 4242 2211 4212",
        cardCategory: "VISA",
      ),
      CardInfo(
          userName: "CHARLES ALBERT CP".i18n,
          leftColor: Color(0xFF0B258A),
          rightColor: Color.fromARGB(255, 49, 69, 147),
          numberCard: "5324 2242 1322 3234",
          cardCategory: "MASTER",
      ),
      CardInfo(
        userName: "CHARLES ALBERT CP".i18n,
        leftColor: Colors.red,
        rightColor: Colors.redAccent,
        numberCard: "5321 5242 3322 1234",
        cardCategory: "VISA",
      ),
      CardInfo(
        userName: "CHARLES ALBERT CP".i18n,
        leftColor: Color.fromARGB(255, 229, 190, 35),
        rightColor: Colors.redAccent,
        numberCard: "5224 1242 1322 4234",
        cardCategory: "VISA",
      ),
      CardInfo(
        userName: "CHARLES ALBERT".i18n,
        leftColor: Color.fromARGB(255, 85, 137, 234),
        rightColor: Color.fromARGB(255, 10, 10, 10),
        numberCard: "5321 2222 4322 2234",
        cardCategory: "MASTER",
      ),
      CardInfo(
        userName: "CHARLES ALBERT CP".i18n,
        leftColor: Color.fromARGB(255, 171, 51, 75),
        rightColor: Color.fromARGB(255, 224, 63, 92),
        numberCard: "2324 1242 4322 3234",
        cardCategory: "MASTER",
      ),
    ];

    for (int i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[i];
      if (i == 0) {
        cardInfo.positionY = positionY_line1;
        cardInfo.opacity = 1.0;
        cardInfo.rotate = 1.0;
        cardInfo.scale = 1.0;
      } else {
        cardInfo.positionY = positionY_line2 + (i - 1) * 30;
        cardInfo.opacity = 0.7 - (i - 1) * 0.1;
        cardInfo.rotate = -60;
        cardInfo.scale = 0.9;
      }
    }

    _cardInfoList = _cardInfoList.reversed.toList();
  }

  _cardBuild() {
    List widgetList = [];

    for (CardInfo cardInfo in _cardInfoList) {
      widgetList.add(Positioned(
        top: cardInfo.positionY,
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(pi / 180 * cardInfo.rotate)
            ..scale(cardInfo.scale),
          alignment: Alignment.topCenter,
          child: Opacity(
            opacity: cardInfo.opacity,
            child: Container(
              width: 300,
              height: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 10,
                        offset: Offset(5, 10))
                  ],
                  color: Colors.red,
                  gradient: LinearGradient(
                      colors: [cardInfo.leftColor, cardInfo.rightColor])),
              child: Stack(children: [
                // * Number
                Positioned(
                  top: 130,
                  left: 20,
                  child: Text(
                    cardInfo.numberCard!,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.5,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),

                // * Card Name
                Positioned(
                  top: 160,
                  left: 20,
                  child: Text(
                    cardInfo.userName,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.5,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                // * network
                Positioned(
                  top: 30,
                  right: 70,
                  child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset(
                        "assets/globe.png",
                        // color: Colors.go,
                      )),
                ),
                // * sim card

                Positioned(
                  left: 0,
                  top: 70,
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 80,
                        // color: Colors.deepOrange,
                        child: Image.asset(
                          "assets/sim.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 25,
                        child: Image.asset(
                          "assets/signal.png",
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // * Card Logo
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: cardInfo.cardCategory == "MASTER" ? Image.asset("assets/mastercardLogo.png") : Image.asset("assets/visalogo.png"),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ));
    }

    return widgetList;
  }

  // * position update function

  void _updateCardPosition(double offsetY) {
    scrollOffsetY += offsetY;

    void updatePosition(CardInfo cardInfo, double firstCardAreaIdx, int index) {
      // cardInfo.positionY += offsetY;
      double currentCardAreaIdx = firstCardAreaIdx + index;
      if (currentCardAreaIdx < 0) {
        cardInfo.positionY = positionY_line1 + currentCardAreaIdx * 5;

        cardInfo.scale =
            1.0 - 0.2 / 10 * (positionY_line1 - cardInfo.positionY);

        if (cardInfo.scale < 0.8) cardInfo.scale = 0.8;
        if (cardInfo.scale > 1) cardInfo.scale = 1.0;

        // * rotate card
        cardInfo.rotate = -90.0 / 5 * (positionY_line1 - cardInfo.positionY);

        if (cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -90.0) cardInfo.rotate = -90.0;

        // Opacity 1.0 --> 0.7
        cardInfo.opacity =
            1.0 - 0.7 / 5 * (positionY_line1 - cardInfo.positionY);

        if (cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
        if (cardInfo.opacity > 1) cardInfo.opacity = 1.0;
      } else if (currentCardAreaIdx >= 0 && currentCardAreaIdx < 1) {
        cardInfo.scale = 1.0 -
            0.1 /
                (positionY_line2 - positionY_line1) *
                (cardInfo.positionY - positionY_line1);
        if (cardInfo.scale < 0.9) cardInfo.scale = 0.9;
        if (cardInfo.scale > 1) cardInfo.scale = 1.0;
        // move 1:1
        cardInfo.positionY =
            positionY_line1 + currentCardAreaIdx * _middleAreaHeight;
        // * rotate card
        cardInfo.rotate = -60.0 /
            (positionY_line2 - positionY_line1) *
            (cardInfo.positionY - positionY_line1);
        if (cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -60.0) cardInfo.rotate = -60.0;

        // Opacity
        cardInfo.opacity = 1.0 -
            0.3 /
                (positionY_line2 - positionY_line1) *
                (cardInfo.positionY - positionY_line1);
        if (cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
        if (cardInfo.opacity > 1) cardInfo.opacity = 1.0;
      } else if (currentCardAreaIdx >= 1) {
        cardInfo.positionY =
            positionY_line2 + (currentCardAreaIdx - 1) * _outsiteCardInterval;
        cardInfo.rotate = -60.0;
        cardInfo.scale = 0.9;
        cardInfo.opacity = 0.7;
      }
    }

    double firstCardAreaIdx = scrollOffsetY / _middleAreaHeight;
    print(firstCardAreaIdx);
    setState(() {
      // CardInfo cardInfo = _cardInfoList.last;
      // updatePosition(cardInfo, firstCardAreaIdx, 0);
    });

    for (int i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[_cardInfoList.length - 1 - i];
      updatePosition(cardInfo, firstCardAreaIdx, i);
      setState(() {
        // cardInfo.positionY += offsetY;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails d) {
        // print(d.delta.dy);

        _updateCardPosition(d.delta.dy);
      },
      onVerticalDragEnd: (DragEndDetails d) {
        scrollOffsetY =
            (scrollOffsetY / _middleAreaHeight).round() * _middleAreaHeight;
        _updateCardPosition(0);
      },
      child: Container(
        width: context.width,
        // color: Color.fromARGB(255, 230, 228, 232),
        decoration: BoxDecoration(
            color: Color(0xFF0B258A).withOpacity(.1),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
        // color: Colors.amber,
        child: Stack(alignment: Alignment.topCenter, children: [
          // * top title
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "YOUR SECURED CARD".i18n,
                style: TextStyle(
                    color: Color.fromARGB(255, 18, 71, 162),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
          // * line 1
          ,
          // Positioned(
          //   top: positionY_line1,
          //   child: Container(
          //     height: 1,
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.red,
          //   ),
          // ),

          ..._cardBuild(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(0, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ])),
            ),
          ),
          // * line 2
          // Positioned(
          //   top: positionY_line2,
          //   child: Container(
          //     height: 1,
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.red,
          //   ),
          // ),

          // * bottom row
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.keyboard,
                      color: Colors.grey,
                      size: 35,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  TextButton(
                      onPressed: () {
                        widget.confirm(true);
                        print("tab");
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                                color: Color(0xFF0B258A).withOpacity(.5),
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ],
                          shape: StadiumBorder(),
                          color: Color(0xFF0B258A),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm \$5400".i18n,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.mic,
                      color: Colors.grey,
                      size: 35,
                    ),
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
