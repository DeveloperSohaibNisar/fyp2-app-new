import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/core/widgets/notes_screen.dart';
import 'package:fyp2_clean_architecture/features/splash/view/splash_view.dart';
// import '../../settings/settings_view.dart';
import 'tabpages/notes/note_view.dart';
import 'tabpages/pdf/pdf_view.dart';
import 'tabpages/recordings/recordings_view.dart';
import 'widgets/note_bottom_button.dart';
import 'widgets/pdf_bottom_button.dart';
import 'widgets/recording_bottom_buttons.dart';
import 'widgets/wave_clipper.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  static const routeName = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  Widget _bottomSheetButton = const RecordingBottomButtons();

  _handleTabSelection(currentIndex) {
    setState(() {
      switch (currentIndex) {
        case 0:
          setState(() {
            _bottomSheetButton = const RecordingBottomButtons();
          });
        case 1:
          setState(() {
            _bottomSheetButton = const PdfBottomButton();
          });
        case 2:
          setState(() {
            _bottomSheetButton = const NoteBottomButton();
          });
          break;
        default:
          setState(() {
            _bottomSheetButton = const RecordingBottomButtons();
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final profilePictureUrl =
        ref.watch(currentUserProvider).value!.profilePictureUrl;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24, top: 10),
            child: CircleAvatar(
              foregroundImage: NetworkImage(
                  profilePictureUrl.replaceAll('localhost', '10.0.2.2')),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Color.fromRGBO(31, 51, 228, 1),
                    Color.fromRGBO(6, 121, 225, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              child: const Text(
                'Info-Verse',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(108),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DecoratedBox(
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
                    Tab(text: 'Meeting Assitance'),
                    Tab(text: 'Chat PDF'),
                    Tab(text: 'My Note'),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 10),
              child: IconButton(
                // icon: const Icon(Icons.settings),
                icon: const Icon(Icons.exit_to_app),
                onPressed: () async {
                  // Navigate to the settings page. If the user leaves and returns
                  // to the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  ref.read(currentUserProvider.notifier).logout();
                  Navigator.pushReplacementNamed(context, SplashView.routeName);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomSheet(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          backgroundColor: Colors.white,
          elevation: 0,
          enableDrag: false,
          onClosing: () {},
          builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                _handleTabSelection(tabController.index);
              }
            });
            return ClipPath(
              clipper: WaveClipper(),
              child: Container(
                constraints: const BoxConstraints(minHeight: 150),
                width: double.infinity,
                padding: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(252, 138, 25, 1),
                      Color.fromRGBO(253, 119, 19, 1),
                      Color.fromRGBO(254, 96, 12, 1),
                    ],
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: _bottomSheetButton,
                ),
              ),
            );
          },
        ),
        body: const TabBarView(
          children: [
            RecordingView(),
            PdfView(),
            // NoteView(),
            Notes(),
          ],
        ),
      ),
    );
  }
}
