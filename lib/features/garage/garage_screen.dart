import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/car_provider.dart';
import 'add_car_screen.dart';

class GarageScreen extends ConsumerWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cars = ref.watch(carProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mój garaż"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddCarScreen(),
            ),
          );
        },
      ),
      body: ListView.builder(
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
              subtitle: Text("${car.year} • ${car.mileage} km"),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  final notifier = ref.read(carProvider.notifier);

                  final list = [...notifier.state];
                  list.removeAt(index);
                  notifier.state = list;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}