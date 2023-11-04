import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/core/invitee_model.dart';
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

  void addItem() {
    List<Invitee> people = state.invitees;
    // if (people.length >= 8) {
    //   // do nothing
    // } else {
    people.add(Invitee(id: people.length, photoUrl: mary));
    state = state.copyWith(invitees: people, hasContent: true);
    // }
  }

  void removeItem() {
    List<Invitee> people = state.invitees;
    if (people.isNotEmpty) {
      people.removeLast();
      state = state.copyWith(invitees: people);
    }
    if (state.invitees.isEmpty) {
      state = state.copyWith(hasContent: false);
    }
  }
}
