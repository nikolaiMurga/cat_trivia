import 'package:bloc/bloc.dart';
import 'package:cat_trivia/domain/models/fact_model.dart';
import 'package:cat_trivia/domain/repo/random_fact_repo.dart';
import 'package:injectable/injectable.dart';

part 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final RandomFactRepo _randomFactRepo;

  HistoryCubit(this._randomFactRepo) : super(HistoryInitial());

  Future<void> setupHistoryPage() async{
    emit(HistoryLoading());
    try{
      final list = await _randomFactRepo.getFacts();
      print('');
      emit(HistorySucceed(list: list));
    }catch(error){
      emit(HistoryFailed(error: error.toString()));
    }
  }
}
