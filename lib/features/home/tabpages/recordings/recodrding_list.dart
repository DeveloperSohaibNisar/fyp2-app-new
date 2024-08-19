import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/features/recording_summary/recording_summary_tabs_view.dart';
import 'package:fyp2_clean_architecture/state/app_state.dart';
import 'package:intl/intl.dart';

class RecordingList extends ConsumerWidget {
  const RecordingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateNotifier);
    var recodingdata = appState.recodingdata;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        itemCount: recodingdata.length,
        itemBuilder: (context, index) {
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
            title: Text(recodingdata[index].title),
            titleTextStyle: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
            subtitleTextStyle: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.51)),
            subtitle: Text(
                DateFormat('dd-MMM-yyyy').format(recodingdata[index].date)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text([
                  recodingdata[index].length.inHours,
                  recodingdata[index].length.inMinutes,
                  recodingdata[index].length.inSeconds
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
        },
        separatorBuilder: ((context, index) => const Divider()),
      ),
    );
  }
}
