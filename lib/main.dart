import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:food_app/src/routes/router.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Stack(
         children: [
            child!,
            DropdownAlert()
         ],
       ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'info',
      onGenerateRoute: RouteGenerator.router.onGenerate,
    );
  }
}
