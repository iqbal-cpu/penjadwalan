import 'package:flutter/material.dart';
import '../models/jadwal_model.dart';
import 'tambah_jadwal_page.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  final List<JadwalModel> _jadwalList = [
    JadwalModel(
      id: '1',
      judul: 'Pemrograman Mobile',
      hari: 'Senin',
      jam: '08:00 - 10:00',
      lokasi: 'Lab Komputer',
      keterangan: 'Belajar Flutter dasar',
    ),
    JadwalModel(
      id: '2',
      judul: 'Basis Data',
      hari: 'Selasa',
      jam: '10:00 - 12:00',
      lokasi: 'Ruang 2.1',
      keterangan: 'Materi ERD dan SQL',
    ),
  ];

  void _tambahJadwal(JadwalModel jadwalBaru) {
    setState(() {
      _jadwalList.add(jadwalBaru);
    });
  }

  void _hapusJadwal(String id) {
    setState(() {
      _jadwalList.removeWhere((item) => item.id == id);
    });
  }

  Color _warnaHari(String hari) {
    switch (hari.toLowerCase()) {
      case 'senin':
        return Colors.blue;
      case 'selasa':
        return Colors.green;
      case 'rabu':
        return Colors.orange;
      case 'kamis':
        return Colors.purple;
      case 'jumat':
        return Colors.red;
      case 'sabtu':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Penjadwalan Jadwal',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _jadwalList.isEmpty
          ? const Center(
        child: Text(
          'Belum ada jadwal',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _jadwalList.length,
        itemBuilder: (context, index) {
          final jadwal = _jadwalList[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          jadwal.judul,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: _warnaHari(jadwal.hari).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          jadwal.hari,
                          style: TextStyle(
                            color: _warnaHari(jadwal.hari),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 18),
                      const SizedBox(width: 8),
                      Text(jadwal.jam),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(jadwal.lokasi)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.notes, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(jadwal.keterangan)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => _hapusJadwal(jadwal.id),
                      icon: const Icon(Icons.delete, color: Colors.red),
                      label: const Text(
                        'Hapus',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () async {
          final hasil = await Navigator.push<JadwalModel>(
            context,
            MaterialPageRoute(
              builder: (_) => const TambahJadwalPage(),
            ),
          );

          if (hasil != null) {
            _tambahJadwal(hasil);
          }
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Tambah Jadwal',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}