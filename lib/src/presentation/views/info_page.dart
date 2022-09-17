import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/src/presentation/views/bag_page.dart';
import 'package:food_app/src/presentation/views/fav_page.dart';
import 'package:food_app/src/presentation/views/head_page.dart';
import 'package:food_app/src/presentation/views/user_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

Color iconColor = Colors.yellow;
Color iconColor1 = Colors.white;
Color iconColor2 = Colors.white;
Color iconColor3 = Colors.white;
Color iconColor4 = Colors.white;
Color indicatorColor = Colors.yellow;
Color indicatorColor1 = Colors.black;
Color indicatorColor2 = Colors.black;
Color indicatorColor3 = Colors.black;
Color indicatorColor4 = Colors.black;
var pageCon = PageController();

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Color.fromARGB(246, 255, 255, 255),
          body: Stack(children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageCon,
              children: [HeadPage(), BagPage(), BagPage(), FavPage(), UserPage()],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * .9, left: width * .05, right: width * .05),
              child: Container(
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                width: width * 1,
                height: height * .09,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .03),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/home.svg',
                            color: iconColor,
                          ),
                          SizedBox(height: height * .01),
                          CircleAvatar(
                            backgroundColor: indicatorColor,
                            radius: 2,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        iconColor = Colors.yellow;
                        iconColor1 = Colors.white;
                        iconColor2 = Colors.white;
                        iconColor3 = Colors.white;
                        iconColor4 = Colors.white;
                        indicatorColor = Colors.yellow;
                        indicatorColor1 = Colors.black;
                        indicatorColor2 = Colors.black;
                        indicatorColor3 = Colors.black;
                        indicatorColor4 = Colors.black;
                      });
                      pageCon.jumpToPage(0);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .03),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/bag.svg',
                            color: iconColor1,
                          ),
                          SizedBox(height: height * .01),
                          CircleAvatar(
                            backgroundColor: indicatorColor1,
                            radius: 2,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        iconColor1 = Colors.yellow;
                        iconColor = Colors.white;
                        iconColor2 = Colors.white;
                        iconColor3 = Colors.white;
                        iconColor4 = Colors.white;
                        indicatorColor1 = Colors.yellow;
                        indicatorColor = Colors.black;
                        indicatorColor2 = Colors.black;
                        indicatorColor3 = Colors.black;
                        indicatorColor4 = Colors.black;
                      });
                      pageCon.jumpToPage(1);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .03),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/location.svg',
                            color: iconColor2,
                          ),
                          SizedBox(height: height * .01),
                          CircleAvatar(
                            backgroundColor: indicatorColor2,
                            radius: 2,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        iconColor2 = Colors.yellow;
                        iconColor1 = Colors.white;
                        iconColor = Colors.white;
                        iconColor3 = Colors.white;
                        iconColor4 = Colors.white;
                        indicatorColor2 = Colors.yellow;
                        indicatorColor1 = Colors.black;
                        indicatorColor = Colors.black;
                        indicatorColor3 = Colors.black;
                        indicatorColor4 = Colors.black;
                      });
                      pageCon.jumpToPage(2);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .03),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/heart.svg',
                            color: iconColor3,
                          ),
                          SizedBox(height: height * .003),
                          CircleAvatar(
                            backgroundColor: indicatorColor3,
                            radius: 2,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        iconColor3 = Colors.yellow;
                        iconColor1 = Colors.white;
                        iconColor2 = Colors.white;
                        iconColor = Colors.white;
                        iconColor4 = Colors.white;
                        indicatorColor3 = Colors.yellow;
                        indicatorColor1 = Colors.black;
                        indicatorColor2 = Colors.black;
                        indicatorColor = Colors.black;
                        indicatorColor4 = Colors.black;
                      });
                      pageCon.jumpToPage(3);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .03),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/profile.svg',
                            color: iconColor4,
                          ),
                          SizedBox(height: height * .01),
                          CircleAvatar(
                            backgroundColor: indicatorColor4,
                            radius: 2,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        iconColor4 = Colors.yellow;
                        iconColor1 = Colors.white;
                        iconColor2 = Colors.white;
                        iconColor3 = Colors.white;
                        iconColor = Colors.white;
                        indicatorColor4 = Colors.yellow;
                        indicatorColor1 = Colors.black;
                        indicatorColor2 = Colors.black;
                        indicatorColor3 = Colors.black;
                        indicatorColor = Colors.black;
                      });
                      pageCon.jumpToPage(4);
                    },
                  ),
                ]),
              ),
            )
          ])),
    );
  }
}
