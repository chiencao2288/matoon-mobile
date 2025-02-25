import 'dart:async';

class Debounce {
  final Duration duration;

  Debounce({
    required this.duration,
  });

  Timer? _timer;

  void run(Function callback) {
    _timer?.cancel();
    _timer = Timer(duration, () {
      callback.call();
    });
  }
}
