import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Ganti dengan path ke gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.pickImage(),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: controller.imagePath.value.isNotEmpty
                            ? FileImage(File(controller.imagePath.value))
                            : null,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Text(
                  'Your information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // Ubah warna teks menjadi putih
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4), // Ubah warna latar belakang
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white), // Ubah warna border menjadi putih
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(fontSize: 13, color: Colors.white), // Ubah warna teks menjadi putih
                              ),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fadhil Rahman',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white, // Ubah warna teks menjadi putih
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Birthday',
                                style: TextStyle(fontSize: 13, color: Colors.white), // Ubah warna teks menjadi putih
                              ),
                              SizedBox(height: 10),
                              Text(
                                '17 Nov 2003',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Ubah warna teks menjadi putih
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                buildInfoColumn('Email', 'fadhilrahman@webmail.umm.ac.id'),
                buildInfoColumn('Phone', '0812-8877-3590'),
                buildInfoColumn('Location', 'Malang, Indonesia'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoColumn(String title, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5), // Ubah warna latar belakang
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white), // Ubah warna border menjadi putih
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13, color: Colors.white), // Ubah warna teks menjadi putih
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.info,
                size: 16,
                color: Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), // Ubah warna teks menjadi putih
              ),
            ],
          ),
        ],
      ),
    );
  }
}
