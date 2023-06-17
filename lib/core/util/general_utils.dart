import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart' show RateLimit;

typedef Hmap = Map<String, dynamic>;

class GeneralUtils {
  // For bloc handling
  static EventTransformer<E> throttleDroppable<E>() {
    const throttleDuration = Duration(milliseconds: 200);

    return (events, mapper) {
      return droppable<E>().call(events.throttle(throttleDuration), mapper);
    };
  }

  static setupDelayTimer({
    int durationMs = 250,
    required Function() callback,
  }) {
    Timer(
      Duration(milliseconds: durationMs),
      callback,
    );
  }
}
