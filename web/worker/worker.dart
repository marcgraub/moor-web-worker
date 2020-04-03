import 'dart:html';
import 'package:dorker/dorker.dart';
import 'package:moorwebworkers/src/core/concater.dart';

import '../log_insert_test.dart';

Future<void> main() async {
  WorkerGlobalScope.instance.importScripts('../sql-wasm.js');
  final DorkerBoss<dynamic> _boss = DorkerBoss<dynamic>();

  _boss.onMessage.listen((dynamic data) {
    print(data);
  });

  Concater(_boss);

  final LogInsertTest insertTest = LogInsertTest();
  await insertTest.insertWithBatch();
//  await insertTest.printDatabaseValues();
//
//  await insertTest.insertWithoutBatch();
//  await insertTest.printDatabaseValues();
}