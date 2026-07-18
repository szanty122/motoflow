import 'package:flutter/material.dart';

import '../../core/widgets/car_card.dart';
import '../../core/widgets/dashboard_tile.dart';
import '../../models/car.dart';
import '../garage/garage_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const car = Car(
      brand: "Opel",
      model: "Vectra C GTS",
      year: 2003,
      mileage: 287000,
      fuel: "Benzyna + LPG",
      engine: "2.0 Turbo",
      registration: "KBC 12345",
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("MotoFlow"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarCard(car: car),

            const SizedBox(height: 30),

            const Text(
              "Szybkie akcje",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.05,
              children: [
                DashboardTile(
                  icon: Icons.directions_car,
                  title: "Mój garaż",
                  color: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const GarageScreen(),
                      ),
                    );
                  },
                ),
                DashboardTile(
                  icon: Icons.smart_toy,
                  title: "AI Mechanik",
                  color: Colors.green,
                  onTap: () {},
                ),
                DashboardTile(
                  icon: Icons.build,
                  title: "Warsztaty",
                  color: Colors.orange,
                  onTap: () {},
                ),
                DashboardTile(
                  icon: Icons.calendar_month,
                  title: "Wizyty",
                  color: Colors.purple,
                  onTap: () {},
                ),
                DashboardTile(
                  icon: Icons.history,
                  title: "Historia",
                  color: Colors.red,
                  onTap: () {},
                ),
                DashboardTile(
                  icon: Icons.person,
                  title: "Profil",
                  color: Colors.teal,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}