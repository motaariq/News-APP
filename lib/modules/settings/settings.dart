import 'package:flutter/cupertino.dart';

class SettingsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:  20.0
        ),
      ),
    );
  }
}
