import 'package:flutter/material.dart';
import 'package:food_app/src/presentation/views/home_page.dart';
import 'package:food_app/src/presentation/views/info_page.dart';
import 'package:food_app/src/presentation/widgets/constants/colors.dart';
import 'package:lottie/lottie.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Your Basket',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: CustomColor.yellow,
        centerTitle: true,
      ),
      body: basketList.isEmpty
          ? Center(
              child: GestureDetector(
                child: SizedBox(
                  width: width * .4,
                  height: height * .4,
                  child: Lottie.asset('assets/lottie/empty.json', repeat: false),
                ),
                onTap: () {
                  pageCon.jumpToPage(0);
                },
              ),
            )
          : const Center(
              child: Text('Nimadur'),
            ),
    );
  }
}
