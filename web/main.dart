import 'dart:html';
import 'package:dorker/dorker.dart';
import 'package:moorwebworkers/src/core/concater.dart';
import 'log_insert_test.dart';

Future<void> main() async {
    Dorker _concatWorker;
    if (const String.fromEnvironment('USE_WORKER') == 'true') {
      print(WorkerGlobalScope.instance.indexedDB);
      print('Asked to use worker');
      _concatWorker = DorkerWorker<dynamic>(Worker('worker/worker.dart.js'));
    } else {
      print('Not using worker. Share worker across multiple Tab will not work as intended');
      _concatWorker = Dorker<dynamic>();
      Concater(Dorker<dynamic>.CrossLink(_concatWorker));
    }

    _concatWorker.onMessage.listen((dynamic data) {
//      print(data);
    });

//    final LogInsertTest insertTest = LogInsertTest();
//    await insertTest.insertWithBatch();
//    await insertTest.printDatabaseValues();
//
//    await insertTest.insertWithoutBatch();
//    await insertTest.printDatabaseValues();

}