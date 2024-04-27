import 'package:flutter/material.dart';

import '../../screens/reading/reading_view.dart';

class ReadingRouteBuilder<T> extends PageRouteBuilder<T> {
  ReadingRouteBuilder() : super(pageBuilder: (_, __, ___) => ReadingView());
}
