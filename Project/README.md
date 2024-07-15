Code understanding
* The 'main.dart' serves the entry point for the application.
* 'login_page.dart'  contains the login screen with form validation.( _errorMessage stores any login errors.
_login simulates an API call and handles navigation on success or error display on failure.The UI A Form widget with TextFormField widgets for email and student number, an ElevatedButton for login, and a CircularProgressIndicator for loading.)
* 'main_page' sets up the bottom navigation bar and pages
* 'home_page.dart' scrollable list of items (ListView: Displays a list of 50 items using ListView.builder.)
* 'tasks_page.dart' A list of tasks with a dialog to add new tasks(with Floating Action Button Opens a dialog to add a new task with TextField widgets for the title and description.)
* 'settings_page.dart' Displays user info, a theme switch, language selection, and a logout button (_isDarkTheme manages the theme state.Language Selection: _selectedLanguage manages the selected language.User Info Tile: Displays the user's info with a leading avatar. Navigates back to the login page on press.)
