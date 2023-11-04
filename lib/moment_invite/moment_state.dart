// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:host_task/core/invitee_model.dart';

class MomentState {
  final bool hasContent;
  final List<Invitee> invitees;
  MomentState({
    required this.hasContent,
    required this.invitees,
  });

  factory MomentState.initial() {
    return MomentState(
      hasContent: false,
      invitees: [],
    );
  }

  MomentState copyWith({
    bool? hasContent,
    List<Invitee>? invitees,
  }) {
    return MomentState(
      hasContent: hasContent ?? this.hasContent,
      invitees: invitees ?? this.invitees,
    );
  }

  @override
  String toString() =>
      'MomentState(hasContent: $hasContent, invitees: $invitees)';

  @override
  bool operator ==(covariant MomentState other) {
    if (identical(this, other)) return true;

    return other.hasContent == hasContent &&
        listEquals(other.invitees, invitees);
  }

  @override
  int get hashCode => hasContent.hashCode ^ invitees.hashCode;
}
