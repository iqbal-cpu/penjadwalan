import 'package:flutter/material.dart';
import 'screens/jadwal_page.dart';

class MyScheduleApp extends StatelessWidget {
  const MyScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Penjadwalan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const JadwalPage(),
    );
  }
}