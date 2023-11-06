import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/moment_invite/moment_controller.dart';

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
          onPressed: () => ref
              .read(momentControllerProvider.notifier)
              .invokeCounter(Mode.add),
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () => ref
              .read(momentControllerProvider.notifier)
              .invokeCounter(Mode.remove),
          tooltip: 'Remove',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
