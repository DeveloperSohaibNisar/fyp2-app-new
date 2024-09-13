import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/recording_summary/view/widgets/seekbar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';

class TranscriptionView extends StatefulWidget {
  final RecordingListItemModel recording;
  const TranscriptionView({super.key, required this.recording});

  @override
  State<TranscriptionView> createState() => _TranscriptionViewState();
}

class _TranscriptionViewState extends State<TranscriptionView> with WidgetsBindingObserver {
  final AudioPlayer _player = AudioPlayer();
  // Create a player

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {}, onError: (Object e, StackTrace stackTrace) {
      if (kDebugMode) {
        print('A stream error occurred: $e');
      }
    });
    // Try to load audio from a source and catch any errors.
    try {
      // MP3 example: https://www.flatworldsolutions.com/transcription/samples/Monologue.mp3
      await _player.setAudioSource(AudioSource.uri(Uri.parse(widget.recording.audioUrl)));
    } catch (e) {
      if (kDebugMode) {
        print("Error loading audio source: $e");
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _dispose();
    super.dispose();
  }

  Future<void> _dispose() async {
    await _player.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
      _player.positionStream, _player.bufferedPositionStream, _player.durationStream, (position, bufferedPosition, duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                final position = positionData?.position ?? Duration.zero;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.recording.transcriptionData.chunks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        color: position > widget.recording.transcriptionData.chunks[index].timestamp[0] && position < widget.recording.transcriptionData.chunks[index].timestamp[1]
                            ? Colors.grey[100]
                            : Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              style: const TextStyle(
                                color: Color(0xFF007AFF),
                                fontSize: 14,
                              ),
                              [widget.recording.transcriptionData.chunks[index].timestamp[0].inMinutes, widget.recording.transcriptionData.chunks[index].timestamp[0].inSeconds]
                                  .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
                                  .join(':'),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.recording.transcriptionData.chunks[index].text,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 182,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display seek bar. Using StreamBuilder, this widget rebuilds
              // each time the position, buffered position or duration changes.
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return SeekBar(
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
                    onChangeEnd: _player.seek,
                  );
                },
              ),
              // Display play/pause button and volume/speed sliders.
              ControlButtons(_player),
            ],
          ),
        )
      ],
    );
  }
}

/// Displays the play/pause button and volume/speed sliders.
class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
          return Row(mainAxisSize: MainAxisSize.min, children: [
            const IconButton(
              icon: Icon(Icons.replay_5),
              iconSize: 45,
              onPressed: null,
            ),
            const SizedBox(width: 30),
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 64.0,
              height: 64.0,
              child: const CircularProgressIndicator(color: Color.fromRGBO(253, 119, 19, 1)),
            ),
            const SizedBox(width: 30),
            const IconButton(
              icon: Icon(Icons.forward_5),
              iconSize: 45,
              onPressed: null,
            ),
          ]);
        } else if (playing != true) {
          return Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
              icon: const Icon(Icons.replay_5),
              iconSize: 45,
              onPressed: () {
                player.seek(player.position - const Duration(seconds: 5));
              },
            ),
            const SizedBox(width: 30),
            Material(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
                  onPressed: player.play,
                  iconSize: 48,
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  icon: const Icon(
                    Icons.play_arrow,
                    shadows: <Shadow>[Shadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 4, offset: Offset(0, 4))],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            IconButton(
              icon: const Icon(Icons.forward_5),
              iconSize: 45,
              onPressed: () {
                player.seek(player.position + const Duration(seconds: 5));
              },
            ),
          ]);
        } else if (processingState != ProcessingState.completed) {
          return Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
              icon: const Icon(Icons.replay_5),
              iconSize: 45,
              onPressed: () {
                player.seek(player.position - const Duration(seconds: 5));
              },
            ),
            const SizedBox(width: 30),
            Material(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
                  onPressed: player.pause,
                  iconSize: 48,
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  icon: const Icon(
                    Icons.pause,
                    shadows: <Shadow>[Shadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 4, offset: Offset(0, 4))],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            IconButton(
              icon: const Icon(Icons.forward_5),
              iconSize: 45,
              onPressed: () {
                player.seek(player.position + const Duration(seconds: 5));
              },
            ),
          ]);
        } else {
          return Row(mainAxisSize: MainAxisSize.min, children: [
            const IconButton(
              icon: Icon(Icons.replay_5),
              iconSize: 45,
              onPressed: null,
            ),
            const SizedBox(width: 30),
            IconButton(
              icon: const Icon(Icons.replay),
              iconSize: 64.0,
              onPressed: () => player.seek(Duration.zero),
            ),
            const SizedBox(width: 30),
            const IconButton(
              icon: Icon(Icons.forward_5),
              iconSize: 45,
              onPressed: null,
            ),
          ]);
        }
      },
    );
  }
}
