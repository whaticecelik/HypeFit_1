import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar
      appBar: AppBar(
        backgroundColor: anarenk,
        title: const Text(
          'HypeFit',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // Makes the text bold
            fontSize: 20, // Optional: Adjust font size
          ),
        ),
        centerTitle: true, // Centers the title
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell,
            color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

   /*   // Drawer (Yan Menü)
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            // Menü öğeleri -yan
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Home Page'),
              onTap: () {
                context.go("/home");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.time),
              title: const Text('Quick Workouts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Healty Recipies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.pencil),
              title: const Text('Journal'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
*/
      // Body with scrolling enabled
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section with Streak Count as Fire Icon on the Right
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures spacing between greeting and streak count
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.jpg'), // Replace with your asset
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Welcome back, Gumball!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.flame, // Fire icon
                        color: Colors.red, // Fire color
                        size: 28,
                      ),
                      SizedBox(width: 4), // Space between the icon and the count
                      Text(
                        '5', // Streak count
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Health Insights Section
              Text(
                'Health Insights',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: HealthCard(
                      title: 'BMI',
                      value: '21.6',
                      color: mavirenk,  // New color for the card
                      icon: Icons.accessibility,
                      onEdit: () {
                        // Add your edit functionality here for BMI
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: HealthCard(
                      title: 'Heart Rate',
                      value: '92 bpm',
                      color: mavirenk,  // New color for the card
                      icon: Icons.favorite,
                      onEdit: () {
                        // Add your edit functionality here for Heart Rate
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: HealthCard(
                      title: 'Steps Taken',
                      value: '3658',
                      color: mavirenk,  // New color for the card
                      icon: Icons.directions_walk,
                      onEdit: () {
                        // Add your edit functionality here for Steps
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: HealthCard(
                      title: 'Hydration Log',
                      value: '1.8 L',
                      color: mavirenk,  // New color for the card
                      icon: Icons.local_drink,
                      onEdit: () {
                        // Add your edit functionality here for Water Intake
                      },
                    ),
                  ),
                ],
              ),

              // Exercise Cards Section (Cardio, Yoga, Weight Training, Stretching, Pilates)
              SizedBox(height: 20),
              Text(
                'Workout Options',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildExerciseCard('Cardio', Icons.directions_run),
                    _buildExerciseCard('Yoga', Icons.self_improvement),
                    _buildExerciseCard('Weight Training', Icons.fitness_center),
                    _buildExerciseCard('Stretching', Icons.accessibility),
                    _buildExerciseCard('Pilates', Icons.fitness_center),  // Added Pilates card
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomMenu(),
    );
  }

  Widget _buildExerciseCard(String title, IconData icon) {
    return Container(
      width: 180,  // Fixed width for the cards
      height: 200, // Fixed height for the cards
      margin: EdgeInsets.only(right: 10),  // Spacing between cards
      child: Card(
        color: mavirenk,  // New background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // "Start" button with an icon beside it
              TextButton.icon(
                onPressed: () {
                  // Add your button functionality here
                  print('Start $title workout');
                },
                icon: Icon(
                  Icons.play_arrow, // Play icon
                  color: Colors.blue,
                ),
                label: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HealthCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;
  final VoidCallback onEdit;

  const HealthCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,  // New background color for the health cards
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.blue, size: 40),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(CupertinoIcons.pencil),
              color: Colors.blue,
              onPressed: onEdit,
            ),
          ),
        ],
      ),
    );
  }
}
