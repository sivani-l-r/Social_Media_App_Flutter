import 'package:flutter/material.dart';

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: <Widget>[
          Icon(Icons.info, color: Colors.blue), 
          SizedBox(width: 10),  
        ],
      ),
      content: Text(message), 
    ),
  );
}
