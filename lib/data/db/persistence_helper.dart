import 'package:cat_trivia/data/db/entities/cats_fact_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBoxes {
  static const catsFactBox = 'cats_fact_box';
}

class HiveTypeIds {
  static const catsFact = 0;
}

class PersistenceHelper {
  static Future<void> initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    //register adapters
    Hive.registerAdapter(CatsFactEntityAdapter());

    //open boxes
    await Future.wait([
      Hive.openBox(HiveBoxes.catsFactBox),
    ]);

    // await PersistenceHelper.clearBoxes();
  }

  static Future<void> clearBoxes() async {
    //clear boxes per app launch
    await Future.wait([
      Hive.box(HiveBoxes.catsFactBox).clear(),
    ]);
  }
}
