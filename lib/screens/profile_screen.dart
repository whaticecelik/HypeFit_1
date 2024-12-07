import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anarenk,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture and Name
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/user.jpg'), // Replace with your image path
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Tyler Durden', // Replace with dynamic user name
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Imaginary User', // Replace with user's occupation or description
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Fitness Stats Section
              const Text(
                'Fitness Stats',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Wrap Row with SingleChildScrollView for horizontal scrolling
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FitnessStatCard(
                      label: 'Workouts',
                      value: '120', // Replace with dynamic data
                    ),
                    FitnessStatCard(
                      label: 'Calories Burned',
                      value: '2500 kcal', // Replace with dynamic data
                    ),
                    FitnessStatCard(
                      label: 'Goals Completed',
                      value: '5', // Replace with dynamic data
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Personal Information Section
              const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ProfileInfoCard(
                label: 'Age',
                value: '28', // Replace with dynamic data
              ),
              ProfileInfoCard(
                label: 'Height',
                value: '180"', // Replace with dynamic data
              ),
              ProfileInfoCard(
                label: 'Weight',
                value: '71 kg', // Replace with dynamic data
              ),
              const SizedBox(height: 32),

              // Edit Profile Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to edit profile screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Adjust button color if needed
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16,
                    color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class FitnessStatCard extends StatelessWidget {
  final String label;
  final String value;

  const FitnessStatCard({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoCard({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(label),
        trailing: Text(value),
      ),
    );
  }
}
