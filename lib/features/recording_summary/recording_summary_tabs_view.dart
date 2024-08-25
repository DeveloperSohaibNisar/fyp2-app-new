import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/widgets/summary.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'chat_view.dart';
import 'transcription/transcription_view.dart';

class RecordTabView extends StatelessWidget {
  final RecordingListItemModel recording;
  const RecordTabView({super.key, required this.recording});

  static const routeName = '/RecordTabView';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          title: Text(recording.name),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(140),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(222, 229, 238, 1)),
                        borderRadius: BorderRadius.circular(30)),
                    child: TabBar(
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(252, 138, 25, 1),
                            Color.fromRGBO(253, 119, 19, 1),
                            Color.fromRGBO(254, 96, 12, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelStyle: const TextStyle(fontSize: 13),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      splashBorderRadius: BorderRadius.circular(30),
                      padding: const EdgeInsets.all(8),
                      tabs: const [
                        Tab(text: 'Summary'),
                        Tab(text: 'Transcription'),
                        Tab(text: 'Chat'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.copy),
                      SizedBox(width: 16),
                      Icon(Icons.edit),
                      SizedBox(width: 16),
                      Icon(Icons.download),
                      SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(246, 249, 252, 1)),
          padding: const EdgeInsets.only(top: 16),
          child: TabBarView(
            children: [
              Summary(
                summarytext: recording.transcriptionData.text ?? 'no text',
              ),
              TranscriptionView(recording: recording),
              const ChatView(),
            ],
          ),
        ),
      ),
    );
  }
}
