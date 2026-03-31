import 'package:flutter/material.dart';

class QuranScreen extends StatelessWidget {
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
                subtitle: Text("0 / 2 صفحات"),
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
              onPressed: () {},
              child: Text("بدأت القراءة"),
            ),

          ],
        ),
      ),
    );
  }
}