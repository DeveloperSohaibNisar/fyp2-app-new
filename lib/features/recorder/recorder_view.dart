import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:record/record.dart';

class RecorderView extends StatefulWidget {
  const RecorderView({super.key});
  static const routeName = '/record_audio';

  @override
  State<RecorderView> createState() => _RecorderViewState();
}

class _RecorderViewState extends State<RecorderView> {
  final double minVolume = -30.0;
  final GlobalKey<AnimatedListState> _recorderwavekey =
      GlobalKey<AnimatedListState>();
  late final AudioRecorder _audioRecorder;
  StreamSubscription<RecordState>? _recordSub;
  StreamSubscription<Amplitude>? _amplitudeSub;
  List<Amplitude> samples = [];
  Duration _recordDuration = Duration.zero;
  Timer? _timer;
  bool isRecording = false;

  Future toogleRecord() async {
    if (await _audioRecorder.isPaused()) {
      await resume();
    } else if (await _audioRecorder.isRecording()) {
      await pause();
    } else {
      await record();
    }
  }

  void startTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => setState(() {
              _recordDuration =
                  Duration(seconds: _recordDuration.inSeconds + 1);
            }));
  }

  Future<void> record() async {
    log('--------------record------------------');
    try {
      if (await _audioRecorder.hasPermission()) {
        const encoder = AudioEncoder.pcm16bits;

        if (!await _audioRecorder.isEncoderSupported(encoder)) {
          return;
        }

        var dir = Directory('/storage/emulated/0/Download/').path;
        var name = 'audio_${DateTime.now().millisecondsSinceEpoch}.wav';
        var path = dir + name;

        const config = RecordConfig(encoder: encoder, numChannels: 1);
        await _audioRecorder.start(config, path: path);

        startTimer();

        _amplitudeSub = _audioRecorder
            .onAmplitudeChanged(const Duration(milliseconds: 300))
            .listen((amp) {
          if (kDebugMode) {
            print(amp.current);
          }
          samples.insert(0, amp);
          _recorderwavekey.currentState?.insertItem(samples.length - 1);
        });

        isRecording = true;
      }else{
        throw('no permission');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> stop() async {
    log('--------------stop------------------');
    final path = await _audioRecorder.stop();
    if (kDebugMode) {
      print(path);
    }
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    isRecording = false;
  }

  Future<void> pause() async {
    log('--------------pause------------------');
    await _audioRecorder.pause();
    _timer?.cancel();
    isRecording = false;
  }

  void cancel(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> resume() async {
    log('--------------resume------------------');
    await _audioRecorder.resume();
    startTimer();
    isRecording = true;
  }

  @override
  void initState() {
    _audioRecorder = AudioRecorder();
    super.initState();
  }

  @override
  dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  // void _clearAllItems() {
  //   for (var i = 0; i <= samples.length - 1; i++) {
  //     _recorderwavekey.currentState?.removeItem(0, (context, animation) {
  //       return Container();
  //     });
  //   }
  //   samples.clear();
  // }

  double updateVolume(ampl) {
    return (ampl.current - minVolume) / minVolume;
  }

  double volume0to(double maxVolumeToDisplay, ampl) {
    return (updateVolume(ampl) * maxVolumeToDisplay).toDouble().abs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        elevation: 2,
        leadingWidth: 95,
        leading: TextButton(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          )),
          onPressed: () => Navigator.of(context).pop(),
          child: const Row(
            children: [
              Icon(Icons.arrow_back, color: Color.fromRGBO(0, 122, 255, 1)),
              SizedBox(width: 8),
              Text(
                style: TextStyle(
                  color: Color.fromRGBO(0, 122, 255, 1),
                  fontSize: 17,
                ),
                'Back',
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: const Text(
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          'Record Audio',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Color.fromRGBO(252, 138, 25, 1),
                        Color.fromRGBO(253, 119, 19, 1),
                        Color.fromRGBO(254, 96, 12, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 0.5, 1.0],
                      tileMode: TileMode.clamp,
                    ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                  },
                  child: AnimatedList(
                      key: _recorderwavekey,
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemBuilder: (context, index, animation) {
                        return Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 3,
                            height: samples[index].current.isFinite &&
                                    !samples[index].current.isNaN
                                ? volume0to(110, samples[index])
                                : 14,
                            color: Colors.white,
                          ),
                        );
                      }),
                ),
              ),

              // Text(_amplitude != null ? _amplitude!.current.toString() : 'null'),
              const SizedBox(height: 32),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromRGBO(252, 138, 25, 1),
                      Color.fromRGBO(253, 119, 19, 1),
                      Color.fromRGBO(254, 96, 12, 1),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds);
                },
                child: Text(
                  [
                    _recordDuration.inHours,
                    _recordDuration.inMinutes,
                    _recordDuration.inSeconds
                  ]
                      .map(
                          (seg) => seg.remainder(60).toString().padLeft(2, '0'))
                      .join(':'),
                  style: const TextStyle(
                    fontSize: 42,
                    color: Colors.white,
                  ),
                ),
              ),
              isRecording
                  ? const Text(
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(142, 141, 157, 1),
                      ),
                      'Recording...',
                    )
                  : const SizedBox(),
              const SizedBox(height: 94),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton.filledTonal(
                      onPressed: () async {
                        cancel(context);
                        setState(() {});
                      },
                      iconSize: 32,
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(252, 138, 25, .4),
                      )),
                      padding: const EdgeInsets.all(12),
                      color: Colors.white,
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromRGBO(254, 96, 12, 1),
                        shadows: <Shadow>[
                          Shadow(
                              color: Color.fromRGBO(0, 0, 0, .10),
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Material(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(252, 138, 25, 1),
                            Color.fromRGBO(253, 119, 19, 1),
                            Color.fromRGBO(254, 96, 12, 1),
                          ],
                        ),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          await toogleRecord();
                          setState(() {});
                        },
                        iconSize: 48,
                        padding: const EdgeInsets.all(16),
                        color: Colors.white,
                        icon: Icon(
                          isRecording ? Icons.pause : Icons.play_arrow,
                          shadows: const <Shadow>[
                            Shadow(
                                color: Color.fromRGBO(0, 0, 0, .25),
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Material(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton.filledTonal(
                      onPressed: () async {
                        await stop();
                        setState(() {});
                      },
                      iconSize: 32,
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(252, 138, 25, .4),
                      )),
                      padding: const EdgeInsets.all(12),
                      color: Colors.white,
                      icon: const Icon(
                        Icons.done,
                        color: Color.fromRGBO(254, 96, 12, 1),
                        shadows: <Shadow>[
                          Shadow(
                              color: Color.fromRGBO(0, 0, 0, .10),
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
