import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'database.g.dart';

class Urls extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get urladdress => text().withLength(min: 1, max: 10000)();
  DateTimeColumn get dueDate => dateTime().nullable()();
}

@UseMoor(tables: [Urls])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
  Future<List<Url>> getAllUrls() => select(urls).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Url>> watchAllUrls() => select(urls).watch();
  Future insertUrl(Url url) => into(urls).insert(url);
  // Updates a Task with a matching primary key
  Future updateUrl(Url url) => update(urls).replace(url);

  Future deleteUrl(Url url) => delete(urls).delete(url);
  Future<void> deleteAllData(Table table) {
    return transaction((_) async {
      await delete(table).go();
    });
  }
}
