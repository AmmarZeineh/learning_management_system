part of 'schat_cubit.dart';

@immutable
sealed class SChatState {}

final class SChatInitial extends SChatState {}

final class SChatSuccess extends SChatState {}
