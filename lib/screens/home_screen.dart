import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Synapse'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Synapse',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            Text(
              'Your AI-powered productivity companion',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            // TODO: Add quick action buttons or summary widgets
          ],
        ),
      ),
    );
  }
}