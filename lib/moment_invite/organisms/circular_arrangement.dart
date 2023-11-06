import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:host_task/moment_invite/atoms/circular_person.dart';
import 'package:host_task/moment_invite/atoms/cta_text.dart';
import 'package:host_task/moment_invite/moment_controller.dart';

class CircularArrangementOrganism extends ConsumerWidget {
  const CircularArrangementOrganism({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final momentState = ref.watch(momentControllerProvider);
    return SizedBox(
      height: 200,
      width: 200,
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        elevation: 4,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: CircularPersonAtom(
                  0,
                  '😝',
                  isHost: true,
                ),
              ),
            ),
            if (momentState.inviteesCircles.isEmpty)
              const CTATextAtom()
            else
              ...momentState.inviteesCircles,
          ],
        ),
      ),
    );
  }
}
