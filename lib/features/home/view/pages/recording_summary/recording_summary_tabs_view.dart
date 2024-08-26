import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/widgets/loader.dart';
import 'package:fyp2_clean_architecture/core/widgets/summary_container.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/view/pages/recording_summary/tabpages/transcription/transcription_view.dart';
import 'tabpages/chat_view.dart';

class RecordTabView extends ConsumerWidget {
  const RecordTabView({super.key, required this.recording});
  final RecordingListItemModel recording;

  static const routeName = '/RecordTabView';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
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
          title: Text(
            style: const TextStyle(
                // fontSize: 17,
                // fontWeight: FontWeight.bold,
                ),
            recording.name,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(140),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
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
                          Tab(text: 'Transcription'),
                          Tab(text: 'Summary'),
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
        ),
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(246, 249, 252, 1)),
          padding: const EdgeInsets.only(top: 16),
          child: TabBarView(
            children: [
              TranscriptionView(recording: recording),
              SummaryContainer(
                summarytext: recording.transcriptionData.text,
              ),
              const ChatView(),
            ],
          ),
        ),
      ),
    );
  }
}
