bool sameTypes<S, V>() {
  void func<X extends S>() {}
  return func is void Function<X extends V>();
}
