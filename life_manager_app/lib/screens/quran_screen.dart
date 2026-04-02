import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../widgets/custom_card.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  int pagesRead = 0;
  int totalPages = 2;
  String lastRead = "لم تبدأ بعد";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // تحميل البيانات
  Future<void> loadData() async {
    final data = await StorageService.loadProgress();

    setState(() {
      pagesRead = data['pagesRead'];
      totalPages = data['totalPages'];
      lastRead = data['lastRead'];
    });
  }

  // حفظ البيانات
  Future<void> saveData() async {
    await StorageService.saveProgress(
      pagesRead: pagesRead,
      totalPages: totalPages,
      lastRead: lastRead,
    );
  }

  // بدء القراءة
  void handleRead() {
    if (pagesRead < totalPages) {
      setState(() {
        pagesRead++;
        lastRead = "الآن";
      });

      saveData();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("👍 كمل يا بطل!")),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("🔥 ممتاز!"),
          content: const Text("خلصت وردك 👏\nتحب تكمل؟"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("كفاية"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  totalPages++;
                });
                saveData();
                Navigator.pop(context);
              },
              child: const Text("أكمل 💪"),
            ),
          ],
        ),
      );
    }
  }

  // إعادة التعيين
  void resetProgress() {
    setState(() {
      pagesRead = 0;
      totalPages = 2;
      lastRead = "لم تبدأ بعد";
    });
    saveData();
  }

  @override
  Widget build(BuildContext context) {
    double progress =
        totalPages == 0 ? 0 : (pagesRead / totalPages).clamp(0, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ورد القرآن"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetProgress,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "تقدمك اليومي",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
              ),
            ),

            const SizedBox(height: 20),

            // عدد الصفحات
            CustomCard(
              icon: Icons.menu_book,
              color: Colors.green,
              title: "عدد الصفحات",
              subtitle: "$pagesRead / $totalPages صفحات",
            ),

            const SizedBox(height: 10),

            // آخر قراءة
            CustomCard(
              icon: Icons.access_time,
              color: Colors.blue,
              title: "آخر قراءة",
              subtitle: lastRead,
            ),

            const SizedBox(height: 30),

            // زر القراءة
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: handleRead,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "بدأت القراءة",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // زر إعادة التعيين
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: resetProgress,
                child: const Text("إعادة التعيين"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}