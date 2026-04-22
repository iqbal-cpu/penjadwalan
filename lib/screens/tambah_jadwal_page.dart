import 'package:flutter/material.dart';
import '../models/jadwal_model.dart';

class TambahJadwalPage extends StatefulWidget {
  const TambahJadwalPage({super.key});

  @override
  State<TambahJadwalPage> createState() => _TambahJadwalPageState();
}

class _TambahJadwalPageState extends State<TambahJadwalPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  String _hariDipilih = 'Senin';

  final List<String> _hariList = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  @override
  void dispose() {
    _judulController.dispose();
    _jamController.dispose();
    _lokasiController.dispose();
    _keteranganController.dispose();
    super.dispose();
  }

  void _simpanJadwal() {
    if (_formKey.currentState!.validate()) {
      final jadwalBaru = JadwalModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        judul: _judulController.text.trim(),
        hari: _hariDipilih,
        jam: _jamController.text.trim(),
        lokasi: _lokasiController.text.trim(),
        keterangan: _keteranganController.text.trim(),
      );

      Navigator.pop(context, jadwalBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Tambah Jadwal',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                controller: _judulController,
                label: 'Judul Jadwal',
                icon: Icons.book,
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _hariDipilih,
                decoration: InputDecoration(
                  labelText: 'Hari',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: _hariList.map((hari) {
                  return DropdownMenuItem(
                    value: hari,
                    child: Text(hari),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _hariDipilih = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              _buildTextField(
                controller: _jamController,
                label: 'Jam',
                icon: Icons.access_time,
                hint: 'Contoh: 08:00 - 10:00',
              ),
              const SizedBox(height: 16),

              _buildTextField(
                controller: _lokasiController,
                label: 'Lokasi',
                icon: Icons.location_on,
              ),
              const SizedBox(height: 16),

              _buildTextField(
                controller: _keteranganController,
                label: 'Keterangan',
                icon: Icons.notes,
                maxLines: 3,
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _simpanJadwal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Simpan Jadwal',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Catatan:\nFitur ini masih tahap awal. Data belum tersimpan permanen dan belum terhubung ke database / notifikasi.',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label wajib diisi';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}