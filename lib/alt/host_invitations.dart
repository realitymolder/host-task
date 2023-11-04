import 'package:flutter/material.dart';

class HostInvitations extends StatelessWidget {
  const HostInvitations({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: 220,
          color: Colors.blue,
        ),
        const Positioned(
          // Centered CA
          bottom: 0,
          right: 0,
          top: 0,
          left: 0,
          child: Center(
            child: CircleAvatar(
              radius: 40,
              child: Text('Host'),
            ),
          ),
        ),
        // centered widget first. Then add accourding to the math every x widget.  devide by 8. after 8 make the first + number.
        const Positioned(
          right: 0,
          bottom: 0,
          left: 140,
          top: 0,
          child: Center(
            child: CircleAvatar(
              radius: 20,
            ),
          ),
        ),
        const Positioned(
          right: 0,
          bottom: 100,
          left: 100,
          top: 0,
          child: Center(
            child: CircleAvatar(
              radius: 20,
            ),
          ),
        )
      ],
    );
  }
}
