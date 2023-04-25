import 'package:cat_trivia/domain/models/cats_fact_model.dart';
import 'package:cat_trivia/domain/repo/cats_fact_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final CatsFactRepo _catsFactRepo;

  HistoryCubit(this._catsFactRepo) : super(HistoryInitial());

  Future<void> setupHistoryPage() async{
    emit(HistoryLoading());
    try{
      final list = await _catsFactRepo.getSavedFacts();
      emit(HistorySucceed(list: list));
    }catch(error){
      emit(HistoryFailed(error: error.toString()));
    }
  }
}
