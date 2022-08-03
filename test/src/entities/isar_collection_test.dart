import 'package:flutter_project/src/entities/location_isar.dart';
import 'package:flutter_project/src/entities/user_isar.dart';
import 'package:flutter_test/flutter_test.dart';

import 'entity_helpers.dart';

void main() {
  late LocationIsar locationIsar;
  late UserIsar userIsar;

  setUp(() {
    locationIsar = LocationIsar(
      street: user.location!.street,
      city: user.location!.city,
      state: user.location!.state,
      country: user.location!.country,
      timezone: user.location!.timezone,
    );

    userIsar = UserIsar(
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
    )..location.value = locationIsar;
  });

  group('LocationIsar', () {
    test('fromLocation', () {
      var result = LocationIsar.fromLocation(user.location!);
      expect(result, locationIsar);
    });

    test('toLocation', () {
      final result = locationIsar.toLocation();
      expect(result, user.location);
    });
  });

  group('UserIsar', () {
    test('fromUser', () {
      var result = UserIsar.fromUser(user);
      expect(result, userIsar);
      expect(result.location.value, userIsar.location.value);
    });

    test('toUser', () {
      final result = userIsar.toUser();
      expect(result, user);
    });
  });
}
