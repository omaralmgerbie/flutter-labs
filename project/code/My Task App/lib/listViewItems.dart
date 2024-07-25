import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String text;

  const ListViewItem({
    required this.imageUrl,
    required this.title,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            imageUrl,
           height: 300,

            fit: BoxFit.fill,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
