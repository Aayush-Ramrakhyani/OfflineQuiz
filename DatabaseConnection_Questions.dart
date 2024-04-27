  import 'package:path/path.dart';
  import 'package:path_provider/path_provider.dart';
  import 'package:sqflite/sqflite.dart';

  class DatabaseConnection {
    Future<Database> setDatabase() async {
      var dict = await getApplicationDocumentsDirectory();
      
      var path = join(dict.path, "Database");
      

      var database = await openDatabase(path, version: 1, onCreate: createTable);
      return database;
    }

    Future<void> createTable(Database database, int version) async {
      String? sql;
      sql =
          "create table Questions(id INTEGER PRIMARY KEY AUTOINCREMENT, question TEXT , option1 TEXT, option2 TEXT , option3 TEXT , option4 TEXT , answer TEXT)";
      await database.execute(sql);
    }
  }
