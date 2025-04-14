import 'package:ppb_tugas1/models/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String fileName = "recipes_database.db";

class AppDatabase {
  AppDatabase._init();

  static final AppDatabase instance = AppDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB(fileName);
    return _database!;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $idField $idType,
        $nameField $textType,
        $textField $textType,
        $iconPathField $textTypeNullable,
        $boxColorField $textType,
        $viewIsSelectedField $boolType
      )
    ''');
  }

  Future<Database> _initializeDB(String fileName) async {
    final dbPath= await getDatabasesPath();
    final path = join(dbPath, fileName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<Recipe> createRecipe(Recipe recipe) async {
    final db = await instance.database;
    final id = await db.insert(tableName, recipe.toJson());
    return recipe.copyWith(id: id);
  }

  Future<List<Recipe>> readAllRecipes() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => Recipe.fromJson(json)).toList();
  }
  
  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
