import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/ui/screens/home/tabs/radio_tab/provider/radio_provider.dart';
import 'package:islami_app/ui/screens/home/tabs/radio_tab/view_Model/radio_view_model_cubit.dart';
import 'package:provider/provider.dart';

class radio_widet extends StatefulWidget {
  const radio_widet({super.key});

  @override
  State<radio_widet> createState() => _radio_widetState();
}

class _radio_widetState extends State<radio_widet> {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    RadioProvider radioProvider = Provider.of<RadioProvider>(context);
    return BlocProvider<RadioViewModelCubit>(
      create: (context) => RadioViewModelCubit()..getRadio(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/image/old_radio.png"),
          Text(
            "إذاعة القرآن الكريم",
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
          BlocBuilder<RadioViewModelCubit, RadioViewModelState>(
            builder: (context, state) {
              if (state is RadioSuccessState) {
                Timer(const Duration(seconds: 0), () {
                  setState(() {
                    radioProvider.setUrlSound(state.radiolist);
                  });
                });

                return Text(
                  "${state.radiolist[radioProvider.radioIndex].name}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16),
                );
              }
              if (state is RadioErrorState) {
                return Text(
                  state.error,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                );
              }
              return const CircularProgressIndicator.adaptive();
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    player.stop();
                    radioProvider.changePlayAudio(false);
                    radioProvider.nextRadio();
                  },
                  icon: Icon(
                    Icons.skip_next_sharp,
                    size: 50,
                    color: Theme.of(context).colorScheme.onTertiary,
                  )),
              radioProvider.playAudio
                  ? InkWell(
                      onTap: () async {
                        await player.pause();
                        radioProvider.changePlayAudio(false);
                      },
                      child: Icon(
                        Icons.pause,
                        color: Theme.of(context).colorScheme.onTertiary,
                        size: 50,
                      ),
                    )
                  : InkWell(
                      onTap: () async {
                        await player
                            .play(UrlSource(radioProvider.urlsound ?? ""));
                        radioProvider.changePlayAudio(true);
                      },
                      child: Icon(
                        Icons.play_arrow_sharp,
                        size: 50,
                        color: Theme.of(context).colorScheme.onTertiary,
                      )),
              IconButton(
                  onPressed: () {
                    player.stop();
                    radioProvider.changePlayAudio(false);
                    radioProvider.previousRadio();
                  },
                  icon: Icon(
                    Icons.skip_previous_sharp,
                    size: 50,
                    color: Theme.of(context).colorScheme.onTertiary,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
