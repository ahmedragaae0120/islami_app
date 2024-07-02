import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '_radio_view_model_state.dart';

class RadioViewModelCubit extends Cubit<RadioViewModelState> {
  RadioViewModelCubit() : super(RadioViewModelInitial());
}
