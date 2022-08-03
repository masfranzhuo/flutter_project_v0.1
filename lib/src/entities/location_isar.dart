import 'package:equatable/equatable.dart';
import 'package:flutter_project/src/entities/location.dart';
import 'package:isar/isar.dart';

part 'location_isar.g.dart';

@Collection()
class LocationIsar extends Equatable {
  final int id = Isar.autoIncrement;
  final String street;
  final String city;
  final String state;
  final String country;
  final String timezone;

  LocationIsar({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.timezone,
  });

  @override
  List<Object> get props => [id, street, city, state, country, timezone];

  factory LocationIsar.fromLocation(Location location) {
    final locationIsar = LocationIsar(
      street: location.street,
      city: location.city,
      state: location.state,
      country: location.country,
      timezone: location.timezone,
    );
    return locationIsar;
  }

  Location toLocation() {
    final location = Location(
      street: street,
      city: city,
      state: state,
      country: country,
      timezone: timezone,
    );
    return location;
  }
}
