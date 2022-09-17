import 'package:flutter/material.dart';
import 'package:food_app/src/presentation/views/home_page.dart';
import 'package:food_app/src/presentation/widgets/constants/colors.dart';
import 'package:lottie/lottie.dart';

class FavPage extends StatefulWidget {
  FavPage({Key? key, this.favList}) : super(key: key);

  var favList;

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: CustomColor.yellow,
        elevation: 0,
      ),
      body: favList.isEmpty
          ? Center(
              child: Column(
              mainAxisSize: MainAxisSize.min,
               children: [
                SizedBox(width: width * .4, height: height * .4, child: Lottie.asset('assets/lottie/star.json', repeat: false)),
                Text(
                  'No Favourites',
                  style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
                )
              ],
            ))
          : ListView.builder(
              itemCount: favList.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(widget.favList.toString()),
                  subtitle: Text(widget.favList.toString()),
                ));
              }),
    );
  }
}
