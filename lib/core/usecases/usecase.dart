abstract class BaseUseCase<Type> {
  const BaseUseCase();
}

abstract class UseCase<Type, Params> extends BaseUseCase<Type> {
  UseCase() : super();

  Future<Type> call({Params params});
}

abstract class NoParamsUseCase<Type> extends BaseUseCase<Type> {
  NoParamsUseCase() : super();

  Future<Type> call();
}
