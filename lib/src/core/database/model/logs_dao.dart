import 'package:moor/moor.dart';
import 'package:moorwebworkers/src/core/database/database_manager.dart';

part 'logs_dao.g.dart';

@UseDao(tables: [Logs])
class LogsDao extends DatabaseAccessor<DatabaseManager> with _$LogsDaoMixin {
  LogsDao(DatabaseManager db) : super(db);

  Future<void> insert(Log log) async {
    return into(logs).insert(log);
  }

  Future<void> insertAll(List<Log> clientAddressList) async {
    return batch((Batch batch) => batch.insertAll(logs, clientAddressList));
  }

  Future<void> replaceAll(List<Log> clientAddressList) async {
    return batch((Batch batch) => batch.replaceAll(logs, clientAddressList));
  }

  Future<List<Log>> getAll({int limit}) {
    if(limit == null) {
      return (select(logs)).get();
    }
    return (select(logs)..limit(limit)).get();
  }

  Stream<List<Log>> watchAll({int limit}) {
    if(limit == null) {
      return (select(logs)).watch();
    }
    return (select(logs)..limit(limit)).watch();
  }
}