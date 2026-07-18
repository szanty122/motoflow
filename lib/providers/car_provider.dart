import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/car.dart';
import '../services/car_service.dart';

final carServiceProvider = Provider((ref) => CarService());

final carsProvider =
    StateNotifierProvider<CarNotifier, AsyncValue<List<Car>>>((ref) {
  return CarNotifier(ref.read(carServiceProvider));
});

class CarNotifier extends StateNotifier<AsyncValue<List<Car>>> {
  final CarService _service;

  CarNotifier(this._service) : super(const AsyncLoading()) {
    loadCars();
  }

  Future<void> loadCars() async {
    try {
      final cars = await _service.getCars();
      state = AsyncData(cars);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addCar(Car car) async {
    await _service.addCar(car);
    await loadCars();
  }

  Future<void> deleteCar(String id) async {
    await _service.deleteCar(id);
    await loadCars();
  }
}