import 'package:flutter/material.dart';

class QuranScreen extends StatefulWidget {
  @override
  _QuranScreenState createState() => _QuranScreenState();
}
class _QuranScreenState extends State<QuranScreen> {
  int pagesRead = 0;
  int totalPages = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ورد القرآن"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "تقدمك اليومي",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Card(
              child: ListTile(
                title: Text("عدد الصفحات"),
                subtitle: Text("$pagesRead / $totalPages صفحات"),
              ),
            ),

            SizedBox(height: 10),

            Card(
              child: ListTile(
                title: Text("آخر قراءة"),
                subtitle: Text("لم تبدأ بعد"),
              ),
            ),

            SizedBox(height: 20),

           ElevatedButton(
           onPressed: () {
  if (pagesRead < totalPages) {
    setState(() {
      pagesRead++;
    });
  } else {
    // وصل للهدف
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("🔥 ممتاز!"),
        content: Text("خلصت وردك 👏\nتحب تكمل وتزود صفحات؟"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("لا"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                totalPages += 1; // تزود الهدف
              });
              Navigator.pop(context);
            },
            child: Text("أكمل 💪"),
          ),
        ],
      ),
    );
  }
},
  child: Text("بدأت القراءة"),
),

          ],
        ),
      ),
    );
  }
}