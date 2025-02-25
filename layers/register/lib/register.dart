import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

final class LayerRegister {
  const LayerRegister._();

  static const I = LayerRegister._();

  Future<void> init() async {
    await _registerDependency();
    await _registerRepository();
    await _registerUsecase();
  }

  Future<void> _registerDependency() async {}

  Future<void> _registerRepository() async {
    Injector.I.factory<AuthRepository>(
      register: () => AuthRepositoryImpl(),
    );
  }

  Future<void> _registerUsecase() async {}
}
