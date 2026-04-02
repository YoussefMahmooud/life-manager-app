import 'package:flutter/material.dart';
import 'quran_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الجانب الروحي",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Icon(Icons.menu_book, color: Colors.green),
                  title: Text("ورد القرآن"),
                  subtitle: Text("اقرأ وردك اليومي"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuranScreen()),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.mosque, color: Colors.blue),
                  title: Text("الصلاة"),
                  subtitle: Text("متابعة الصلوات اليومية"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      Center(child: Text("Planner")),
      Center(child: Text("Goals")),
      Center(child: Text("Stats")),
      Center(child: Text("AI")),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Planner",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Goals"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: "AI"),
        ],
      ),
    );
  }
}
