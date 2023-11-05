import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/core/invitee_model.dart';
import 'package:host_task/moment_invite/atoms/added_invitees_indicator.dart';
import 'package:host_task/moment_invite/atoms/circular_person.dart';
import 'package:host_task/moment_invite/atoms/cta_text.dart';
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

  void addItem(Invitee invitee) {
    if (state.inviteesCircles.length >= 8) {
      // Handle the case where there are more than 8 items (You can customize this logic)
      // For example, you can add an indicator or other elements.
      List<Widget> circles = state.inviteesCircles;

      circles.add(
        const AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          left: 140,
          top: 80,
          child: AddedInviteesIndicatorAtom(),
        ),
      );
      state = state.copyWith(inviteesCircles: circles);
      addToInvitees(invitee);
    } else {
      addToInvitees(invitee);
      positionElementsInCircle();
    }
  }

  void removeItem() {
    if (state.invitees.length > 8) {
      List<Invitee> people = state.invitees;
      people.removeLast();
      state = state.copyWith(invitees: people);
    } else if (state.invitees.length == 8) {
      List<Widget> circles = state.inviteesCircles;
      circles.removeLast();
      state = state.copyWith(inviteesCircles: circles);
    } else {
      List<Invitee> people = state.invitees;
      List<Widget> circles = state.inviteesCircles;
      if (people.isNotEmpty) {
        people.removeLast();
        state = state.copyWith(invitees: people, inviteesCircles: circles);
      }
      if (state.invitees.isEmpty) {
        state = MomentState.initial();
      }
    }
  }

  void addToInvitees(Invitee invitee) {
    List<Invitee> people = state.invitees;
    people.add(invitee);
    state = state.copyWith(invitees: people);
  }

  // void removeFromInvitees() {
  //   List<Invitee> people = state.invitees;
  //   people.add(invitee);
  //   state = state.copyWith(invitees: people);
  //   positionElementsInCircle();
  // }

  void positionElementsInCircle() {
    if (state.inviteesCircles.isNotEmpty) {
      const double radius = 60.0; // Adjust the radius as needed
      const double centerX = radius + 20; // Offset from the left
      const double centerY = radius + 20; // Offset from the top
      final double totalItems = state.invitees.length.toDouble();
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
    } else {
      List<Widget> items = [];
      items.add(const CTATextAtom());

      state = state.copyWith(inviteesCircles: items);
    }
  }
}
