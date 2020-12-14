import 'package:fitness_app/SizeConfig.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String title;
  final String progressText;
  final Color cardColor;

  const ProgressBar({
    Key key,
    this.title,
    this.progressText,
    this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Color(0xffF75B1C).withOpacity(0.5),
        color: cardColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: SizeConfig.screenWidth / 2 - 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SizedBox(
              height: 100.0,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: new CircularProgressIndicator(
                        backgroundColor: Colors.white.withOpacity(0.4),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                        strokeWidth: 5,
                        value: 0.7,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      progressText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
