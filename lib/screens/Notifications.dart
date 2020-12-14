import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  static final String id = 'notifications';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Notifications',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.notifications_outlined),
                          Text(
                            'Notification title',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
