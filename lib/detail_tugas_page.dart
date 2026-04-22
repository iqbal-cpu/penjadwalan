import 'package:flutter/material.dart';

class DetailTugasPage extends StatelessWidget {
  const DetailTugasPage({super.key});

  void _comingSoon(BuildContext context, String fitur) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$fitur masih dalam proses pengembangan'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Tugas APP',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _comingSoon(context, 'Profil'),
            icon: const Icon(Icons.person_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tugas Flutter',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Text(
                  'Prioritas : ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 70,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Text(
                  'Deadline : ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 90,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),
            const Divider(),
            const SizedBox(height: 14),

            const Text(
              'Aksi Tersedia',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 20),

            _actionButton(
              context,
              icon: Icons.check_box,
              label: 'Centang Selesai',
              onTap: () => _comingSoon(context, 'Fitur centang selesai'),
            ),

            const SizedBox(height: 12),

            _actionButton(
              context,
              icon: Icons.edit,
              label: 'Edit Tugas',
              onTap: () => _comingSoon(context, 'Fitur edit tugas'),
            ),

            const SizedBox(height: 12),

            _actionButton(
              context,
              icon: Icons.close,
              label: 'Hapus Tugas',
              onTap: () => _comingSoon(context, 'Fitur hapus tugas'),
            ),

            const SizedBox(height: 28),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8E1E1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  '<< Geser ke kiri untuk hapus',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
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

  Widget _actionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18, color: Colors.black87),
        label: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFD9D9D9),
          side: const BorderSide(color: Colors.black38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}