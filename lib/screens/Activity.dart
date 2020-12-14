import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.history),
          title: Text('Activity $index'),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
      itemCount: 10,
    );
  }
}
