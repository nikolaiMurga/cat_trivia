import 'package:cat_trivia/domain/models/fact_model.dart';
import 'package:cat_trivia/domain/models/image_model.dart';

abstract class RandomFactRepo{
  Future<FactModel> fetchRandomFact();
  Future<ImageModel> fetchCatImage();
  Future<List<FactModel>> getFacts();
}