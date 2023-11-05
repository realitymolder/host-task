import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";

const String mary =
    'https://upload.wikimedia.org/wikipedia/commons/2/2c/Blessed_Virgin_Mary.jpg';

class CircularPersonAtom extends StatelessWidget {
  final int index;
  final String content;
  final bool isHost;

  const CircularPersonAtom(
    this.index,
    this.content, {
    this.isHost = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
        // onPlay: (controller) => isHost ? null : controller.repeat(),
        effects: const [
          // ShakeEffect(hz: isHost ? 0 : 1.7),
          FadeEffect(),
        ],
        child: CircleAvatar(
          backgroundImage: const NetworkImage(mary),
          radius: isHost ? 28 : 18,
          child: isHost
              ? Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Material(
                    color: Colors.black.withAlpha(150),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '  Host  ',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )
              : Text(
                  content,
                  style: const TextStyle(fontSize: 12, color: Colors.green),
                ),
        ));
  }
}
