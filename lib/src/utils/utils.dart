Map<T, R> removeNullsFromMap<T, R>(Map<T, R> map) {
  if (map == null || map.isEmpty) return null;
  map..removeWhere((key, value) => value == null);
  return map;
}
