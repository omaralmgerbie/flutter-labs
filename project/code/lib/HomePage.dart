import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 1) {
        Navigator.pushNamed(context, '/tasks');
      } else if (_currentIndex == 2) {
        Navigator.pushNamed(context, '/settings');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الصفحة الرئيسية',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 249, 243, 243),
          ),
        ),
        backgroundColor: Color(0xFF2E236C),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(8.0))),
                child: Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: Image.asset(
                          'images/appLearn.jpg',
                          width: double.infinity,
                          height: 160.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        'تطوير التطبيقات المتعددة المنصات "ITMC323"',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        'مادة تطوير تطبيقات الأجهزة المحمولة تعلم الطلاب كيفية إنشاء تطبيقات الهاتف المحمول باستخدام قاعدة كود واحدة. ستتعلم أساسيات إطار عمل Flutter ، بما في ذلك الأدوات والتخطيطات والتنقل',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.open_in_browser),
                          SizedBox(width: 4.0),
                          Text('Full'),
                          Icon(Icons.add_box),
                          SizedBox(width: 4.0),
                          Text('Add')
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: Image.asset(
                          'images/operatingSystem.jpg',
                          width: double.infinity,
                          height: 160.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        ' DataBase Mobile "ITMC322"',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        'يغطي هذاالمقرر على نطاق واسع أنظمة قواعد البيانات المتعددة (MDBS) وأنظمة الوصول إلى البيانات المتنقلة (MDAS)',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.open_in_browser),
                          SizedBox(width: 4.0),
                          Text('Full'),
                          Icon(Icons.add_box),
                          SizedBox(width: 4.0),
                          Text('Add')
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          },
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
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
