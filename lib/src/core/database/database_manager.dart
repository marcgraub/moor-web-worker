import 'package:moor/moor.dart';
import 'package:moorwebworkers/src/core/database/model/logs_dao.dart';
part 'database_manager.g.dart';

@DataClassName('Log')
class Logs extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  IntColumn get user_id => integer().customConstraint('NOT NULL')();
  TextColumn get message => text().customConstraint('NOT NULL')();
  TextColumn get log_output => text().customConstraint('NOT NULL')();
  DateTimeColumn get timeStamp => dateTime().customConstraint('NOT NULL')();
}

@UseMoor(
    tables: [
      Logs
],
    daos: [
      LogsDao,
])
class DatabaseManager extends _$DatabaseManager {
  DatabaseManager(QueryExecutor e): super(e);

  @override
  final int schemaVersion = 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
        onCreate: (Migrator migrator) async {
          await migrator.createAll();
        },
        beforeOpen: (OpeningDetails openingDetails) async {
        },
        onUpgrade: (Migrator m, int from, int to) async {
        }
    );
  }
}