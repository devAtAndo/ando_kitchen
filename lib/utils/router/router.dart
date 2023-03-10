import 'package:ando_kitchen_order/views/authentication/sign_in_view.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

class Routers {
  static Route<dynamic> generateRoute(
      RouteSettings settings, BuildContext context) {
    Widget routeWidget;
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.LOG_IN:
        routeWidget = const SignInView();
        break;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
    return _createRoute(child: routeWidget);
  }

  static Route _createRoute({child: Widget, settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
