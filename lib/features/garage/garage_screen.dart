import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/car_provider.dart';
import 'add_car_screen.dart';

class GarageScreen extends ConsumerWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carsAsync = ref.watch(carsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mój garaż"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddCarScreen(),
            ),
          );

          ref.read(carsProvider.notifier).loadCars();
        },
      ),
      body: carsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(
          child: Text("Błąd: $e"),
        ),
        data: (cars) {
          if (cars.isEmpty) {
            return const Center(
              child: Text(
                "Brak samochodów.\nDodaj pierwszy samochód.",
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.directions_car),
                  ),
                  title: Text("${car.brand} ${car.model}"),
                  subtitle: Text(
                    "${car.year} • ${car.mileage} km\n${car.engine} • ${car.fuel}",
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await ref
                          .read(carsProvider.notifier)
                          .deleteCar(car.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}