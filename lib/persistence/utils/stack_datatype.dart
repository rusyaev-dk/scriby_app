class DataStack<T> {
  final List<T> _elements = [];

  void push(T element) {
    _elements.add(element);
  }

  T pop() {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }
    return _elements.removeLast();
  }

  T peek() {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }
    return _elements.last;
  }

  void clear() {
    if (isEmpty) return;
    _elements.clear();
  }

  int get size => _elements.length;

  bool get isEmpty => _elements.isEmpty;
}
