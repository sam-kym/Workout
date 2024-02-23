
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:sqlite3/sqlite3.dart';

part 'data_helper.g.dart';

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async{
final dbFolder = await getApplicationDocumentsDirectory();
final file = File(p.join(dbFolder.path, "db.sqlite"));

final cachebase = (await getTemporaryDirectory()).path;
 sqlite3.tempDirectory = cachebase;
return NativeDatabase.createInBackground(file);
  });
}

class Users extends Table {
  TextColumn get name => text().withLength()();
  TextColumn get email => text().withLength()();
  TextColumn get password => text().withLength(min: 8, max: 16)();
}
