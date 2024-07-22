import 'package:code/hooks/theme.dart';
import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  final String username;
  final bool isPersonSwitchEnabled;
  final void Function(bool) setState;
  const SettingsHeader(
      {super.key,
      required this.username,
      required this.isPersonSwitchEnabled,
      required this.setState});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        child: Icon(Icons.person,
            size: 30, color: Theme.of(context).colorScheme.secondary),
      ),
      title: Text(username),
      trailing: Switch(
        value: isPersonSwitchEnabled,
        onChanged: (value) {
          GlobalThemeData.toggleTheme();
          setState(value);
        },
      ),
    );
  }
}
