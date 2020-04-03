import 'package:moor/moor_web.dart';
import 'package:moorwebworkers/src/core/database/database_manager.dart';
import 'package:moorwebworkers/src/core/database/model/logs_dao.dart';
import 'package:moorwebworkers/src/core/application_default_values.dart' as app_default_values;

class LogInsertTest {

  DatabaseManager databaseManager;
  LogsDao logsDao;

  LogInsertTest() {
    databaseManager = DatabaseManager(
        WebDatabase.withStorage(
            MoorWebStorage.indexedDbIfSupported(app_default_values.localDatabaseName, inWebWorker: true),
            logStatements: true
        )
    );

    logsDao = LogsDao(databaseManager);
  }

  // Insert without batch
  Future<void> insertWithoutBatch() async {
    for(int i = 0; i < 5000; i++) {
      final Log log = Log(
        timeStamp: DateTime.now(),
        message: 'test ' + i.toString(),
        log_output: 'test ' + i.toString(),
        user_id: 1
      );
      await logsDao.insert(log);
    }
  }

  // Insert with batch
  Future<void> insertWithBatch() async {
    final List<Log> logListToInsert = <Log>[];
    for(int i = 0; i < 100000; i++) {
      final Log log = Log(
          timeStamp: DateTime.now(),
          message: 'test ' + i.toString(),
          log_output: 'test ' + i.toString(),
          user_id: 1
      );
      logListToInsert.add(log);
    }
    await logsDao.insertAll(logListToInsert);
  }

  Future<void> printDatabaseValues() async {
    final List<Log> logList = await logsDao.getAll();
    logList.forEach((log) {
      print(log.message);
    });
  }
}