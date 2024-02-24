extension DynamicExtensions on dynamic {
  String removeAsterisks() => toString().replaceAll('*', '');
}
