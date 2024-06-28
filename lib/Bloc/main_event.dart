part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}
class FetchMainEvent extends MainEvent {
  final String id;
  FetchMainEvent ({required this.id});
}