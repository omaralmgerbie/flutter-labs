import 'package:code/auth/api_service.dart';
import 'package:code/components/toast.dart';
import 'package:code/db/db_manager.dart';
import 'package:code/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:code/components/settings_header.dart';
import 'package:code/widgets/drop-down.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  final String title;

  const SettingScreen({super.key, required this.title});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isPersonSwitchEnabled = false;
  List<String> _bookTitles = [];
  String _username = '';

  @override
  void initState() {
    super.initState();
    _fetchBookTitles();
    _handleUserData(context);
  }

  Future<void> _fetchBookTitles() async {
    final dbManager = DbManager.instance;
    final books = await dbManager.findAllBooks();
    setState(() {
      _bookTitles = books.map((book) => book.title).toList();
      if (_bookTitles.isNotEmpty) {}
    });
  }

  void _onDropdownChanged(String? newValue) {
    setState(() {});
  }

  void _handleLogOut() {
    final apiService = Provider.of<ApiService>(context, listen: false);
    apiService.logout();
    Navigator.pushNamed(
      context,
      '/login',
    );
  }

  Future<void> _handleUserData(BuildContext context) async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    try {
      final response = await apiService.getUserDetails();
      setState(() {
        _username = response['name'];
      });
    } catch (e) {
      showToastError('خطأ حول مجدداً');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SettingsHeader(
                    username: _username,
                    isPersonSwitchEnabled: _isPersonSwitchEnabled,
                    setState: (value) {
                      setState(() {
                        _isPersonSwitchEnabled = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownField(
                    initialValue: 'Clean Code',
                    items: _bookTitles,
                    label: 'Books we have',
                    onChanged: _onDropdownChanged,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              MyButton(label: 'lonig Out', onPressed: _handleLogOut)
            ],
          ),
        ),
      ),
    );
  }
}





/*
Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Label',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _dropdownValue,
                items: <String>['Dropdown closed', 'Option 1', 'Option 2']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _dropdownValue = newValue!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),


*/


