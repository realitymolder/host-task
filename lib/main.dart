import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:host_task/core/host_task_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: HostTaskApp(),
    ),
  );
}
