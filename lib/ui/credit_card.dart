
import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:credit_card_animation/utils/extensions/context_extension.dart';
import 'package:credit_card_animation/utils/i18n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/card_slider.dart';

class CreditCard extends StatefulWidget {
  CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  bool _confirm = false;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animationController.forward();
  }

  int _selectedIndex = 0;

  List<String> _tabs = ["Home", "Finance", "Cards", "Crypto", "History"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            padding: EdgeInsets.only(top: 60, right: 25, left: 20),
            decoration: BoxDecoration(
              color: Color(0xFF0B258A),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.4)),
                    child: Center(
                        child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                      size: 20,
                    )),
                  ),
                  // Spacer(),
                  Text(
                    "Select Card".i18n,
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.4),
                        border: Border.all(
                          color: Colors.white.withOpacity(.5),
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/IMG_5706.JPG"))),
                    // child: Center(child: ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi, Charles".i18n,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flash(
                child: BlurryContainer(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Balance".i18n,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ 543,933.33".i18n,
                                  style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.currency_bitcoin,
                                      color: Color(0xFF0B258A),
                                    ))
                              ]),
                        ),
                      ],
                    ),
                  ),
                  blur: 50,
                  width: 300,
                  height: 100,
                  elevation: 0,
                  color: Colors.grey.withOpacity(.4),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ]),
          ),
          Spacer(),
          Container(
            height: 50,
            child: ListView.builder(
                itemCount: _tabs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  String sText = _tabs[index];
                  return SlideInLeft(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Text(
                          sText.i18n,
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: index == _selectedIndex
                                  ? Color(0xFF0B258A)
                                  : Color(0xFF0B258A).withOpacity(.5),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                })),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.height * .55,
              // color: Color.fromARGB(255, 230, 228, 232),
              // color: Colors.amber,
              child: SlideInUp(
                child: CardSlider(
                  height: context.height * .6,
                  confirm: (confirm) {
                    _confirm = confirm;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}