import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/moment_invite/atoms/added_invitees_indicator.dart';

import 'package:host_task/moment_invite/atoms/circular_person.dart';

import 'package:host_task/moment_invite/moment_state.dart';

final momentControllerProvider =
    StateNotifierProvider<MomentController, MomentState>((ref) {
  return MomentController(
    MomentState.initial(),
  );
});

class MomentController extends StateNotifier<MomentState> {
  MomentController(
    MomentState state,
  ) : super(state);

  void invokeCounter(Mode mode) {
    int? counter = state.inviteesCounter;
    switch (mode) {
      case Mode.add:
        counter++;
        state = state.copyWith(inviteesCounter: counter);
        if (counter == 8) {
          List<Widget> circles = state.inviteesCircles
            ..add(
              const AnimatedPositioned(
                duration: Duration(milliseconds: 400),
                left: 140,
                top: 80,
                child: AddedInviteesIndicatorAtom(),
              ),
            );

          state = state.copyWith(inviteesCircles: circles);
        } else {
          if (counter <= 8) {
            positionElementsInCircle(Mode.add);
          }
        }
      case Mode.remove:
        if (counter != 0) {
          counter--;
          state = state.copyWith(inviteesCounter: counter);
          positionElementsInCircle(Mode.remove);
        }
    }
  }

  void positionElementsInCircle(Mode mode) {
    const double radius = 60.0; // Adjust the radius as needed
    const double centerX = radius + 20; // Offset from the left
    const double centerY = radius + 20; // Offset from the top
    final double totalItems = state.inviteesCounter.toDouble();
    final double angle = (2 * pi) / totalItems;

    List<Widget> positionedItems = [];

    for (int i = 0; i < totalItems; i++) {
      double x = centerX + radius * cos(i * angle);
      double y = centerY + radius * sin(i * angle);

      positionedItems.add(
        AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          left: x,
          top: y,
          child: CircularPersonAtom(i, 'Test $i'),
        ),
      );
    }

    state = state.copyWith(inviteesCircles: positionedItems);
  }
}

// void addInvitee(Invitee invitee) {
//   if (state.inviteesCircles.length >= 8) {
//     // Handle the case where there are more than 8 items (You can customize this logic)
//     // For example, you can add an indicator or other elements.
//     List<Widget> circles = state.inviteesCircles
//       ..add(
//         const AnimatedPositioned(
//           duration: Duration(milliseconds: 400),
//           left: 140,
//           top: 80,
//           child: AddedInviteesIndicatorAtom(),
//         ),
//       );

//     state = state.copyWith(inviteesCircles: circles);
//   } else {
//     // addToInvitees(invitee);
//     positionElementsInCircle(invitee);
//   }
// }

// void removeInvitee() {
//   // Case: indicator case
//   if (state.inviteesCircles.length > 8) {
//     List<Widget> inviteesC = state.inviteesCircles..removeLast();

//     state = state.copyWith(inviteesCircles: inviteesC);
//   } else if (state.inviteesCircles.length == 8) {
//     // Case: going back from indicator to reg cirlce
//     List<Widget> inviteesC = state.inviteesCircles..removeLast();

//     state = state.copyWith(invitees: invitees, inviteesCircles: inviteesC);
//   } else {
//     // Case: circle population case
//     List<Widget> circles = state.inviteesCircles;
//     if (people.isNotEmpty) {
//       people.removeLast();
//       state = state.copyWith(invitees: people, inviteesCircles: circles);
//     }
//     if (state.inviteesCircles.isEmpty) {
//       state = MomentState.initial();
//     }
//   }
// }

enum Mode {
  add,
  remove,
}
