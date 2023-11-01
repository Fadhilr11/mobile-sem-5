import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String date;

  NewPage({required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail for Date $date'),
      ),
      body: Center(
        child: Text('Content for Date $date'),
      ),
    );
  }
}
