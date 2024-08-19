import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/features/pdf_summary/pdf_summary_tabs_view.dart';
import 'package:fyp2_clean_architecture/state/app_state.dart';

import 'package:intl/intl.dart';

class PdfList extends ConsumerWidget {
  const PdfList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var appState = ref.watch(appStateNotifier);
    var pdfData = appState.pdfData;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        itemCount: pdfData.length,
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
                  Icons.description_outlined,
                  weight: 100,
                  grade: -25,
                  color: Colors.black,
                ),
              ),
            ),
            title: Text(pdfData[index].title),
            titleTextStyle: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
            subtitleTextStyle: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.51)),
            subtitle:
                Text(DateFormat('dd-MMM-yyyy').format(pdfData[index].date)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${pdfData[index].pages}-Pages'),
                const Icon(Icons.more_vert),
              ],
            ),
            onTap: () {
              Navigator.restorablePushNamed(context, PdfTabsView.routeName);
            },
          );
        },
        separatorBuilder: ((context, index) => const Divider()),
      ),
    );
  }
}
