import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CTATextAtom extends StatelessWidget {
  const CTATextAtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        MoveEffect(duration: Duration(milliseconds: 250)),
        FadeEffect(duration: Duration(milliseconds: 500))
      ],
      child: Positioned(
        bottom: 20,
        left: 45,
        child: Text(
          'Invite some \nfriends!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
