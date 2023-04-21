import 'package:cat_trivia/data/db/entities/fact_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static const factBox = 'fact_box';
}

class HiveTypeIds {
  static const fact = 0;
}

class PersistenceHelper {
  static Future<void> initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    //register adapters
    Hive.registerAdapter(FactEntityAdapter());

    //open boxes
    await Future.wait([
      Hive.openBox(HiveBoxes.factBox),
    ]);

    await PersistenceHelper.clearBoxes();
  }

  static Future<void> clearBoxes() async {
    //clear boxes per app launch
    await Future.wait([
      Hive.box(HiveBoxes.factBox).clear(),
    ]);
  }
}
