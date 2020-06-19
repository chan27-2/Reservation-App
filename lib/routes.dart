import 'package:resevation_app/screens/create_reser.dart';
import 'package:resevation_app/screens/dellist.dart';
import 'package:resevation_app/screens/edit_reser.dart';
import 'package:resevation_app/screens/home_page.dart';
import 'package:resevation_app/screens/login_Page.dart';
import 'package:flutter/material.dart';
import 'package:resevation_app/screens/reser_list.dart';

import 'screens/signup_page.dart';
import 'wrapper.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case ('/login'):
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case ('/signUp'):
        return MaterialPageRoute(builder: (_) => SignPage());
        break;
      case ('/create_reser'):
        return MaterialPageRoute(builder: (_) => Create());
        break;
      case ('/edit_reser'):
        return MaterialPageRoute(builder: (_) => Edit(args));
        break;
      case ('/reserlist'):
        return MaterialPageRoute(builder: (_) => ReserList());
        break;
      case ('/del'):
        return MaterialPageRoute(builder: (_) => DeleteList());
        break;
      case ('/wrapper'):
        return MaterialPageRoute(builder: (_) => Wrapper());
        break;
      default:
        return MaterialPageRoute(builder: (_) => SignPage());
    }
  }
}
