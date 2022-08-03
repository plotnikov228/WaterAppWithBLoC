import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../Additionally/Colors.dart';

class WavesBackground extends StatelessWidget {
  final Duration duration;
  static const _updateDuration = Duration(milliseconds: 600);

  WavesBackground({
    Key? key,
    this.duration = const Duration(seconds: 10),
  }) : super(key: key);
  final Color _firstGradient = ColorsForApp.objectColor;
  final Color _secondGradient = ColorsForApp.secondObjectColor;

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [[_secondGradient, _firstGradient]],
        durations: [10000],
        heightPercentages: [0.0],
        blur: const MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),
      waveAmplitude: 0,
      size: const Size(
        double.infinity,
        double.infinity,
      ),
    );
  }
}

class ProgressWave extends StatelessWidget {
  final double progress;
  final Duration duration;
  static const _updateDuration = Duration(milliseconds: 600);

  const ProgressWave({
    Key? key,
    required this.progress,
    this.duration = const Duration(seconds: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      height: MediaQuery.of(context).size.height * progress,
      duration: _updateDuration,
      child: WavesBackground(
        duration: duration,
      ),
    );
  }
}
