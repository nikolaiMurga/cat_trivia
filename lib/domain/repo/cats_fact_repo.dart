import 'package:cat_trivia/domain/models/fact_model.dart';
import 'package:cat_trivia/domain/models/image_model.dart';

abstract class CatsFactRepo{
  Future<CatsFactModel> fetchCatsFact();
  Future<ImageModel> fetchCatsImage();
  Future<List<CatsFactModel>> getSavedFacts();
}