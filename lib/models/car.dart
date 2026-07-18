class Car {
  final String id;
  final String brand;
  final String model;
  final int year;
  final int mileage;
  final String fuel;
  final String engine;
  final String registration;

  const Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.mileage,
    required this.fuel,
    required this.engine,
    required this.registration,
  });

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'] as String,
      brand: map['brand'] as String,
      model: map['model'] as String,
      year: map['year'] as int,
      mileage: map['mileage'] as int,
      fuel: map['fuel'] as String,
      engine: map['engine'] as String,
      registration: map['registration'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'year': year,
      'mileage': mileage,
      'fuel': fuel,
      'engine': engine,
      'registration': registration,
    };
  }
}