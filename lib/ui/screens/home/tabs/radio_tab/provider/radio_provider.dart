import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/radio_tab/model/Radios.dart';

class RadioProvider extends ChangeNotifier {
  bool playAudio = false;
  int radioIndex = 0;
  String? urlsound;
  nextRadio() {
    radioIndex++;
    notifyListeners();
  }

  previousRadio() {
    if (radioIndex > 0) {
      radioIndex--;
      notifyListeners();
    }
    return;
  }

  setUrlSound(List<Radios> listRadio) async {
    if (listRadio[radioIndex].url == urlsound) return;
    urlsound = listRadio[radioIndex].url;
    notifyListeners();
  }

  changePlayAudio(bool newValue) {
    if (newValue == playAudio) return;
    playAudio = newValue;
    notifyListeners();
  }
}
