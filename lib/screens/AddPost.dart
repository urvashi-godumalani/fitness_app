import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  static final String id = 'add_post';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Post'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Text('AddPost'),
        ),
      ),
    );
  }
}
