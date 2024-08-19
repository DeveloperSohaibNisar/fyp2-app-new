import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/state/app_state.dart';
import 'package:provider/provider.dart';

class NoteFilterContainer extends StatelessWidget {
  const NoteFilterContainer({super.key});

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
              Text(style: TextStyle(fontSize: 18), 'Notes'),
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
          appState.toogleNotesOrder();
        },
        icon: const Icon(Icons.swap_vert));
  }
}

class SortMenu extends StatefulWidget {
  const SortMenu({super.key});

  @override
  State<SortMenu> createState() => _SortMenuState();
}

class _SortMenuState extends State<SortMenu> {
  NotesSortMenuItems? selectedItem;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return PopupMenuButton<NotesSortMenuItems>(
      icon: const Icon(Icons.sort),
      initialValue: selectedItem,
      onSelected: (NotesSortMenuItems item) {
        setState(() {
          selectedItem = item;
        });
        appState.sortNotes(selectedItem);
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<NotesSortMenuItems>>[
        const PopupMenuItem<NotesSortMenuItems>(
          value: NotesSortMenuItems.title,
          child: Text('Title'),
        ),
        const PopupMenuItem<NotesSortMenuItems>(
          value: NotesSortMenuItems.creationDate,
          child: Text('Creation Date'),
        ),
        const PopupMenuItem<NotesSortMenuItems>(
          value: NotesSortMenuItems.editDate,
          child: Text('Last Edited'),
        ),
        const PopupMenuItem<NotesSortMenuItems>(
          value: NotesSortMenuItems.lines,
          child: Text('Lines'),
        ),
      ],
    );
  }
}
