import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anarenk,
        title: const Text('Profile',
          style: TextStyle(
          color: Colors.white, 
          ),),
        ),
      body: Center(
        child: DotLottieLoader.fromAsset(
          "assets/motions/soon.lottie",
          frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
            if (dotlottie != null) {
              return Lottie.memory(dotlottie.animations.values.single);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
      
    );
  }
}
