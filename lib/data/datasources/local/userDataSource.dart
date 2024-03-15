import 'package:invoice/data/datasources/db_helper.dart';
import 'package:invoice/domain/models/user.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDataSource{
  Future<void> insertUserData( String password,String email) async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper.database!;

    // Insert a row into the table.
    await db.insert(
      'User',
      {'password': password, 'email':email},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<User?> authUserDetails(String Email, String password) async {
    Database? dbClient = DatabaseHelper.database;
    if (dbClient != null) {
      List<Map<String, dynamic>> result = await dbClient.rawQuery(
          '''select * from $UserTableName WHERE $userEmail="$userEmail" AND $userPassword="$password";''');
      print(result.first);
      if (result.isNotEmpty) {
        return User.fromJson(result.first);
      } else {
        return null;
      }
    }
    return null;
  }

}


