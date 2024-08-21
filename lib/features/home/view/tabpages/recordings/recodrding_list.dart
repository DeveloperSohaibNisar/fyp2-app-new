import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/widgets/loader.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/home_viewmodel.dart';
import 'package:fyp2_clean_architecture/features/recording_summary/recording_summary_tabs_view.dart';
import 'package:intl/intl.dart';

class RecordingList extends ConsumerWidget {
  const RecordingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final page = index ~/ recordingsPerPage + 1;
            final indexInPage = index % recordingsPerPage;

            final AsyncValue<List<RecordingListItemModel>> recordingsFuture =
                ref.watch(getPaginatedRecordingsProvider(page - 1));
            return recordingsFuture.when(
              data: (recordings) {
                if (indexInPage >= recordings.length) {
                  return null;
                }

                final recording = recordings[indexInPage];
                return Column(
                  children: [
                    index > 0 ? const Divider() : const SizedBox(),
                    RecordingListTile(
                      recording: recording,
                    ),
                  ],
                );
              },
              error: (error, st) {
                return indexInPage == 0
                    ? Center(
                        child: Text(
                          error.toString(),
                        ),
                      )
                    : const SizedBox.shrink();
              },
              loading: () {
                return indexInPage == 0
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Loader(),
                      )
                    : const SizedBox.shrink();
              },
            );
          },
        ));
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
        Navigator.restorablePushNamed(context, RecordTabView.routeName);
      },
    );
  }
}
