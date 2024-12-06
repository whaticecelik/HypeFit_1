//import 'package:flutter/material.dart';
import 'package:flutter_app/screens/favs_screen.dart';
import 'package:flutter_app/screens/stats._screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/',  // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/favs',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/stats',
      builder: (context, state) => const StatsScreen(),
    ),
  ],
);
