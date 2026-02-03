// lib/ui/views/main_navigation.dart
import 'package:flutter/material.dart';
import 'home_view.dart';
import 'peminjaman_view.dart';
import 'permintaan_view.dart';
import 'profile_view.dart';

class MainNavigation extends StatefulWidget {
  final Map userData;
  MainNavigation({required this.userData});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeView(userData: widget.userData),
      PeminjamanView(),
      PermintaanView(),
      ProfileView(userData: widget.userData),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Peminjaman",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Permintaan",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
