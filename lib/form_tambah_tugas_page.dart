import 'package:flutter/material.dart';

class FormTambahTugasPage extends StatelessWidget {
  const FormTambahTugasPage({super.key});

  void _comingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fitur tambah tugas masih dalam proses pengembangan'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Form Tambah Tugas',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Judul
            Container(
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFDCDCDC),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan judul tugas',
                  hintStyle: TextStyle(fontSize: 13),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Prioritas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            const RadioListTile<String>(
              value: 'tinggi',
              groupValue: null,
              onChanged: null,
              title: Text('Tinggi'),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
            const RadioListTile<String>(
              value: 'sedang',
              groupValue: null,
              onChanged: null,
              title: Text('Sedang'),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
            const RadioListTile<String>(
              value: 'rendah',
              groupValue: null,
              onChanged: null,
              title: Text('Rendah'),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),

            const SizedBox(height: 22),

            _boxField(label: 'Tanggal  :'),
            const SizedBox(height: 10),
            _boxField(label: 'Waktu    :'),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () => _comingSoon(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAFA7A7),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'TAMBAH TUGAS',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const Spacer(),

            Center(
              child: Container(
                width: 90,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxField({required String label}) {
    return Container(
      width: double.infinity,
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFDCDCDC),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}