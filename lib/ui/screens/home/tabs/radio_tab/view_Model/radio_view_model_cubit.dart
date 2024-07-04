import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/api/api_manager.dart';
import 'package:islami_app/ui/screens/home/tabs/radio_tab/model/Radios.dart';

part 'radio_view_model_state.dart';

class RadioViewModelCubit extends Cubit<RadioViewModelState> {
  RadioViewModelCubit() : super(RadioViewModelInitial());
  static RadioViewModelCubit get(BuildContext context) =>
      BlocProvider.of(context);

  getRadio() async {
    emit(RadioLoadingState());
    var response = await ApiManager.getRadio();
    response.fold((result) {
      List<Radios> radioList = result.radios ?? [];
      emit(RadioSuccessState(radioList));
    }, (error) {
      print("error: $error");
      emit(RadioErrorState(error));
    });
  }

}
