import 'package:equatable/equatable.dart';
import 'package:flutter_project/src/entities/location_isar.dart';
import 'package:flutter_project/src/entities/user.dart';
import 'package:isar/isar.dart';

part 'user_isar.g.dart';

@Collection()
class UserIsar extends Equatable {
  final int id = Isar.autoIncrement;
  @Index(unique: true)
  final String idString;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;
  final DateTime? dateOfBirth;
  final DateTime? registerDate;
  final String? gender;
  final String? email;
  final String? phone;
  final location = IsarLink<LocationIsar>();

  UserIsar({
    required this.idString,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.dateOfBirth,
    required this.registerDate,
    this.gender,
    this.email,
    this.phone,
  });

  @override
  List<Object?> get props => [
        idString,
        title,
        firstName,
        lastName,
        picture,
        dateOfBirth,
        registerDate,
        gender,
        email,
        phone,
      ];

  factory UserIsar.fromUser(User user) {
    UserIsar userIsar = UserIsar(
      idString: user.id,
      title: user.title,
      firstName: user.firstName,
      lastName: user.lastName,
      picture: user.picture,
      dateOfBirth: user.dateOfBirth,
      registerDate: user.registerDate,
      gender: user.gender,
      email: user.email,
      phone: user.phone,
    );

    final location = user.location;
    if (location != null) {
      final locationIsar = LocationIsar.fromLocation(location);
      userIsar = userIsar..location.value = locationIsar;
    }

    return userIsar;
  }

  User toUser() {
    User user = User(
      id: idString,
      title: title,
      firstName: firstName,
      lastName: lastName,
      picture: picture,
      dateOfBirth: dateOfBirth,
      registerDate: registerDate,
      gender: gender,
      email: email,
      phone: phone,
    );

    final locationIsar = location.value;
    if (locationIsar != null) {
      final location = locationIsar.toLocation();
      user = user.copyWith(location: location);
    }

    return user;
  }
}
