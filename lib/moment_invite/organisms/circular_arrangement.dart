import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/moment_invite/atoms/added_invitees_indicator.dart';

import 'package:host_task/moment_invite/atoms/circular_person.dart';
import 'package:host_task/moment_invite/atoms/cta_text.dart';
import 'package:host_task/moment_invite/moment_controller.dart';
import 'package:host_task/moment_invite/moment_state.dart';

class CircularArrangement extends ConsumerWidget {
  const CircularArrangement({super.key});

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
            ...positionElementsInCircle(momentState),
          ],
        ),
      ),
    );
  }

  List<Widget> positionElementsInCircle(MomentState momentState) {
    if (momentState.hasContent) {
      const double radius = 60.0; // Adjust the radius as needed
      const double centerX = radius + 20; // Offset from the left
      const double centerY = radius + 20; // Offset from the top
      final double totalItems = momentState.invitees.length.toDouble();
      final double angle = (2 * pi) / totalItems;

      List<Widget> positionedItems = [];

      for (int i = 0; i < totalItems; i++) {
        double x = centerX + radius * cos(i * angle);
        double y = centerY + radius * sin(i * angle);

        positionedItems.add(
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            left: x,
            top: y,
            child: CircularPersonAtom(i, 'Test $i'),
          ),
        );
      }

      if (momentState.invitees.length >= 8) {
        positionedItems.removeAt(0);
        positionedItems.insert(
          0,
          const AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            left: 20,
            top: 20,
            child: AddedInviteesIndicatorAtom(),
          ),
        );

        return positionedItems;
      } else {
        return positionedItems;
      }
    } else {
      List<Widget> items = [];
      items.add(const CTATextAtom());

      return items;
    }
  }
}

