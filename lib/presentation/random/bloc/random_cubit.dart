import 'package:cat_trivia/domain/repo/random_fact_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'random_state.dart';

@injectable
class RandomCubit extends Cubit<RandomState> {
  final RandomFactRepo _randomFactRepo;

  RandomCubit(this._randomFactRepo) : super(RandomInitial());

  Future<void> setup() async {
    emit(RandomLoading());
    try {
      final factModel = await _randomFactRepo.fetchRandomFact();
      final imageModel = await _randomFactRepo.fetchCatImage();
      emit(RandomSucceed(text: factModel.text, createdAt: factModel.createdAt, imageUrl: imageModel.url));
    } catch (error) {
      emit(RandomFailed(error: error.toString()));
    }
  }
}
