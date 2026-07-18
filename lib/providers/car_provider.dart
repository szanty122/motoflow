import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/car.dart';

final carProvider = StateProvider<List<Car>>((ref) {
  return [
    const Car(
      brand: "Opel",
      model: "Vectra C GTS",
      year: 2003,
      mileage: 287000,
      fuel: "Benzyna + LPG",
      engine: "2.0 Turbo",
      registration: "KBC12345",
    ),
    const Car(
      brand: "BMW",
      model: "320d",
      year: 2018,
      mileage: 165000,
      fuel: "Diesel",
      engine: "2.0",
      registration: "KR54321",
    ),
  ];
});