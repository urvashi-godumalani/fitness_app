import 'package:fitness_app/SizeConfig.dart';
import 'package:fitness_app/widgets/ProgressBar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome User',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgressBar(
                title: 'Steps Tracker',
                cardColor: Color(0xffF75B1C),
                progressText: '5k/7k',
              ),
              ProgressBar(
                title: 'Water Tracker',
                cardColor: Color(0xff788993),
                progressText: '5/10',
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Latest Activity',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Activity $index'),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
