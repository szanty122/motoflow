import 'package:flutter/material.dart';
import '../../models/car.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1565FF),
            Color(0xFF0B43D6),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.directions_car_filled,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(width: 12),
              Text(
                "Mój samochód",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            "${car.brand} ${car.model}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: _infoTile(Icons.calendar_today, "Rocznik", "${car.year}"),
              ),
              Expanded(
                child: _infoTile(Icons.speed, "Przebieg", "${car.mileage} km"),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Expanded(
                child: _infoTile(Icons.local_gas_station, "Paliwo", car.fuel),
              ),
              Expanded(
                child: _infoTile(Icons.settings, "Silnik", car.engine),
              ),
            ],
          ),

          const SizedBox(height: 18),

          _infoTile(
            Icons.confirmation_number,
            "Rejestracja",
            car.registration,
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 12,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}