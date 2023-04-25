part of 'history_cubit.dart';

abstract class HistoryState extends Equatable{}

class HistoryInitial extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryLoading extends HistoryState {
  @override
  List<Object?> get props => [];

}

class HistorySucceed extends HistoryState {
  final List<CatsFactModel> list;

  HistorySucceed({required this.list});

  @override
  List<Object?> get props => [list];
}

class HistoryFailed extends HistoryState {
  final String error;

  HistoryFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
