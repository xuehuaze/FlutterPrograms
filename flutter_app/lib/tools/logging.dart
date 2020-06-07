import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
}

final Logger log = new Logger('Flutter Programs');
