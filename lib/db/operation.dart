import 'package:entrega2/models/patente.dart';
import 'package:entrega2/pages/list_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'patentes.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE patentes (id INTEGER PRIMARY KEY,patente TEXT,marca TEXT, precio TEXT)");
    }, version: 1);
  }

  static Future<void> insert(Patente patente) async {
    Database database = await _openDB();
    return database.insert("patente", patente.toMap());
  }

  static Future<List<Patente>> patentes() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> patentesMap =
        await database.query("patente");
    for (var n in patentesMap) {
      print("____" + n['patente']);
    }
    return List.generate(
        patentesMap.length,
        (i) => Patente(
            id: patentesMap[i]['id'],
            patente: patentesMap[i]['patente'],
            marca: patentesMap[i]['marca'],
            precio: patentesMap[i]['precio']));
  }
}
