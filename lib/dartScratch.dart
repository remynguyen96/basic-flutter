void main() {
  // Inferred as if you wrote <int>[].
  List<int> listOfInt = [];

// Inferred as if you wrote <double>[3.0].
  var listOfDouble = [3.0 ,5.0, 5.3, 34.0, 45];

// Inferred as Iterable<int>
  var ints = listOfDouble.map((x) => x.toInt());

  print(ints);

}
