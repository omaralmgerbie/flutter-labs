import 'package:flutter/material.dart';
import 'settings_page.dart'; // Import the SettingsPage class
import 'profile_page.dart'; // Import the ProfilePage class
import 'login_page.dart'; // Import the LoginPage class
import 'info_page.dart'; // Import the InfoPage class

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 211, 241),

      // App bar with custom height and back button
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Set the height of the AppBar
        child: AppBar(
          title: Text('Home Page'), // Title of the AppBar
          centerTitle: true, // Center the title text
          backgroundColor: Colors.white10, // Background color of the AppBar

          // Actions in the AppBar
          actions: [
            // Settings icon
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()), // Navigate to SettingsPage
                );
              },
            ),
          ],

          // Back button to navigate to the login page
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Icon for the back button
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
              );
            },
          ),
        ),
      ),

      // Body content with scrollable column
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50), // Space between AppBar and the first card
            _buildFirstCardContainer(context), // First card
            SizedBox(height: 50), // Space between the first and second card
            _buildSecondCardContainer(context), // Second card
            SizedBox(height: 50), // Space between the second and third card
            _buildThirdCardContainer(context), // Third card
          ],
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'Home', // Label for Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Settings icon
            label: 'Settings', // Label for Settings
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile icon
            label: 'Profile', // Label for Profile
          ),
        ],

        // Navigation logic for bottom bar items
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()), // Navigate to SettingsPage
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfilePage
            );
          }
        },
      ),
    );
  }

  // Function to build the first card container
  Widget _buildFirstCardContainer(BuildContext context) {
    return Container(
      height: 300, // Height of the card container
      child: Center(
        child: Card(
          // Card container with padding
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7, // Set the width to 70% of the screen width
            padding: EdgeInsets.all(10), // Padding inside the card
            child: Column(
              children: [
                // Image inside the card
                Expanded(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/C_Programming_Language.svg/1920px-C_Programming_Language.svg.png', // C++ logo
                    fit: BoxFit.cover, // Cover the space inside the card
                  ),
                ),
                SizedBox(height: 30), // Space between the image and the text/button row

                // Row containing text and button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('C++ Language'), // Text label

                    // Elevated button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3, // 30% of screen width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoPage(), // Navigate to InfoPage
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // Set the border radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Set the border radius here
                          ), backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background color
                        ),
                        child: Text('Information'), // Button text
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build the second card container
  Widget _buildSecondCardContainer(BuildContext context) {
    return Container(
      height: 300, // Height of the card container
      child: Center(
        child: Card(
          // Card container with padding
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7, // Set the width to 70% of the screen width
            padding: EdgeInsets.all(10), // Padding inside the card
            child: Column(
              children: [
                // Image inside the card
                Expanded(
                  child: Image.network(
                    'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png', // Flutter logo
                    fit: BoxFit.cover, // Cover the space inside the card
                  ),
                ),
                SizedBox(height: 30), // Space between the image and the text/button row

                // Row containing text and button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Flutter Framework'), // Text label

                    // Elevated button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3, // 30% of screen width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoPage(), // Navigate to InfoPage
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // Set the border radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Set the border radius here
                          ), backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background color
                        ),
                        child: Text('Information'), // Button text
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build the third card container
  Widget _buildThirdCardContainer(BuildContext context) {
    return Container(
      height: 300, // Height of the card container
      child: Center(
        child: Card(
          // Card container with padding
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7, // Set the width to 70% of the screen width
            padding: EdgeInsets.all(10), // Padding inside the card
            child: Column(
              children: [
                // Image inside the card
                Expanded(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png', // JavaScript logo
                    fit: BoxFit.cover, // Cover the space inside the card
                  ),
                ),
                SizedBox(height: 30), // Space between the image and the text/button row

                // Row containing text and button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('JavaScript Language'), // Text label

                    // Elevated button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3, // 30% of screen width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoPage(), // Navigate to InfoPage
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // Set the border radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Set the border radius here
                          ), backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background color
                        ),
                        child: Text('Information'), // Button text
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
