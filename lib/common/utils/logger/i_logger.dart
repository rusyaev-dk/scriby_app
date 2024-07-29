abstract interface class ILogger {
  void log(String message);

  void warning(String message);

  void info(String message);

  void exception(Object exception, [StackTrace? stackTrace]);

  void error(Object error, [StackTrace? stackTrace]);
}
