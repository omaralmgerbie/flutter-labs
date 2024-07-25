import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'tasks_page.dart';

class SettingsPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String studentId;

  const SettingsPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.studentId,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'English';
  bool _isDarkMode = false;





  void _onLanguageChanged(String? newLanguage) {
    setState(() {
      _selectedLanguage = newLanguage ?? 'English';
    });
  }





  void _onThemeChanged(bool? isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode ?? false;
      /*
      Here we can Implement a code that will change the app theme color
      Unfortunately I couldn't do it, my time was tight
       */

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Settings Page", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
      ),




      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [


          ListTile(

            //The avatar is the student First name and Last Name
            leading: CircleAvatar(
              child: Text(
                '${widget.firstName[0]}${widget.lastName[0]}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text('${widget.firstName} ${widget.lastName}'),
            subtitle: Text('Student ID: ${widget.studentId}'),
          ),


          //Log out Button
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.logout),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),


          //Language dropDown Menu
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: const [
                DropdownMenuItem(child: Text('English'), value: 'English'),
                DropdownMenuItem(child: Text('Arabic'), value: 'Arabic'),
              ],
              onChanged: _onLanguageChanged,
            ),
          ),


          //Theme color changer
          ListTile(
            title: const Text('Theme'),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: _onThemeChanged,
            ),
          ),
        ],
      ),




      //Bottom Bar Buttons
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              //Settings Page Button
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        studentId: widget.studentId,
                      ),
                    ),
                  );
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),




              //Home Page Button
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        studentId: widget.studentId,
                      ),
                    ),
                  );
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),




              //Task Page Button
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TasksPage(
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        studentId: widget.studentId,
                      ),
                    ),
                  );
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
