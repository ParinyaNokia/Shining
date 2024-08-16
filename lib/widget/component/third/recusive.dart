List abclist = [];

String outputAns = '';

void recusiveabc(dynamic inputtext) {
  for (var element in inputtext) {
    if (element is List || element is Iterable) {
      recusiveabc(element);
    } else {
      abclist.add(element);
      outputAns = abclist.toString();
      print(element);
      print("OutPut: $outputAns");
    }
  }
}

void showabc() {
  abclist.clear();
  var question = [
    1,
    2,
    [
      3,
      4,
      [5, 6],
      7
    ]
  ];

  recusiveabc(question);
}
