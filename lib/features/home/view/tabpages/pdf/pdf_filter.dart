import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/pdf/pdfs_viewmodel.dart';

class PdfFilterContainer extends ConsumerStatefulWidget {
  const PdfFilterContainer({super.key});

  @override
  ConsumerState<PdfFilterContainer> createState() => _PdfFilterContainerState();
}

class _PdfFilterContainerState extends ConsumerState<PdfFilterContainer> {
  late TextEditingController _searchTextController;
  @override
  void initState() {
    _searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.text = "";
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(color: Color.fromRGBO(246, 249, 252, 1)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(style: TextStyle(fontSize: 18), 'PDF\'s'),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Color(0xFFFE600C),
                      selectionColor: Color(0xFFFE600C),
                      selectionHandleColor: Color(0xFFFE600C),
                    ),
                  ),
                  child: TextField(
                    controller: _searchTextController,
                    onChanged: (value) {
                      ref.read(pdfsViewmodelProvider.notifier).filterNotes(text: value.toLowerCase());
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      fillColor: Color.fromRGBO(118, 118, 128, 0.12),
                      prefixIcon: Icon(Icons.search, shadows: <Shadow>[Shadow(color: Color.fromRGBO(0, 0, 0, .20), blurRadius: 4, offset: Offset(0, 4))]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search For List',
                    ),
                  ),
                ),
              ),
              const SortMenu(),
              const SortToogle(),
            ],
          ),
        ]),
      ),
    );
  }
}

class SortToogle extends ConsumerWidget {
  const SortToogle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          ref.read(pdfsViewmodelProvider.notifier).tooglePdfsOrder();
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
    return PopupMenuButton<PdfSortMenuItems>(
      icon: const Icon(Icons.sort),
      initialValue: selectedItem,
      onSelected: (PdfSortMenuItems item) {
        setState(() {
          selectedItem = item;
        });
        ref.read(pdfsViewmodelProvider.notifier).sortPdfs(selectedItem);
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
