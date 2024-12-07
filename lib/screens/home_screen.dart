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
      backgroundColor: second,
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

      // Body with scrolling enabled
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.jpg'), 
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Welcome back, Tyler!',
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
                        color: Colors.orange, // Fire color
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
                      color: Colors.white,  
                      icon: Icons.accessibility,
                      onEdit: () {
                        
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: HealthCard(
                      title: 'Heart Rate',
                      value: '92 bpm',
                      color: Colors.white,  // New color for the card
                      icon: Icons.favorite,
                      onEdit: () {
                        
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
                      color: Colors.white,  // New color for the card
                      icon: Icons.directions_walk,
                      onEdit: () {
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: HealthCard(
                      title: 'Hydration Log',
                      value: '1.8 L',
                      color: Colors.white,  // New color for the card
                      icon: Icons.local_drink,
                      onEdit: () {
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
                    _buildExerciseCard('Cardio', Icons.directions_run, 'assets/images/cardio.jpg'),
                    _buildExerciseCard('Weight Training', Icons.fitness_center, 'assets/images/weight_training.jpg'),
                    _buildExerciseCard('Yoga', Icons.self_improvement, 'assets/images/yoga.jpg'),
                    _buildExerciseCard('Pilates', Icons.fitness_center, 'assets/images/pilates.jpeg'), 
                    _buildExerciseCard('Stretching', Icons.accessibility, 'assets/images/stretching.jpeg'), 
                  ],
                ),
              ),

              // New Recipes Section
              SizedBox(height: 20),
              Text(
                'Recipes for a Stronger You',
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
                    _buildRecipeCard('Smart Snack Choices','assets/images/smart_snack.jpg'),
                    _buildRecipeCard('Eats for Endurance', 'assets/images/eats_endurance.jpg'),
                    _buildRecipeCard('Guilt-Free Sweets', 'assets/images/guilt_free_sweets.jpg'),
                    _buildRecipeCard('Smoothies', 'assets/images/smoothies.png'),
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

  Widget _buildExerciseCard(String title, IconData icon, String imagePath) {
    return Container(
      width: 180,  
      height: 200, 
      margin: EdgeInsets.only(right: 10),  
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,  // Ensures the image covers the card
              ),
              Container(
                color: Colors.black.withOpacity(0.5),  // Dark overlay for better text visibility
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeCard(String title, String imagePath) {
    return Container(
      width: 180,  // Fixed width for the cards
      height: 200, // Fixed height for the cards
      margin: EdgeInsets.only(right: 10),  // Spacing between cards
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,  // Ensures the image covers the card
              ),
              Container(
                color: Colors.black.withOpacity(0.5),  // Dark overlay for better text visibility
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
      color: color,  
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
                Icon(icon, color: yesilrenk, size: 40),
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
              color: yesilrenk,
              onPressed: onEdit,
            ),
          ),
        ],
      ),
    );
  }
}
