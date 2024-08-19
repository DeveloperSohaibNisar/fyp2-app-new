import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../features/settings/settings_view.dart';
import '../recorder/recorder_view.dart';
import 'tabpages/notes/note_view.dart';
import 'tabpages/pdf/pdf_view.dart';
import 'tabpages/recordings/recordings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget _bottomSheetButton = const RecordingBottomButton();

  _handleTabSelection(currentIndex) {
    setState(() {
      switch (currentIndex) {
        case 0:
          setState(() {
            _bottomSheetButton = const RecordingBottomButton();
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
            _bottomSheetButton = const RecordingBottomButton();
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50,
          leading: const Padding(
            padding: EdgeInsets.only(left: 24, top: 10),
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/images/profile_picture.png'),
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
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // Navigate to the settings page. If the user leaves and returns
                  // to the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.restorablePushNamed(
                      context, SettingsView.routeName);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomSheet(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          backgroundColor: Colors.transparent,
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
              clipper: MyClipper(),
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
            NoteView(),
          ],
        ),
      ),
    );
  }
}

class NoteBottomButton extends StatelessWidget {
  const NoteBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () {},
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.add,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
      ],
    );
  }
}

class PdfBottomButton extends StatelessWidget {
  const PdfBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () {},
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.upload_file,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();

    path_0.moveTo(0, 0);
    path_0.cubicTo(
        size.width * 0.1256000,
        size.height * 0.0094000,
        size.width * 0.1206250,
        size.height * 0.3255333,
        size.width * 0.2500000,
        size.height * 0.3333333);
    path_0.cubicTo(
        size.width * 0.3743250,
        size.height * 0.3166000,
        size.width * 0.3757000,
        size.height * 0.0030667,
        size.width * 0.5000000,
        0);
    path_0.cubicTo(
        size.width * 0.6243250,
        size.height * 0.0030667,
        size.width * 0.6190750,
        size.height * 0.3258667,
        size.width * 0.7500000,
        size.height * 0.3333333);
    path_0.cubicTo(size.width * 0.8743250, size.height * 0.3392000,
        size.width * 0.8756000, size.height * 0.0076667, size.width, 0);
    path_0.quadraticBezierTo(
        size.width, size.height * 0.2500000, size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.quadraticBezierTo(0, size.height * 0.7500000, 0, 0);
    path_0.close();
    /*
    var firstStart = Offset(size.width/5, 0);
    var firstEnd = Offset(size.width/2.25, 50);
    var SecondStart = Offset(size.width-(size.width/3.24), 105);
    var SecondEnd = Offset(size.width, 10);
    var thirdStart = Offset(size.width/5, 0);
    path_0.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    path_0.quadraticBezierTo(SecondStart.dx, SecondStart.dy, SecondEnd.dx, SecondEnd.dy);
    */

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class RecordingBottomButton extends StatelessWidget {
  const RecordingBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () async {
            var status = await Permission.microphone.request();
            if (!context.mounted) return;
            switch (status) {
              case PermissionStatus.permanentlyDenied:
                var snackBar = SnackBar(
                  content: const Text('microphone permission required!'),
                  action: SnackBarAction(
                    label: 'Open Settings',
                    onPressed: () => openAppSettings(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                break;
              case PermissionStatus.denied:
                const snackBar = SnackBar(
                    content: Text('microphone permission not granted'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                break;
              case PermissionStatus.granted:
                Navigator.restorablePushNamed(context, RecorderView.routeName);
              default:
            }
          },
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.mic,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
        const SizedBox(width: 40),
        IconButton.filledTonal(
          onPressed: () async {
            var picked = await FilePicker.platform.pickFiles();
            if (picked != null) {
              if (kDebugMode) {
                print(picked.files.first.name);
              }
            }
          },
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.audio_file,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
      ],
    );
  }
}
