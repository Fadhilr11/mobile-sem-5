import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan2/views/homescreen.dart';
import 'package:latihan2/views/profilescreen.dart';
import 'package:latihan2/views/schedulescreen.dart';


import 'package:latihan2/controllers/user_controller.dart';

void main() {
  final userController = UserController();

  runApp(
    MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          extendBody: true, // Membuat latar belakang memperpanjang di bawah navbar
          backgroundColor: Colors.transparent, // Mengatur latar belakang Scaffold menjadi transparan
          body: TabBarView(
            children: [
              HomeScreen(user: userController.user),
              ScheduleScreen(user: userController.user),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.schedule,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
