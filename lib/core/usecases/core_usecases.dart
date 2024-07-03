abstract class CoreUsecase<Type, Params> {
  Future<Type> call(Params input);
}
