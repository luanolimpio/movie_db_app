import 'package:flutter/material.dart';

import 'i_pagination_controller.dart';

class PaginationScrollController extends ScrollController {
  PaginationScrollController({required IPaginationController delegate})
      : _delegate = delegate {
    addListener(_listener);
  }

  final IPaginationController _delegate;

  void _listener() {
    if (position.pixels == position.maxScrollExtent) {
      _delegate.loadMore();
    }
  }

  @override
  void dispose() {
    removeListener(_listener);

    super.dispose();
  }
}
