String verbs[];
String nouns[];
String prep[];
String adj[];
String adverb[];
String[] conjuction = {"and", "but", "or", "nor", "for", "yet", "so"};
int v, n, p, a, c, adv;

void setup() {
  size(50, 50);
  frameRate(2);

  verbs = loadStrings("verbsorted.csv");
  nouns = loadStrings("nounsorted.csv");
  prep = loadStrings("prepositionssort.csv");
  adj = loadStrings("adjectivesort.csv");
  adverb = loadStrings("adverbsorted.csv");
}

void draw() {
  c = int(random(conjuction.length));
  v = int(random(verbs.length));
  n = int(random(nouns.length));
  p = int(random(prep.length));
  a = int(random(adj.length));
  adv = int(random(adverb.length));

  println(nouns[n]+ " "+prep[p]+ " " + adj[a]+" "+conjuction[c]+" "+adverb[adv]+" "+verbs[v]);
}
