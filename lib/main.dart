import 'package:flutter/material.dart';
import 'form_tambah_tugas_page.dart';
import 'detail_tugas_page.dart';

void main() {
  runApp(const MyTaskApp());
}

class MyTaskApp extends StatelessWidget {
  const MyTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class TaskItem {
  final String title;
  final bool done;

  TaskItem({
    required this.title,
    this.done = false,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _comingSoon(BuildContext context, String fitur) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$fitur masih dalam proses pengembangan'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<TaskItem> tasks = [
      TaskItem(title: 'Tugas Flutter', done: false),
      TaskItem(title: 'Tugas Basis Data', done: false),
      TaskItem(title: 'Tugas UI/UX', done: true),
      TaskItem(title: 'Tugas Mobile Lanjut', done: false),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _comingSoon(context, 'Menu'),
          icon: const Icon(Icons.menu),
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
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          children: [
            // Progress
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Progress Tugas',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const LinearProgressIndicator(
                value: 0.6,
                minHeight: 10,
                backgroundColor: Color(0xFFE0E0E0),
                valueColor: AlwaysStoppedAnimation(Color(0xFF9E9E9E)),
              ),
            ),
            const SizedBox(height: 6),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '60 % Selesai',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 14),

            // Dropdown dummy
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Semua Tugas',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // List tugas
            Expanded(
              child: ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DetailTugasPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3E3E3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            task.done
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            size: 20,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              children: [
                                _fakeLine(width: double.infinity),
                                const SizedBox(height: 8),
                                _fakeLine(width: 180),
                                const SizedBox(height: 8),
                                _fakeLine(width: 130),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom button
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SizedBox(
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FormTambahTugasPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD9D9D9),
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0,
              ),
              icon: const Icon(Icons.add),
              label: const Text(
                'Tugas Baru',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fakeLine({double width = 120}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 8,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}   