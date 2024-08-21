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
          title: Text(recording.name),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    //width: 361,
                    height: 52,
                    padding: const EdgeInsets.all(3),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFDEE5EE)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.00, 0.00),
                          end: Alignment(-1, 0),
                          colors: [
                            Color(0xFFFC8A19),
                            Color(0xFFFD7713),
                            Color(0xFFFE600C)
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Text('Summary'),
                        Text('Transcription'),
                        Text('Chat'),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/25x25"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  //width: 393,
                  height: 16,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(color: Color(0xFFF6F9FC)),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Summary(
                summarytext: recording.transcriptionData.text ?? 'no text',
              ),
            ),
            TranscriptionView(recording: recording),
            ChatView(),
          ],
        ),
      ),
    );
  }
}
