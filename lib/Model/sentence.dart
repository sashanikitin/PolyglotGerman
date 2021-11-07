import 'dart:math';

import 'constsEng.dart';
import 'constsGer.dart';
import 'matching.dart';

class FirstSentence {
  late String task;
  late String result;
  late List<List<String>> words;

  FirstSentence() {
    result = "";
    List<String> row1 = getRandomPronouns();
    String pronoun = row1[0];
    List<String> row2 = getVerbs(pronoun);
    String verb = row2[0];
    result = pronoun + " " + verb;
    row1 = shuffle(row1);
    row2 = shuffle(row2);
    words = [row1, row2];
  }

  List<String> getVerbs(String pronoun) {
    int rng = 1;
    int rng1 = 2;
    int rng2 = 3;
    var equal = false;
    while (!equal) {
      rng = new Random().nextInt(8);
      rng1 = new Random().nextInt(8);
      rng2 = new Random().nextInt(8);
      if (rng != rng1 && rng1 != rng2 && rng != rng2) {
        equal = true;
      }
    }
    int counter = 0;
    String verb = "";
    String verb1 = "";
    String verb2 = "";
    for (var v in verbs.keys) {
      if (rng == counter) verb = v;
      if (rng1 == counter) verb1 = v;
      if (rng2 == counter++) verb2 = v;
    }

    String? engP = pronouns[pronoun];
    String? engV = verbs[verb];
    if ((engP == he || engP == she || engP == it) && engV != null) {
      engV += heSheItEnd;
    }
    task = engP! + " " + engV!;

    if (pronoun == er || pronoun == sie || pronoun == es || pronoun == ihr) {
      verb += erSieEsEnd;
      verb2 += duEnd;
      verb1 += wirIhrSieEnd;
    } else if (pronoun == ich) {
      verb += ichEnd;
      verb2 += duEnd;
      verb1 += erSieEsEnd;
    } else if (pronoun == wir || pronoun == sie2 || pronoun == Sie) {
      verb += wirIhrSieEnd;
      verb2 += duEnd;
      verb1 += erSieEsEnd;
    } else if (pronoun == du) {
      verb2 += erSieEsEnd;
      verb += duEnd;
      verb1 += wirIhrSieEnd;
    } else {
      verb2 += erSieEsEnd;
      verb1 += wirIhrSieEnd;
    }
    List<String> ret = [verb, verb1, verb2];
    return ret;
  }

  List<String> getRandomPronouns() {
    int counter = 0;
    var equal = false;
    int rng = 1;
    int rng1 = 2;
    int rng2 = 3;
    while (!equal) {
      rng = new Random().nextInt(8);
      rng1 = new Random().nextInt(8);
      rng2 = new Random().nextInt(8);
      if (rng != rng1 && rng1 != rng2 && rng != rng2) {
        equal = true;
      }
    }
    String pronoun = "";
    String pronoun1 = "";
    String pronoun2 = "";
    for (var v in pronouns.keys) {
      if (rng == counter) pronoun = v;
      if (rng1 == counter) pronoun1 = v;
      if (rng2 == counter++) pronoun2 = v;
    }
    return [pronoun, pronoun1, pronoun2];
  }

  List<String> shuffle(List<String> items) {
    var random = new Random();
    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }
}
