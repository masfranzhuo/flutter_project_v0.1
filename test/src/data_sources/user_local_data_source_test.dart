// TODO: test local data source and image network error test
void main() {}
// import 'package:dartz/dartz.dart';
// import 'package:flutter_project/core/config/general_config.dart';
// import 'package:flutter_project/core/utils/failure.dart';
// import 'package:flutter_project/src/data_sources/user_local_data_source.dart';
// import 'package:flutter_project/src/entities/location_isar.dart';
// import 'package:flutter_project/src/entities/user.dart';
// import 'package:flutter_project/src/entities/user_isar.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:isar/isar.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import '../entities/entity_helpers.dart';
// import 'user_local_data_source_test.mocks.dart';

// @GenerateMocks([
//   UserIsar,
//   User,
// ], customMocks: [
//   MockSpec<Isar>(
//     unsupportedMembers: {#txnSync, #writeTxnSync},
//     returnNullOnMissingStub: true,
//   ),
//   MockSpec<IsarCollection<UserIsar>>(),
//   MockSpec<IsarLink<LocationIsar>>(),
//   MockSpec<QueryBuilder<UserIsar, UserIsar, QWhere>>(
//     as: #MockQueryBuilderWhere,
//     returnNullOnMissingStub: true,
//   ),
//   MockSpec<QueryBuilder<UserIsar, UserIsar, QAfterOffset>>(
//     as: #MockQueryBuilderOffset,
//     returnNullOnMissingStub: true,
//   ),
//   MockSpec<QueryBuilder<UserIsar, UserIsar, QAfterLimit>>(
//     as: #MockQueryBuilderLimit,
//     returnNullOnMissingStub: true,
//   ),
//   MockSpec<QueryBuilder<UserIsar, String, QQueryOperations>>(
//     as: #MockQueryBuilderOperations,
//     returnNullOnMissingStub: true,
//   ),
// ])
// void main() {
//   late UserLocalDataSourceImpl localDataSource;
//   late MockIsar mockIsar;

//   late MockIsarCollection mockIsarCollectionUser;
//   late MockIsarLink mockIsarLinkLocation;

//   late MockQueryBuilderWhere mockQueryBuilderWhere;
//   late MockQueryBuilderOffset mockQueryBuilderOffset;
//   late MockQueryBuilderLimit mockQueryBuilderLimit;
//   late MockQueryBuilderOperations mockQueryBuilderOperations;

//   late MockUserIsar mockUserIsar;
//   late MockUser mockUser;
//   late List<MockUserIsar> mockUserIsars;
//   late List<MockUser> mockUsers;

//   setUp(() {
//     mockIsar = MockIsar();

//     mockIsarCollectionUser = MockIsarCollection();
//     mockIsarLinkLocation = MockIsarLink();

//     mockQueryBuilderWhere = MockQueryBuilderWhere();
//     mockQueryBuilderOffset = MockQueryBuilderOffset();
//     mockQueryBuilderLimit = MockQueryBuilderLimit();
//     mockQueryBuilderOperations = MockQueryBuilderOperations();

//     mockUserIsar = MockUserIsar();
//     mockUser = MockUser();
//     mockUserIsars = [mockUserIsar];
//     mockUsers = [mockUser];

//     localDataSource = UserLocalDataSourceImpl(isar: mockIsar);
//   });

//   group('deleteAllUser', () {
//     test('should throw LocalStorageFailure()', () async {
//       /*
//       */
//     });
//     test('should call deleteAllByIdString', () async {
//       when(mockIsar.getCollection<UserIsar>()).thenReturn(
//         mockIsarCollectionUser,
//       );
//       when(mockIsarCollectionUser.where()).thenReturn(mockQueryBuilderWhere);
//       when(mockQueryBuilderWhere.idStringProperty())
//           .thenReturn(mockQueryBuilderOperations);
//       when(mockQueryBuilderOperations.findAll()).thenAnswer(
//         (_) async => [],
//       );
//       when(mockIsarCollectionUser.deleteAllByIdString([])).thenAnswer(
//         (_) async => 1,
//       );

//       await localDataSource.deleteAllUser();

//       verifyInOrder([
//         mockIsar.getCollection<UserIsar>(),
//         mockIsarCollectionUser.where(),
//         mockQueryBuilderWhere.idStringProperty(),
//         mockQueryBuilderLimit.findAll(),
//         mockIsarCollectionUser.deleteAllByIdString([]),
//       ]);
//     });
//   });

//   group('deleteUser', () {
//     test('should throw LocalStorageFailure()', () async {
//       /*
//       */
//     });
//     test('should call deleteByIdString', () async {
//       when(mockIsar.getCollection<UserIsar>()).thenReturn(
//         mockIsarCollectionUser,
//       );
//       when(mockIsarCollectionUser.deleteByIdString('anyId')).thenAnswer(
//         (_) async => true,
//       );

