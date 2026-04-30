import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String title; //Título a ser exibido com ênfase
  final String label; //Label do título

  const CustomLabel({super.key, required this.title, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 2,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
         Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
