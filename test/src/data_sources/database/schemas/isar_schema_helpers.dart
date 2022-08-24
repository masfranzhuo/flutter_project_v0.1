import 'package:flutter_project/src/data_sources/database/schemas/location_isar.dart';
import 'package:flutter_project/src/data_sources/database/schemas/user_isar.dart';

import '../../../entities/entity_helpers.dart';

LocationIsar locationIsar = LocationIsar.fromJson(user.location!.toJson());
UserIsar userIsar = UserIsar.fromJson(user.toJson());
