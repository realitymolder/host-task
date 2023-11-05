// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:host_task/core/invitee_model.dart';
import 'package:host_task/moment_invite/atoms/cta_text.dart';

class MomentState {
  final List<Invitee> invitees;
  final List<Widget> inviteesCircles;
  MomentState({
    required this.invitees,
    required this.inviteesCircles,
  });

  factory MomentState.initial() {
    return MomentState(
      inviteesCircles: [const CTATextAtom()],
      invitees: [],
    );
  }

  MomentState copyWith({
    List<Invitee>? invitees,
    List<Widget>? inviteesCircles,
  }) {
    return MomentState(
      invitees: invitees ?? this.invitees,
      inviteesCircles: inviteesCircles ?? this.inviteesCircles,
    );
  }

  @override
  String toString() =>
      'MomentState(invitees: $invitees, inviteesCircles: $inviteesCircles)';

  @override
  bool operator ==(covariant MomentState other) {
    if (identical(this, other)) return true;

    return listEquals(other.invitees, invitees) &&
        listEquals(other.inviteesCircles, inviteesCircles);
  }

  @override
  int get hashCode => invitees.hashCode ^ inviteesCircles.hashCode;
}
