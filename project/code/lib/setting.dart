import 'package:first_app/login.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  String dropdownValue = 'English';
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'الإعدادات',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 249, 243, 243)),
              ),
              backgroundColor: Color(0xFF2E236C),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF2E236C),
                      child: Text(
                        'SA',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text('Salma Ahmed'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('salmabenhamed.com'),
                        Text('Student Number: 123456'),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 24,
                    width: 358,
                  ),
                  // Dropdown button
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),

                  DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['English', 'العربية']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  // Theme switch
                  Text('المظهر'),
                  SwitchListTile(
                    title: Text('DarkMode'),
                    value: isDarkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        isDarkTheme = value;
                      });
                    },
                  ),

                  Spacer(),
                  // Logout button
                  Center(
                      child: Container(
                    width: 400,
                    height: 50,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_add),
                  label: 'Task',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            )));
  }
}
