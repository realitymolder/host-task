import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/moment_invite/moment_controller.dart';
import 'package:host_task/moment_invite/organisms/circular_arrangement.dart';

class HostTaskApp extends StatelessWidget {
  const HostTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Host Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Circular Arrangement'),
        ),
        body: const Center(
          child: Column(
            children: [
              CircularArrangement(),
            ],
          ),
        ),
        floatingActionButton: const FloatingActionButtonsMolecule(),
      ),
    );
  }
}

class FloatingActionButtonsMolecule extends ConsumerWidget {
  const FloatingActionButtonsMolecule({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () =>
              ref.read(momentControllerProvider.notifier).addItem(),
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () =>
              ref.read(momentControllerProvider.notifier).removeItem(),
          tooltip: 'Remove',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }