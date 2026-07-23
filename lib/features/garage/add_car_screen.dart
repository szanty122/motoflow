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
  final fuel = TextEditingController();
  final engine = TextEditingController();
  final registration = TextEditingController();

  @override
  void dispose() {
    brand.dispose();
    model.dispose();
    year.dispose();
    mileage.dispose();
    fuel.dispose();
    engine.dispose();
    registration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj samochód"),
      ),
      body: SingleChildScrollView(
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
            const SizedBox(height: 12),

            TextField(
              controller: fuel,
              decoration: const InputDecoration(labelText: "Paliwo"),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: engine,
              decoration: const InputDecoration(labelText: "Silnik"),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: registration,
              decoration: const InputDecoration(labelText: "Rejestracja"),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final car = Car(
                    id: '',
                    brand: brand.text,
                    model: model.text,
                    year: int.tryParse(year.text) ?? 0,
                    mileage: int.tryParse(mileage.text) ?? 0,
                    fuel: fuel.text,
                    engine: engine.text,
                    registration: registration.text,
                  );

                  try {
                    await ref.read(carServiceProvider).addCar(car);

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  } catch (e) {
                    debugPrint(e.toString());

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  }
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