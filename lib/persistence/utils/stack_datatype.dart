class DataStack<T> {
  DataStack({int maxSize = 35})
      : assert(maxSize >= 1, 'maxSize should be >= 1'),
        _maxSize = maxSize;

  final List<T> _elements = [];
  final int _maxSize;

  void push(T element) {
    if (size >= _maxSize) {
      _elements.removeAt(0);
    }
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

  bool get isNotEmpty => _elements.isNotEmpty;
}
