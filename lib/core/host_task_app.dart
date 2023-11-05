import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/core/invitee_model.dart';
import 'package:host_task/moment_invite/atoms/circular_person.dart';
import 'package:host_task/moment_invite/moment_controller.dart';
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

class FloatingActionButtonsMolecule extends ConsumerWidget {
  const FloatingActionButtonsMolecule({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => ref.read(momentControllerProvider.notifier).addItem(
                Invitee(id: 333, photoUrl: mary),
              ),
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () =>
              ref.read(momentControllerProvider.notifier).removeItem(),
          tooltip: 'Remove',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
