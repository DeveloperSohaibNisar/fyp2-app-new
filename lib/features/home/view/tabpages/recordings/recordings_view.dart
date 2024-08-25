import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/recordings/recodings_viewmodel.dart';

import 'recodrding_list.dart';
import 'recording_filter.dart';

class RecordingView extends ConsumerWidget {
  const RecordingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(recodingsViewmodelProvider, (prev, next) {
      next.when(
          data: (data) {},
          error: (error, st) {
            showCustomSnackBar(context, error.toString());
          },
          loading: () {});
    });

    return const Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [RecordingFilterContainer(), Flexible(child: RecordingList())],
    );
  }
}
