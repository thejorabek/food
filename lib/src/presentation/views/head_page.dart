import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/src/data/datasources/local/local_db.dart';
import 'package:food_app/src/presentation/views/home_page.dart';
import 'package:food_app/src/presentation/widgets/constants/colors.dart';

class HeadPage extends StatefulWidget {
  const HeadPage({Key? key}) : super(key: key);

  @override
  State<HeadPage> createState() => _HeadPageState();
}

class _HeadPageState extends State<HeadPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * .08, top: height * .04, right: width * .08),
            child: Row(
              children: [Image.asset('assets/images/fire.png', scale: 4), Spacer(), SvgPicture.asset('assets/svg/menu.svg')],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .03, left: width * .08),
            child: Text(
              'Find good\nfood around you',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .04, left: width * .08, right: width * .08),
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColor.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [BoxShadow(blurRadius: 10, color: Color.fromARGB(255, 209, 209, 209))]),
              width: width * 1,
              height: height * .07,
              child: Padding(
                padding: EdgeInsets.only(left: width * .05),
                child: Row(children: [
                  SizedBox(height: height * .05, width: width * .05, child: SvgPicture.asset('assets/svg/search.svg')),
                  SizedBox(width: width * .04),
                  SizedBox(
                      height: height * .05,
                      width: width * .6,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search your food here',
                            hintStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 151, 151, 151))),
                      )),
                  SizedBox(height: height * .06, width: width * .06, child: SvgPicture.asset('assets/svg/settings.svg')),
                ]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .04, left: width * .08),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Find',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: width * .03),
                Text(
                  '5km',
                  style: TextStyle(color: Color(0xFFF98A23), fontSize: 20),
                ),
                SizedBox(width: width * .02),
                Padding(
                  padding: EdgeInsets.only(top: height * .005),
                  child: Icon(Icons.arrow_forward_ios, size: 10),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .03, left: width * .08, right: width * .08),
            child: TabBar(
              overlayColor: MaterialStateProperty.all(Color.fromARGB(246, 255, 255, 255)),
              indicator: BoxDecoration(color: CustomColor.yellow, borderRadius: BorderRadius.circular(30)),
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              tabs: [
                Tab(text: 'Set meal'),
                Tab(text: 'Hot meal'),
                Tab(text: 'Popular'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .03),
            child: SizedBox(
              width: width,
              height: height,
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: height * .1, left: width * .06),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            boxShadow: [BoxShadow(blurRadius: 5, color: Color.fromARGB(255, 209, 209, 209))]),
                                        width: width * .4,
                                        height: height * .18,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: height * .07),
                                          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              LocalDB.localDb[0]['name'].toString(),
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: height * .005),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  LocalDB.localDb[0]["delivery_time"].toString() + ' min',
                                                  style: TextStyle(color: Color(0xFF868686)),
                                                ),
                                                SizedBox(width: width * .03),
                                                SvgPicture.asset('assets/svg/star.svg'),
                                                SizedBox(width: width * .03),
                                                Text('4.5', style: TextStyle(color: Color(0xFF868686)))
                                              ],
                                            ),
                                            SizedBox(height: height * .01),
                                            Text(
                                              '\$' + LocalDB.localDb[0]["cost"].toString(),
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                            )
                                          ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * .1, top: height * .02),
                                  child: Hero(
                                    transitionOnUserGestures: true,
                                    tag: LocalDB.tags[0].toString(),
                                    child: Image.asset(
                                      LocalDB.foodImage[0]["path"].toString(),
                                      scale: 3,
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder: (_, __, ___) => HomePage(
                                            list: LocalDB.foodImage[0],
                                            tags: LocalDB.tags[0],
                                            localDB: LocalDB.localDb[0],
                                          )));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: height * .1, left: width * .06),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            boxShadow: [BoxShadow(blurRadius: 5, color: Color.fromARGB(255, 209, 209, 209))]),
                                        width: width * .4,
                                        height: height * .18,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: height * .07),
                                          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              LocalDB.localDb[1]['name'].toString(),
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: height * .005),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  LocalDB.localDb[1]["delivery_time"].toString() + ' min',
                                                  style: TextStyle(color: Color(0xFF868686)),
                                                ),
                                                SizedBox(width: width * .03),
                                                SvgPicture.asset('assets/svg/star.svg'),
                                                SizedBox(width: width * .03),
                                                Text('4.5', style: TextStyle(color: Color(0xFF868686)))
                                              ],
                                            ),
                                            SizedBox(height: height * .01),
                                            Text(
                                              '\$' + LocalDB.localDb[1]["cost"].toString(),
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                            )
                                          ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * .1, top: height * .02),
                                  child: Hero(
                                    tag: LocalDB.tags[1].toString(),
                                    child: Image.asset(
                                      LocalDB.foodImage[1]["path"].toString(),
                                      scale: 3,
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder: (_, __, ___) => HomePage(
                                            list: LocalDB.foodImage[1],
                                            tags: LocalDB.tags[1],
                                            localDB: LocalDB.localDb[1],
                                          )));
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: height * .1, left: width * .06),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            boxShadow: [BoxShadow(blurRadius: 5, color: Color.fromARGB(255, 209, 209, 209))]),
                                        width: width * .4,
                                        height: height * .18,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: height * .07),
                                          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              LocalDB.localDb[2]['name'].toString(),
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: height * .005),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  LocalDB.localDb[2]["delivery_time"].toString() + ' min',
                                                  style: TextStyle(color: Color(0xFF868686)),
                                                ),
                                                SizedBox(width: width * .03),
                                                SvgPicture.asset('assets/svg/star.svg'),
                                                SizedBox(width: width * .03),
                                                Text('4.5', style: TextStyle(color: Color(0xFF868686)))
                                              ],
                                            ),
                                            SizedBox(height: height * .01),
                                            Text(
                                              '\$' + LocalDB.localDb[2]["cost"].toString(),
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                            )
                                          ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * .1, top: height * .02),
                                  child: Hero(
                                    tag: LocalDB.tags[2].toString(),
                                    child: Image.asset(
                                      LocalDB.foodImage[2]["path"].toString(),
                                      scale: 3,
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder: (_, __, ___) => HomePage(
                                            list: LocalDB.foodImage[2],
                                            tags: LocalDB.tags[2],
                                            localDB: LocalDB.localDb[2],
                                          )));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: height * .1, left: width * .06),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            boxShadow: [BoxShadow(blurRadius: 5, color: Color.fromARGB(255, 209, 209, 209))]),
                                        width: width * .4,
                                        height: height * .18,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: height * .07),
                                          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              LocalDB.localDb[3]['name'].toString(),
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: height * .005),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  LocalDB.localDb[3]["delivery_time"].toString() + ' min',
                                                  style: TextStyle(color: Color(0xFF868686)),
                                                ),
                                                SizedBox(width: width * .03),
                                                SvgPicture.asset('assets/svg/star.svg'),
                                                SizedBox(width: width * .03),
                                                Text('4.5', style: TextStyle(color: Color(0xFF868686)))
                                              ],
                                            ),
                                            SizedBox(height: height * .01),
                                            Text(
                                              '\$' + LocalDB.localDb[3]["cost"].toString(),
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                            )
                                          ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * .1, top: height * .02),
                                  child: Hero(
                                    tag: LocalDB.tags[3].toString(),
                                    child: Image.asset(
                                      LocalDB.foodImage[3]["path"].toString(),
                                      scale: 3,
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder: (_, __, ___) => HomePage(
                                            list: LocalDB.foodImage[3],
                                            tags: LocalDB.tags[3],
                                            localDB: LocalDB.localDb[3],
                                          )));
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: height * .1, left: width * .06),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            boxShadow: [BoxShadow(blurRadius: 5, color: Color.fromARGB(255, 209, 209, 209))]),
                                        width: width * .4,
                                        height: height * .18,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: height * .07),
                                          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              LocalDB.localDb[4]['name'].toString(),
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: height * .005),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  LocalDB.localDb[4]["delivery_time"].toString() + ' min',
                                                  style: TextStyle(color: Color(0xFF868686)),
                                                ),
                                                SizedBox(width: width * .03),
                                                SvgPicture.asset('assets/svg/star.svg'),
                                                SizedBox(width: width * .03),
                                                Text('4.5', style: TextStyle(color: Color(0xFF868686)))
                                              ],
                                            ),
                                            SizedBox(height: height * .01),
                                            Text(
                                              '\$' + LocalDB.localDb[4]["cost"].toString(),
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                            )
                                          ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * .1, top: height * .02),
                                  child: Hero(
                                    tag: LocalDB.tags[4].toString(),
                                    child: Image.asset(
                                      LocalDB.foodImage[4]["path"].toString(),
                                      scale: 3,
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder: (_, __, ___) => HomePage(
                                            list: LocalDB.foodImage[4],
                                            tags: LocalDB.tags[4],
                                            localDB: LocalDB.localDb[4],
                                          )));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: height * .1, left: width * .06),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            boxShadow: [BoxShadow(blurRadius: 5, color: Color.fromARGB(255, 209, 209, 209))]),
                                        width: width * .4,
                                        height: height * .18,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: height * .07),
                                          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              LocalDB.localDb[5]['name'].toString(),
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: height * .005),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  LocalDB.localDb[5]["delivery_time"].toString() + ' min',
                                                  style: TextStyle(color: Color(0xFF868686)),
                                                ),
                                                SizedBox(width: width * .03),
                                                SvgPicture.asset('assets/svg/star.svg'),
                                                SizedBox(width: width * .03),
                                                Text('4.5', style: TextStyle(color: Color(0xFF868686)))
                                              ],
                                            ),
                                            SizedBox(height: height * .01),
                                            Text(
                                              '\$' + LocalDB.localDb[5]["cost"].toString(),
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                            )
                                          ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * .1, top: height * .02),
                                  child: Hero(
                                    tag: LocalDB.tags[5].toString(),
                                    child: Image.asset(
                                      LocalDB.foodImage[5]["path"].toString(),
                                      scale: 3,
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder: (_, __, ___) => HomePage(
                                            list: LocalDB.foodImage[5],
                                            tags: LocalDB.tags[5],
                                            localDB: LocalDB.localDb[5],
                                          )));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.settings),
                  Icon(Icons.arrow_back)
                ],
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
