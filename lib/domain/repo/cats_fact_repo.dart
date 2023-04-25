import 'package:cat_trivia/domain/models/cats_fact_model.dart';
import 'package:cat_trivia/domain/models/cats_image_model.dart';

abstract class CatsFactRepo{
  Future<CatsFactModel> fetchCatsFact();
  Future<CatsImageModel> fetchCatsImage();
  Future<List<CatsFactModel>> getSavedFacts();
}
