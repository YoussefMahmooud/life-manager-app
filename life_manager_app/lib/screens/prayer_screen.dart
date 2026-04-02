import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../widgets/custom_card.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Map<String, bool> prayers = {
    "الفجر": false,
    "الظهر": false,
    "العصر": false,
    "المغرب": false,
    "العشاء": false,
  };

  @override
  void initState() {
    super.initState();
    loadPrayers();
  }

  Future<void> loadPrayers() async {
    final data = await StorageService.loadPrayerData();

    setState(() {
      prayers = Map<String, bool>.from(data);
    });
  }

  Future<void> savePrayers() async {
    await StorageService.savePrayerData(prayers);
  }

  void togglePrayer(String name) {
    setState(() {
      prayers[name] = !prayers[name]!;
    });

    savePrayers();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم تسجيل صلاة $name ✅")),
    );
  }

  int get completedCount =>
      prayers.values.where((element) => element).length;

  @override
  Widget build(BuildContext context) {
    double progress = completedCount / 5;

    return Scaffold(
      appBar: AppBar(
        title: const Text("متابعة الصلاة"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Progress
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 20),

            Text(
              "صليت $completedCount / 5 اليوم",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            // الصلوات
            ...prayers.keys.map((prayer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomCard(
                  icon: Icons.mosque,
                  color: prayers[prayer]! ? Colors.green : Colors.grey,
                  title: prayer,
                  subtitle: prayers[prayer]!
                      ? "تمت الصلاة ✅"
                      : "لم تصل بعد",
                  onTap: () => togglePrayer(prayer),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}