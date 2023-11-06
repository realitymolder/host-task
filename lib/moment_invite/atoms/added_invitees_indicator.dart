import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/moment_invite/moment_controller.dart';

class AddedInviteesIndicatorAtom extends ConsumerWidget {
  const AddedInviteesIndicatorAtom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(momentControllerProvider);
    return CircleAvatar(
      radius: 18,
      backgroundColor: Theme.of(context).primaryColor,
      child: Text('+${state.inviteesCircles.length - 7}'),
    );
  }
}
