import 'package:flutter/material.dart';
import 'package:my_flutter_project1/src/profilepage.dart';
import 'package:my_flutter_project1/src/settingpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  color: Colors.grey[300], // Placeholder for the image
                  child: Center(
                    child: Image.network(
                      'data:image/jpeg;base64,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',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Smart Home Assistant',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'A smart home assistant is a voice-activated device that helps manage home automation tasks, such as controlling lights, thermostats, and security systems. It integrates with various smart devices, allowing users to streamline daily activities through voice commands or mobile apps.',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.thumb_down),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Repeat the Card for more sections
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: Center(
                    child: Image.network(
                      'data:image/png;base64,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',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Eco Track',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Eco Track is a sustainability-focused tool or application that monitors and tracks energy consumption, water usage, and waste production in real-time. It provides insights and suggestions to help users reduce their environmental footprint and promote eco-friendly practices.',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.thumb_down),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: Center(
                    child: Image.network(
                      'https://png.pngtree.com/png-clipart/20210701/ourmid/pngtree-vr-virtual-reality-running-fitness-gear-png-image_3533665.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'VR Fitness',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'VR Fitness combines virtual reality technology with exercise routines, creating immersive workout experiences. Users can engage in various physical activities, from dancing to high-intensity training, while enjoying interactive environments that enhance motivation and enjoyment during workouts.',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.thumb_down),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // Stay on Home
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
