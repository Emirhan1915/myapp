import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InboxScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class InboxScreen extends StatelessWidget {
  final List<Map<String, String>> emails = [
    {"sender": "Ahmet", "subject": "nasılsın iyimisin", "date": "20 May"},
    {"sender": "Mehmet", "subject": "akşam halısaha var mı", "date": "19 May"},
    {"sender": "Koray", "subject": "memlekete ne zaman geleceksin", "date": "18 May"},
    {"sender": "Osman", "subject": "müsaitmisin?", "date": "17 May"},
    {"sender": "Kadir", "subject": "Merhaba biraz zamanın varmı", "date": "16 May"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-postalarda arama yapin"),
        actions: [Icon(Icons.search)],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Tüm gelen kutulari", style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emails.length,
              itemBuilder: (context, index) {
                final email = emails[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getColor(email["sender"]),
                    child: Text(email["sender"]![0]),
                  ),
                  title: Text(email["subject"]!),
                  subtitle: Text(email["date"]!),
                  trailing: Icon(Icons.star_border),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        tooltip: "Olustur",
      ),
    );
  }

  Color _getColor(String? sender) {
    if (sender == "ahmet") return Colors.green;
    if (sender == "mehmet") return Colors.pink;
    if (sender == "koray") return Colors.grey;
    if (sender == "osman") return Colors.blue;
    return Colors.grey;
  }
}