// import 'package:moor_flutter/moor_flutter.dart';

// part 'tasks_database.g.dart';

// class Tasks extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text().withLength(min: 1, max: 50)();
//   BoolColumn get isComplete => boolean().withDefault(Constant(false))();
// }

// @UseMoor(tables: [Tasks])
// class AppDatabase extends _$AppDatabase {
//   AppDatabase()
//       : super(FlutterQueryExecutor.inDatabaseFolder(
//             path: 'db.sqlite', logStatements: true));
// }