//       await localDataSource.deleteAllUser();

//       verifyInOrder([
//         mockIsar.getCollection<UserIsar>(),
//         mockIsarCollectionUser.deleteByIdString('anyId'),
//       ]);
//     });
//   });

//   group('getUser', () {
//     test('should throw LocalStorageFailure()', () async {
//       when(mockIsar.getCollection<UserIsar>()).thenReturn(
//         mockIsarCollectionUser,
//       );
//       when(mockIsarCollectionUser.getByIdString('anyId')).thenThrow(
//         Exception(),
//       );

//       expect(
//         () async => await localDataSource.getUser(id: 'anyId'),
//         throwsA(isA<LocalStorageFailure>()),
//       );

//       verifyInOrder([
//         mockIsar.getCollection<UserIsar>(),
//         mockIsarCollectionUser.getByIdString('anyId'),
//       ]);
//     });
//     test('should return user', () async {
//       when(mockIsar.getCollection<UserIsar>()).thenReturn(
//         mockIsarCollectionUser,
//       );
//       when(mockIsarCollectionUser.getByIdString('anyId')).thenAnswer(
//         (_) async => mockUserIsar,
//       );
//       when(mockUserIsar.location).thenReturn(mockIsarLinkLocation);
//       when(mockIsarLinkLocation.load()).thenAnswer((_) async => unit);
//       when(mockUserIsar.toUser()).thenReturn(mockUser);

//       final result = await localDataSource.getUser(id: 'anyId');

//       expect(result, mockUser);

//       verifyInOrder([
//         mockIsar.getCollection<UserIsar>(),
//         mockIsarCollectionUser.getByIdString('anyId'),
//         mockUserIsar.location,
//         mockIsarLinkLocation.load(),
//         mockUserIsar.toUser(),
//       ]);
//     });
//   });

//   group('getUsers', () {
//     test('should throw LocalStorageFailure()', () async {
//       /*
//       */
//     });
//     test('should return list of users', () async {
//       when(mockIsar.getCollection<UserIsar>()).thenReturn(
//         mockIsarCollectionUser,
//       );
//       when(mockIsarCollectionUser.where()).thenReturn(mockQueryBuilderWhere);
//       when(mockQueryBuilderWhere.offset(1)).thenReturn(mockQueryBuilderOffset);
//       when(mockQueryBuilderOffset.limit(Pagination.limit)).thenReturn(
//         mockQueryBuilderLimit,
//       );
//       when(mockQueryBuilderLimit.findAll()).thenAnswer(
//         (_) async => mockUserIsars,
//       );

//       final result = await localDataSource.getUsers(page: 1);

//       expect(result, mockUsers);

//       verifyInOrder([
//         mockIsar.getCollection<UserIsar>(),
//         mockIsarCollectionUser.where(),
//         mockQueryBuilderWhere.offset(1),
//         mockQueryBuilderOffset.limit(Pagination.limit),
//         mockQueryBuilderLimit.findAll(),
//       ]);
//     });
//   });

//   group('setUser', () {
//     test('should throw LocalStorageFailure()', () async {
//       /*
//       */
//     });
//     test('should call put', () async {
//       when(mockIsar.getCollection<UserIsar>()).thenReturn(
//         mockIsarCollectionUser,
//       );
//       when(mockIsarCollectionUser.put(
//         any,
//         replaceOnConflict: anyNamed('replaceOnConflict'),
//         saveLinks: anyNamed('saveLinks'),
//       )).thenAnswer((_) async => 1);

//       await localDataSource.setUser(user: user);

//       verifyInOrder([
//         mockIsar.getCollection<UserIsar>(),
//         mockIsarCollectionUser.put(
//           any,
//           replaceOnConflict: anyNamed('replaceOnConflict'),
//           saveLinks: anyNamed('saveLinks'),
//         ),
//       ]);
//     });
//   });

//   group('setUsers', () {
//     test('should throw LocalStorageFailure()', () async {
//       /*
//       */
//     });
//     test('should call put', () async {
//       when(mockIsar.getCollection<UserIsar>()).thenReturn(
//         mockIsarCollectionUser,
//       );
//       when(mockIsarCollectionUser.put(
//         any,
//         replaceOnConflict: anyNamed('replaceOnConflict'),
//       )).thenAnswer((_) async => 1);

//       await localDataSource.setUsers(users: users);

//       verifyInOrder([
//         mockIsar.getCollection<UserIsar>(),
//         mockIsarCollectionUser.put(
//           any,
//           replaceOnConflict: anyNamed('replaceOnConflict'),
//         ),
//       ]);
//     });
//   });
// }
