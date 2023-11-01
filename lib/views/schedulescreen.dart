import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latihan2/models/user.dart';
import 'package:latihan2/views/pagescreen.dart';
import 'package:flutter/services.dart';
import 'package:latihan2/models/date_box.dart';

class ScheduleScreen extends StatefulWidget {
  final User user;

  ScheduleScreen({required this.user});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<String> dateList = []; // List untuk menyimpan tanggal-tanggal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Ganti dengan path ke gambar latar belakang Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Your Schedule',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemExtent: 70, // Tinggi total per item (termasuk jarak)
                    itemCount: dateList.length,
                    itemBuilder: (context, index) {
                      final date = dateList[index];
                      return Container(
                        height: 70, // Sesuaikan tinggi dengan itemExtent
                        child:  DateBox(
                          date: date,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPage(date: date)));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50, left: 30), // Atur jarak dari bawah
          child: FloatingActionButton(
            onPressed: () {
              if (dateList.isEmpty) {
                // Jika tidak ada kotak, tambahkan kotak pertama dengan tanggal saat ini
                final currentDate = DateTime.now();
                final formattedDate = DateFormat('d MMM y').format(currentDate);
                setState(() {
                  dateList.add(formattedDate);
                });
              } else {
                // Jika sudah ada kotak, tambahkan kotak baru dengan tanggal berikutnya
                final lastDate = DateFormat('d MMM y').parse(dateList.last);
                final nextDate = lastDate.add(Duration(days: 1));
                final formattedDate = DateFormat('d MMM y').format(nextDate);
                setState(() {
                  dateList.add(formattedDate);
                  if (dateList.length > 8) {
                    // Jika jumlah kotak lebih dari 7, hapus kotak paling bawah
                    dateList.removeAt(0);
                  }
                });
              }
            },
            child: Icon(Icons.add), // Ikon +
          ),
        ),
      ),
    );
  }
}
