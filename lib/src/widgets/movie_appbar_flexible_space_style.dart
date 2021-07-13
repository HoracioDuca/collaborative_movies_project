import 'package:flutter/material.dart';

class MovieAppBarFlexibleSpaceStyle extends StatelessWidget {
  final Widget? futureChild;

  const MovieAppBarFlexibleSpaceStyle({
    Key? key,
    required this.futureChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: futureChild,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.black,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
    );
  }
}
