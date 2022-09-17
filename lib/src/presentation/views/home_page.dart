import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/src/data/datasources/local/local_db.dart';
import 'package:food_app/src/presentation/widgets/constants/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.list, required this.tags, required this.localDB}) : super(key: key);

  var list;
  var tags;
  var localDB;

  @override
  State<HomePage> createState() => _HomePageState();
}

int _counter = 1;
bool isFav = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColor.yellow,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * .08, left: width * .05),
            child: SizedBox(
              width: width * .06,
              height: height * .06,
              child: GestureDetector(
                child: SvgPicture.asset('assets/svg/back.svg'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .08, left: width * .82),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isFav = !isFav;
                  });
                  if (isFav) {
                    favList.add(LocalDB.localDb[0]);
                  } else {
                    favList.remove(LocalDB.localDb[0]);
                  }
                },
                icon: isFav ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border)),
          ),
          Container(
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))),
              width: width * 1,
              height: height * .7,
              margin: EdgeInsets.only(top: height * .3),
              child: Padding(
                padding: EdgeInsets.only(top: height * .22),
                child: Column(children: [
                  Text(
                    widget.localDB["name"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: height * .025),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Id afnon pellentesque\nposuere nec nunc et enim nibh. Id afnon\npellentesque',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xFF868686), height: height * .002, wordSpacing: width * .007),
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: width * .04,
                        height: height * .04,
                        child: SvgPicture.asset('assets/svg/biker.svg'),
                      ),
                      SizedBox(
                        width: width * .04,
                      ),
                      Text('Delivers in ${widget.localDB["delivery_time"].toString()} minutes')
                    ],
                  ),
                  SizedBox(height: height * .025),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .08),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${(widget.localDB["cost"] * _counter).toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (_counter >= 2) {
                                  _counter--;
                                } else {}
                              });
                            },
                            icon: Icon(Icons.remove)),
                        Text(
                          '$_counter',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _counter++;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ],
                    ),
                  ),
                  SizedBox(height: height * .015),
                  SizedBox(
                    width: width * .85,
                    height: height * .07,
                    child: ElevatedButton(
                      onPressed: () {
                        AlertController.show(
                          "Successfuly",
                          "Added to your basket!",
                          TypeAlert.success,
                        );
                      },
                      child: Text('Add to Card'),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(CustomColor.black)),
                    ),
                  )
                ]),
              )),
          Padding(
            padding: EdgeInsets.only(top: height * .13, left: width * .1),
            child: Hero(
              transitionOnUserGestures: true,
              tag: widget.tags.toString(),
              child: Image.asset(
                widget.list["path"].toString(),
                scale: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List favList = [];
List basketList = [];