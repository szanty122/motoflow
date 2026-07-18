import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/car.dart';

class CarService {
  final _supabase = Supabase.instance.client;

  Future<List<Car>> getCars() async {
    final data = await _supabase
        .from('cars')
        .select()
        .order('created_at');

    return (data as List)
        .map((e) => Car.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> addCar(Car car) async {
    await _supabase.from('cars').insert({
      'brand': car.brand,
      'model': car.model,
      'year': car.year,
      'mileage': car.mileage,
      'fuel': car.fuel,
      'engine': car.engine,
      'registration': car.registration,
    });
  }

  Future<void> deleteCar(String id) async {
    await _supabase.from('cars').delete().eq('id', id);
  }
}