import 'package:cat_trivia/domain/repo/cats_fact_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'random_state.dart';

@injectable
class RandomCubit extends Cubit<RandomState> {
  final CatsFactRepo _catsFactRepo;

  RandomCubit(this._catsFactRepo) : super(RandomInitial());

  Future<void> setup() async {
    emit(RandomLoading());
    try {
      final factModel = await _catsFactRepo.fetchCatsFact();
      final imageModel = await _catsFactRepo.fetchCatsImage();
      emit(RandomSucceed(text: factModel.text, createdAt: factModel.createdAt, imageUrl: imageModel.url));
    } catch (error) {
      emit(RandomFailed(error: error.toString()));
    }
  }
}
