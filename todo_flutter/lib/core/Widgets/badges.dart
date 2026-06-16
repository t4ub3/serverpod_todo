import 'dart:ui';

import 'package:hux/hux.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/core/variables/colors.dart';

HuxBadge priorityBadge(Todo todo) {
  final name = todo.priority.displayName;
  final Color color;
  if (todo.isCompleted) {
    color = grey;
  } else {
    switch (todo.priority) {
      case Priority.low:
        color = greenMuted;
        break;
      case Priority.medium:
        color = yellowMuted;
        break;
      case Priority.high:
        color = redMuted;
        break;
    }
  }

  return HuxBadge(
    label: name,
    customColor: color,
  );
}
