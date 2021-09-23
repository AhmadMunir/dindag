import 'dart:math';

import 'package:dindag/services/auth_service.dart';
import 'package:dindag/tools/navigate.dart';
import 'package:dindag/views/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:dindag/models/models.dart' as model;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int selectedIndex = 0;

  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24, right:24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (selectedIndex != 0)
                  IconButton(onPressed: () {
                    _pageController.jumpToPage(selectedIndex - 1);
                  }, icon: Icon(Icons.arrow_back_ios, ), iconSize: 20,)
                else
                  SizedBox(
                    height: 1,
                    width: 1,
                  ),
                if (selectedIndex != (model.getOnBoardingItems().length - 1))
                  TextButton(
                      onPressed: () {
                        _pageController
                            .jumpToPage((model.getOnBoardingItems().length - 1));
                      },
                      child: Text('Skip', style: TextStyle(
                        fontSize: 14, color: Colors.black
                      ),))
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFECF8FF),
      body: PageView(
        physics: BouncingScrollPhysics(),
        onPageChanged: (int page) {
          setState(() {
            selectedIndex = page;
          });
        },
        controller: _pageController,
        children: model.getOnBoardingItems().map((e) {
          return stackedWidget(context, e);
        }).toList(),
      ),
    );
  }

  Widget stackedWidget(BuildContext context, model.OnBoarding model) {
    return Stack(
      children: [
        Positioned(
          child: SvgPicture.asset(model.imgPath),
          top: 74,
          right: model.right,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: whiteCard(context, model),
        )
      ],
    );
  }

  Widget whiteCard(BuildContext context, model.OnBoarding onBoard) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(onBoard.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Text(
                onBoard.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, wordSpacing: 1.5),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dotWidget(3),
              RectangleButton(onTap: () {
                if (selectedIndex != model.getOnBoardingItems().length - 1) {
                  _pageController.jumpToPage(selectedIndex + 1);
                } else {
                  AuthService(http.Client()).viewOnBoarding();
                  Navigate.pushReplace(HomePage());
                }
              },),
            ],
          )
        ],
      ),
      height: getHeightWhiteCard(size),
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
    );
  }

  double getHeightWhiteCard(Size size) {
    return size.height / 3 <= 267 ? 267 : size.height / 3;
  }

  Widget dotWidget(int totalPage) {
    return Row(
      children: [
        ...List.generate(
            totalPage,
            (index) => Container(
                  margin: const EdgeInsets.only(right: 3),
                  width: (index == selectedIndex) ? 18 : 13,
                  height: 5,
                  decoration: BoxDecoration(
                      color: (index == selectedIndex)
                          ? Colors.indigo.withOpacity(.65)
                          : Colors.indigo.withOpacity(.25),
                      borderRadius: BorderRadius.circular(5)),
                ))
      ],
    );
  }
}

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    Key? key, required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.only(
            left: 0,
            right: 5,
          ),
          decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.65),
              borderRadius: BorderRadius.circular(8)),
          child: Transform.rotate(
              angle: pi * 1,
              child: Icon(
                Icons.keyboard_backspace_rounded,
                size: 40,
                color: Colors.white,
              ))),
    );
  }
}
