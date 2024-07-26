import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CustomCard(
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Card Title 1',
            description: 'This is the description for card 1.',
          ),
          CustomCard(
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Card Title 2',
            description: 'This is the description for card 2.',
          ),
          CustomCard(
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Card Title 3',
            description: 'This is the description for card 3.',
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const CustomCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(description),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
