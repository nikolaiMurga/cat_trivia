part of 'history_cubit.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}
class HistoryLoading extends HistoryState {}
class HistorySucceed extends HistoryState {
  final List<CatsFactModel> list;

  HistorySucceed({required this.list});
}
class HistoryFailed extends HistoryState {
  final String error;

  HistoryFailed({required this.error});
}
