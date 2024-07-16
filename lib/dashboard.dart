import 'package:flutter/material.dart';
import 'fonts.dart'; // Mengimpor file fonts.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReaderStatsPage(),
    );
  }
}

class ReaderStatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Amy's reader stats", style: AppFonts.headline2),
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BookCard(),
              SizedBox(height: 16),
              StatsGrid(),
              SizedBox(height: 16),
              AddFriendsButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "War and Peace",
            style: AppFonts.headline2,
          ),
          SizedBox(height: 8),
          ProgressBar(progress: 543, total: 1225),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int progress;
  final int total;

  ProgressBar({required this.progress, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$progress Out of $total pages",
          style: AppFonts.bodyText1,
        ),
        SizedBox(height: 4),
        Stack(
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 8,
              width: (progress / total) * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFFEDE67), // Kuning
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        StatCard(
          title: "TIME",
          value: "6:24",
          description:
              "Global avg. read time for your progress 7:28\n23% faster",
          color: Color(0xFFFF9B60), // Merah
        ),
        StatCard(
          title: "STREAK",
          value: "7",
          description:
              "Day streak, come back tomorrow to keep it up!\n19% more consistent",
          color: Color(0xFFB6F36A), // Hijau
        ),
        StatCard(
          title: "LEVEL",
          value: "2",
          description: "145 reader points to level up!\nTop 5% for this book",
          color: Color(0xFFC9A0FF), // Ungu
        ),
        StatCard(
          title: "Badges",
          value: "",
          description: "6 badges",
          color: Color(0xFF94DBFB), // Biru
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String description;
  final Color color;

  StatCard({
    required this.title,
    required this.value,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.bodyText2,
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: AppFonts.headline1,
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: AppFonts.bodyText2,
          ),
        ],
      ),
    );
  }
}

class AddFriendsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Add friends",
        style: AppFonts.button,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF787F99), // Button bawah
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
