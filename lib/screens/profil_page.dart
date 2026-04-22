import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Nama
            Text(
              'Ghany Daestha Sandyca',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10),

            // NIM
            Text(
              '240103098',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            // Alamat
            Text(
              'jln tulang bawang utara 5 ,rt 3 rw 11 ,kadipiro,banjarsari,surakarta',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20),

            // Icon + teks
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                SizedBox(width: 10),
                Text(''),
              ],
            ),

            SizedBox(height: 20),

            // Hobi
            Text(
              'Hobi: Bermain Game',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}