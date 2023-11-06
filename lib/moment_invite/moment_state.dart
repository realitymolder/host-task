// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MomentState {
  final List<Widget> inviteesCircles;
  final int inviteesCounter;
  MomentState({
    required this.inviteesCircles,
    required this.inviteesCounter,
  });

  factory MomentState.initial() {
    return MomentState(
      inviteesCircles: [],
      inviteesCounter: 0,
    );
  }

  MomentState copyWith({
    List<Widget>? inviteesCircles,
    int? inviteesCounter,
  }) {
    return MomentState(
      inviteesCircles: inviteesCircles ?? this.inviteesCircles,
      inviteesCounter: inviteesCounter ?? this.inviteesCounter,
    );
  }

  @override
  String toString() =>
      'MomentState(inviteesCircles: $inviteesCircles, inviteesCounter: $inviteesCounter)';

  @override
  bool operator ==(covariant MomentState other) {
    if (identical(this, other)) return true;

    return listEquals(other.inviteesCircles, inviteesCircles) &&
        other.inviteesCounter == inviteesCounter;
  }

  @override
  int get hashCode => inviteesCircles.hashCode ^ inviteesCounter.hashCode;
}
