import 'package:flutter/material.dart';
import 'package:food_app/src/presentation/widgets/constants/colors.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.yellow,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
              color: CustomColor.yellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
          width: width * 1,
          height: height * .2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * .05, horizontal: width * .1),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage('assets/images/user.png'))),
                width: width * .2,
                height: height * .1,
              ),
              SizedBox(width: width * .05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text('usermailaddress@gmail.com'),
                  Text(
                    'User ID : 156A860',
                    style: TextStyle(color: Color.fromARGB(125, 0, 0, 0)),
                  )
                ],
              )
            ]),
          ),
        ),
        SizedBox(height: height * .05),
        Padding(
          padding: EdgeInsets.only(left: width * .07),
          child: Text(
            'My Card',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: height * .03),
        Padding(
          padding: EdgeInsets.only(left: width * .07),
          child: Image.asset(
            'assets/images/card.png',
            scale: 1.8,
          ),
        ),
        SizedBox(height: height * .05),
        Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
              color: CustomColor.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              )),
          width: width * 1,
          height: height * .2457,
        )
      ]),
    );
  }
}
