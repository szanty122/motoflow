import 'package:flutter/material.dart';

void main() {
  runApp(const MotoFlowApp());
}

class MotoFlowApp extends StatelessWidget {
  const MotoFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotoFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffF5F7FA),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildButton(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MotoFlow"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [

            const Text(
              "Witaj 👋",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Co chcesz dziś zrobić?",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            buildButton(
              Icons.car_repair,
              "Moje samochody",
              "Dodaj i zarządzaj pojazdami",
            ),

            buildButton(
              Icons.location_on,
              "Warsztaty",
              "Znajdź najlepszy warsztat",
            ),

            buildButton(
              Icons.smart_toy,
              "AI Mechanik",
              "Opisz problem z autem",
            ),

            buildButton(
              Icons.history,
              "Historia serwisowa",
              "Naprawy i przeglądy",
            ),

            buildButton(
              Icons.calendar_month,
              "Umów wizytę",
              "Rezerwacja online",
            ),

            buildButton(
              Icons.warning_amber,
              "Mam awarię",
              "Szybka pomoc drogowa",
            ),
          ],
        ),
      ),
    );
  }
}