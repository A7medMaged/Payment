import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/theme/theme_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: state == ThemeMode.dark,
                onChanged: (val) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
