import 'package:flutter/material.dart';

@immutable
class DashboardState {
  final int currentIndex;

  const DashboardState({required this.currentIndex});

  factory DashboardState.initial() => const DashboardState(currentIndex: 0);

  DashboardState copyWith({int? currentIndex}) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
