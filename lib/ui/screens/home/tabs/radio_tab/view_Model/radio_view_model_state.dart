part of 'radio_view_model_cubit.dart';

abstract class RadioViewModelState {}

final class RadioViewModelInitial extends RadioViewModelState {}

final class RadioSuccessState extends RadioViewModelState {
  List<Radios> radiolist;
  RadioSuccessState(this.radiolist);
}

final class RadioLoadingState extends RadioViewModelState {}

final class RadioErrorState extends RadioViewModelState {
  String error;
  RadioErrorState(this.error);
}
