part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}
class MainBlocLoading extends MainState{}
class MainBlocLoaded extends MainState{}
class MainBlocError extends MainState{}