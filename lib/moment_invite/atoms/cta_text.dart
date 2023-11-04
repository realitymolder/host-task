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
        FadeEffect(
          duration: Duration(milliseconds: 500),
        )
      ],
      child: const Positioned(
        bottom: 20,
        left: 45,
        child: Text(
          'Invite some \nfriends!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9a83ef),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
