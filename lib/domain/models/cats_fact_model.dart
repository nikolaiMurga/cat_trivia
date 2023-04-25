import 'package:equatable/equatable.dart';

class CatsFactModel extends Equatable{
  final String text;
  final String createdAt;

  const CatsFactModel({required this.text, required this.createdAt});

  @override
  List<Object?> get props => [text, createdAt];
}
