import 'package:flutter/material.dart';

import 'package:host_task/moment_invite/molecules/floating_action_buttons.dart';
import 'package:host_task/moment_invite/organisms/circular_arrangement.dart';
import 'package:host_task/theme/host_task_theme.dart';

class HostTaskApp extends StatelessWidget {
  const HostTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Host Task',
      theme: HostTheme.lightTheme(context),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Circular Arrangement'),
        ),
        body: const Center(
          child: Column(
            children: [
              CircularArrangementOrganism(),
            ],
          ),
        ),
        floatingActionButton: const FloatingActionButtonsMolecule(),
      ),
    );
  }
}
