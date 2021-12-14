import 'package:flutter/material.dart';

class SlideLeftRoute extends PageRouteBuilder {
  SlideLeftRoute({@required Widget? widget})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget!,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;

            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
