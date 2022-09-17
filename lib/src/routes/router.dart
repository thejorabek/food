import 'package:flutter/material.dart';
import 'package:food_app/src/data/datasources/local/local_db.dart';
import 'package:food_app/src/presentation/views/home_page.dart';
import 'package:food_app/src/presentation/views/info_page.dart';

class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();
  static RouteGenerator get router => _generator;

  RouteGenerator._init();
  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return navigate(HomePage(
          list: LocalDB.localDb,
          tags: LocalDB.tags,
          localDB: LocalDB.localDb,
        ));
      case 'info':
        return navigate(const InfoPage());
    }
    return null;
  }

  navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
