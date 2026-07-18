import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/car.dart';
import '../../providers/car_provider.dart';

class AddCarScreen extends ConsumerStatefulWidget {
  const AddCarScreen({super.key});

  @override
  ConsumerState<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends ConsumerState<AddCarScreen> {
  final brand = TextEditingController();
  final model = TextEditingController();
  final year = TextEditingController();
  final mileage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj samochód"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: brand,
              decoration: const InputDecoration(labelText: "Marka"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: model,
              decoration: const InputDecoration(labelText: "Model"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: year,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Rok"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: mileage,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Przebieg"),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final notifier = ref.read(carProvider.notifier);

                  notifier.state = [
                    ...notifier.state,
                    Car(
                      brand: brand.text,
                      model: model.text,
                      year: int.tryParse(year.text) ?? 0,
                      mileage: int.tryParse(mileage.text) ?? 0,
                      fuel: "-",
                      engine: "-",
                      registration: "-",
                    ),
                  ];

                  Navigator.pop(context);
                },
                child: const Text("Dodaj samochód"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}