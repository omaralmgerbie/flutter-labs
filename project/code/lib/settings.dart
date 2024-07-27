import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//class name
class SettingsPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'English';
  bool _isDarkTheme = false;
  late SharedPreferences _prefs;
  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    _loadThemePreference();
  }
  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }
  Future<void> _loadThemePreference() async {
    _isDarkTheme = _prefs.getBool('isDarkTheme') ?? false;
    setState(() {});
  }
  Future<void> _updateThemePreference(bool isDarkTheme) async {
    await _prefs.setBool('isDarkTheme', isDarkTheme);
  }
  Future<void> _updateAppTheme(ThemeData newTheme) async {
    await _updateThemePreference(_isDarkTheme);
    if (!mounted) return;
    setState(() {
      ThemeData effectiveTheme = newTheme;
      if (effectiveTheme == null) return;
      // Assuming that you have a GlobalKey<NavigatorState> named navigatorKey
      var navigatorKey;
      navigatorKey.currentState!.overlay!.context.setTheme(effectiveTheme);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text(_getUserInitials()),
            ),
            title: Text('John Doe'),
            subtitle: Text('john.doe@example.com'),
          ),
          DropdownButtonFormField<String>(
            value: _selectedLanguage,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText: 'Language',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              // ignore: prefer_const_constructors
              DropdownMenuItem(
                value: 'English',
                // ignore: prefer_const_constructors
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'Arabic',
                child: Text('Arabic'),
              ),
            ],
          ),
          SwitchListTile(
            value: _isDarkTheme,
            title: Text('Dark Theme'),
            onChanged: (value) {
              setState(() {
                _isDarkTheme = value;
                final newTheme = _isDarkTheme ? ThemeData.dark() : ThemeData.light();
                _updateAppTheme(newTheme);
              });
            },
          ),
        ],
      ),
    );
  }
  String _getUserInitials() {
    String name = 'John Doe';
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }
}