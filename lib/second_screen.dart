import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String message;
  SecondScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(
                onPressed: () => Navigator.pop(context), child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
