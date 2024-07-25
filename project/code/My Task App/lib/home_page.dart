import 'package:flutter/material.dart';
import 'tasks_page.dart';
import 'settings_page.dart';
import 'listViewItems.dart';

class HomePage extends StatelessWidget {



  const HomePage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.studentId,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  final String studentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: const Text("Home Page", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [

          ListViewItem(
            imageUrl: 'https://149990825.v2.pressablecdn.com/wp-content/uploads/2023/09/Istanbul1.jpg',
            title: 'Istanbul',
            text: 'Istanbul is a major city in Turkey that straddles Europe and Asia across the Bosphorus Strait. It is renowned for its rich history, diverse culture, and significant landmarks such as the Hagia Sophia, the Blue Mosque, and the Grand Bazaar.',
          ),

          ListViewItem(
            imageUrl: 'https://scontent.ftip3-2.fna.fbcdn.net/v/t39.30808-6/243925941_969070250319754_3170306765693253692_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=3a1ebe&_nc_ohc=-Xc0wmOVobgQ7kNvgHG2A_G&_nc_ht=scontent.ftip3-2.fna&oh=00_AYBconDqRMgMAOLoZ7aV6bSXqfDHOQkWZ6NRNcotJ2TP0w&oe=66A56EDF',
            title: 'Tripoli',
            text: 'Tripoli is the capital city of Libya, located along the Mediterranean coast. It is known for its vibrant markets, historic architecture, and cultural landmarks, including the ancient medina and the Red Castle.',
          ),

          ListViewItem(
            imageUrl: 'https://ik.imagekit.io/tvlk/blog/2023/06/bao-tang-tuong-lai-dubai-4.jpg?tr=dpr-2,w-675',
            title: 'Dubai',
            text: 'Dubai is a bustling city in the United Arab Emirates known for its modern architecture, luxury shopping, and vibrant nightlife. It boasts iconic landmarks like the Burj Khalifa, the worlds tallest building, and the Palm Jumeirah, an artificial archipelago. Dubai is a global hub for tourism, business, and innovation.',
          ),

          ListViewItem(
            imageUrl: 'https://as2.ftcdn.net/v2/jpg/01/00/21/83/1000_F_100218316_WbRzPWf4xNTI2xUfljBxKv7R3RILjVq6.jpg',
            title: 'Kuala Lumpur',
            text: 'Kuala Lumpur, the capital city of Malaysia, is a vibrant metropolis known for its iconic skyline dominated by the Petronas Twin Towers. It is a melting pot of cultures with a rich blend of Malay, Chinese, and Indian influences. The city offers a mix of modern architecture, bustling markets, and lush green parks. Kuala Lumpur is a key economic and cultural hub in Southeast Asia.',
          ),

          ListViewItem(
            imageUrl: 'https://cdn.getyourguide.com/img/tour/33cca66c19886c9f.jpeg/98.jpg',
            title: 'Rome',
            text: 'Rome is the capital city of Italy, known for its rich history, stunning architecture, and significant cultural heritage. It’s home to landmarks such as the Colosseum, the Roman Forum, and the Vatican City.',
          ),

        ],
      ),






      //Bottom Navigator Bar
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              //Settings Page Button
              InkWell(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SettingsPage(
                    firstName: firstName,
                    lastName: lastName,
                    studentId: studentId,
                  )),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  TasksPage(
                      firstName: firstName,
                      lastName: lastName,
                      studentId: studentId,
                    )),
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
