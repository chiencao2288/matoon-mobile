class Either<Success, Failure> {
  final Success? _success;
  final Failure? _failure;

  const Either._(
    this._success,
    this._failure,
  );

  factory Either.success(Success value) {
    return Either._(value, null);
  }

  factory Either.failure(Failure value) {
    return Either._(null, value);
  }

  bool get isSuccess => _success != null;

  bool get isFailure => _failure != null;

  Success? get success => _success;

  Failure? get failure => _failure;

  Success get successNotNull => _success as Success;

  Failure get failureNotNull => _failure as Failure;

  Success successOrElse(Success fallback) => _success ?? fallback;

  Failure failureOrElse(Failure fallback) => _failure ?? fallback;

  T? fold<T>({
    T Function(Success)? success,
    T Function(Failure)? failure,
  }) {
    return isSuccess
        ? success?.call(_success as Success)
        : failure?.call(_failure as Failure);
  }

  T orElse<T>({
    T Function(Success)? success,
    T Function(Failure)? failure,
    required T Function() orElse,
  }) {
    return isSuccess
        ? (success?.call(_success as Success) ?? orElse())
        : (failure?.call(_failure as Failure) ?? orElse());
  }
}
