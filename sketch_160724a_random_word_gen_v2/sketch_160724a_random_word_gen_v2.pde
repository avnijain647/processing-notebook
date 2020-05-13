//Word Type Variables
String verb[];
String noun[];
String preposition[];
String adjective[];
String adverb[];
String pronoun[];
String conjunction[];
String[] determiner = {"the", "a"};

//Colour Variables
String csv[];
String c[][];
color gC;

PFont font;
float xMargin = 20;

void setup() {
  size(1200, 800);
  frameRate(1);

  //font = createFont("HKGrotesk-Regular.otf", 64);
  //font = createFont("KarlaR.ttf", 64);
  font = createFont("InterR.ttf", 64);

  textFont(font, 14);

  csv = loadStrings("colordict.csv");
  c = new String[csv.length][0];
  for (int i =0; i<csv.length; i++) {
    c[i] = csv[i].split(",");
  }

  verb = loadStrings("verbsorted.csv");
  noun = loadStrings("nounsorted.csv");
  preposition = loadStrings("prepositionssort.csv");
  adjective = loadStrings("adjectivesort.csv");
  adverb = loadStrings("adverbsorted.csv");
  pronoun = loadStrings("pronouns.csv");
  conjunction = loadStrings("conjunction.csv");
  fill(0);
}


void draw() {  
  background(250);

  String sent1 = s1();
  fill(c(sent1));
  text(sent1, xMargin, height/3);

  String sent2 = s2();
  fill(c(sent2));
  text(sent2, xMargin, 1.45*height/3);

  String sent3 = s2();
  fill(c(sent3));
  text(sent3, xMargin, 2*height/3);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      saveFrame("save/fnlp-###.png");
    }
  }
}

color c(String sent) {
  color ret = 0;
  for (int i =0; i<c.length; i++) {
    int v1 = sent.indexOf(c[i][0]);
    if (v1!=-1) {
      String h1 = c[i][1];
      h1 = "FF" + h1.substring(1);
      ret = unhex(h1);
    }
  }
  return ret;
}

String s1() {
  return (v()+" "+pron()+" "+prep()+" "+pron()+" "+pron()+" "+v()+" "+v()+" "+pron()+" "+adj()+"\n"+
    n()+" "+adj()+" "+adv()+" "+conj()+" "+pron()+" "+v()+" "+adv()+" "+adj()+"\n"+
    pron()+" "+v()+" "+v()+" "+prep()+" "+n()+" "+n()+" "+v()+" "+pron()+" "+v());
}
String s2() {
  return (n()+" "+prep()+" "+det()+" "+n()+" "+prep()+" "+v()+" "+det()+" "+n()+" "+adv()+"\n"+
    v()+" "+n()+" "+adj()+" "+conj()+" "+v()+" "+pron()+" "+v()+" "+v()+" "+adv()+"\n"+
    adv()+" "+pron()+" "+v()+" "+n()+" "+adj()+" "+adv()+" "+v()+" "+adv()+"\n"+
    v()+" "+pron()+" "+adv()+" "+adj()+" "+prep()+" "+v()+" "+det()+" "+n()+" "+adv());
}

String n() {
  return noun[int(random(noun.length))];
}

String v() {
  return verb[int(random(verb.length))];
}
String prep() {
  return preposition[int(random(preposition.length))];
}
String adj() {
  return adjective[int(random(adjective.length))];
}
String adv() {
  return adverb[int(random(adverb.length))];
}
String pron() {
  return pronoun[int(random(pronoun.length))];
}
String conj() {
  return conjunction[int(random(conjunction.length))];
}
String det() {
  return determiner[int(random(determiner.length))];
}



/* 
 
 Glossary
 
 
 //Verse Structure 1
 //println(v()+" "+pron()+" "+prep()+" "+pron()+" "+pron()+" "+v()+" "+v()+" "+pron()+" "+adj());
 //println(n()+" "+adj()+" "+adv()+" "+conj()+" "+pron()+" "+v()+" "+adv()+" "+adj());
 //println(pron()+" "+v()+" "+v()+" "+prep()+" "+n()+" "+n()+" "+v()+" "+pron()+" "+v());
 //println("\n");
 
 //Verse Structure 2
 //println(n()+" "+prep()+" "+det()+" "+n()+" "+prep()+" "+v()+" "+det()+" "+n()+" "+adv());
 //println(v()+" "+n()+" "+adj()+" "+conj()+" "+v()+" "+pron()+" "+v()+" "+v()+" "+adv());
 //println(adv()+" "+pron()+" "+v()+" "+n()+" "+adj()+" "+adv()+" "+v()+" "+adv());
 //println(v()+" "+pron()+" "+adv()+" "+adj()+" "+prep()+" "+v()+" "+det()+" "+n()+" "+adv());
 //println("\n");
 
 */
