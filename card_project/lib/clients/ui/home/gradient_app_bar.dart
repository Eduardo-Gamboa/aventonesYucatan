import 'package:flutter/material.dart';
import 'package:card_project/clients/theme.dart' as theme;

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  // ignore: use_key_in_widget_constructors
  const GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Center(
        child: Text(
          title,
          style: theme.TextStyles.appBarTitle,
        ),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              theme.Colors.appBarGradientStart,
              theme.Colors.appBarGradientEnd
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
