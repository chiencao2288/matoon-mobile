import 'dart:async';

class Throttle {
  final Duration duration;

  Throttle({
    required this.duration,
  });

  Timer? _timer;

  void run(Function callback) {
    if (_timer?.isActive == true) {
      return;
    }

    callback.call();
    _timer = Timer(
      duration,
      () {},
    );
  }
}
