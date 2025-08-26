abstract class Observable {

  // callback -  função que não retorna nada, só é executada
  void addListener(void Function() callback);
  void removeListener(void Function() callback);

}
