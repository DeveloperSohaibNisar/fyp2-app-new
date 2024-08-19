import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/state/app_state.dart';
import 'package:provider/provider.dart';

class PdfFilterContainer extends StatelessWidget {
  const PdfFilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(color: Color.fromRGBO(246, 249, 252, 1)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(style: TextStyle(fontSize: 18), 'PDF\'s'),
              SizedBox(height: 8),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        filled: true,
                        fillColor: Color.fromRGBO(118, 118, 128, 0.12),
                        prefixIcon: Icon(Icons.search, shadows: <Shadow>[
                          Shadow(
                              color: Color.fromRGBO(0, 0, 0, .20),
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search For List',
                      ),
                    ),
                  ),
                  SortMenu(),
                  SortToogle(),
                ],
              ),
            ]),
      ),
    );
  }
}

class SortToogle extends StatelessWidget {
  const SortToogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return IconButton(
        onPressed: () {
          appState.tooglePdfsOrder();
        },
        icon: const Icon(Icons.swap_vert));
  }
}

class SortMenu extends ConsumerStatefulWidget {
  const SortMenu({super.key});

  @override
  ConsumerState<SortMenu> createState() => _SortMenuState();
}

class _SortMenuState extends ConsumerState<SortMenu> {
  PdfSortMenuItems? selectedItem;

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appStateNotifier);
    return PopupMenuButton<PdfSortMenuItems>(
      icon: const Icon(Icons.sort),
      initialValue: selectedItem,
      onSelected: (PdfSortMenuItems item) {
        setState(() {
          selectedItem = item;
        });
        appState.sortPdfs(selectedItem);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PdfSortMenuItems>>[
        const PopupMenuItem<PdfSortMenuItems>(
          value: PdfSortMenuItems.title,
          child: Text('Title'),
        ),
        const PopupMenuItem<PdfSortMenuItems>(
          value: PdfSortMenuItems.date,
          child: Text('Upload Date'),
        ),
        const PopupMenuItem<PdfSortMenuItems>(
          value: PdfSortMenuItems.pages,
          child: Text('Pages'),
        ),
      ],
    );
  }
}
