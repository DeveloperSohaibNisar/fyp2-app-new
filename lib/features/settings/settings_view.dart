import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/providers/theme_provider.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Text(
                style: TextStyle(
                  // fontSize: 14,
                ),
                'Dark Mode'),
            Switch(
              value: themeMode.index == 2,
              onChanged: (enabled) async {
                if (enabled) {
                  await ref.read(appThemeProvider.notifier).toggleTheme();
                } else {
                  await ref.read(appThemeProvider.notifier).toggleTheme();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
