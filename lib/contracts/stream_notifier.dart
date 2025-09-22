abstract class IStreamNotifier<T> {
  T get state;
  Stream<T> get stream;

  void emit(T newState); // emite um novo estado

  Future<void> dispose(); // limpa os recursos

}
