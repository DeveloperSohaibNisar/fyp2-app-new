import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/widgets/loader.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/view/pages/recording_summary/recording_summary_tabs_view.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/recordings/recodings_viewmodel.dart';
import 'package:intl/intl.dart';

class RecordingList extends ConsumerStatefulWidget {
  const RecordingList({super.key});

  @override
  ConsumerState<RecordingList> createState() => _RecordingListState();
}

class _RecordingListState extends ConsumerState<RecordingList> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final recordingsAsyncValue = ref.watch(recodingsViewmodelProvider);
    final recordings = recordingsAsyncValue.value ?? [];
    final isInitialLoading =
        recordingsAsyncValue.isLoading && recordings.isEmpty;
    final hasmore = ref.watch(recodingsViewmodelProvider.notifier).hasMore;
    final isFetchingMore =
        recordingsAsyncValue.isLoading && recordings.isNotEmpty;

    void scrollControllerListener() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        if (!isFetchingMore && hasmore) {
          ref.read(recodingsViewmodelProvider.notifier).fetchmore();
        }
      }
    }

    _scrollController.addListener(scrollControllerListener);

    return isInitialLoading
        ? const Loader()
        : Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: recordings.isEmpty
                ? Center(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Color.fromRGBO(31, 51, 228, 1),
                            Color.fromRGBO(6, 121, 225, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: const Text(
                        textAlign: TextAlign.center,
                        'No Recordings',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: recordings.length +
                        (!hasmore || isFetchingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index <= recordings.length - 1) {
                        final recording = recordings[index];
                        return RecordingListTile(recording: recording);
                      } else if (isFetchingMore) {
                        return const Column(
                          children: [
                            SizedBox(height: 16),
                            Loader(),
                            SizedBox(height: 16),
                          ],
                        );
                      } else if (!hasmore) {
                        return ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [
                                Color.fromRGBO(31, 51, 228, 1),
                                Color.fromRGBO(6, 121, 225, 1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: const Column(
                            children: [
                              SizedBox(height: 16),
                              Text(
                                textAlign: TextAlign.center,
                                'No More Recordings',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
          );
  }
}

class RecordingListTile extends StatelessWidget {
  const RecordingListTile({
    super.key,
    required this.recording,
  });

  final RecordingListItemModel recording;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(.25),
                offset: const Offset(0, 4))
          ],
        ),
        child: const CircleAvatar(
          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
          child: Icon(
            Icons.music_note,
            color: Colors.black,
          ),
        ),
      ),
      title: Text(recording.name),
      titleTextStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
      subtitleTextStyle: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(.51)),
      subtitle: Text(DateFormat('dd-MMM-yyyy').format(recording.uploadDate)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text([
            recording.audioLength.inHours,
            recording.audioLength.inMinutes,
            recording.audioLength.inSeconds
          ]
              .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
              .join(':')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, RecordTabView.routeName,
            arguments: recording);
      },
    );
  }
}
