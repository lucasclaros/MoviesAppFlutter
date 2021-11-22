import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MovieInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const MovieInfoWidget(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(title, style: Constants.infoTitleStyle),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(subtitle, style: Constants.selectedMovieFontStyle,),
      ),
    );
  }

}