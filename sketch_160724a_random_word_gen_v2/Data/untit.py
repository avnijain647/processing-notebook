import csv

prep = open("prepositions.csv","w+")
noun = open("nouns.csv","w+")
verb = open("verbs.csv","w+")
adj = open("adjectives.csv","w+")
adverb = open("adverbs.csv","w+")
#pronoun = open("pronouns.csv","w+")

with open("combi.csv", "r") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for lines in csv_reader:
#        Prepositions
        if "prep." in lines[1]:
            prep.write(lines[0] + "\r\n")
            
#        Nouns    
        if "n." in lines[1]:
            noun.write(lines[0] + "\r\n")
            
#        Verbs    
        if "vb." in lines[1]:
            verb.write(lines[0] + "\r\n")
            
#        Adjectives
        if "a." in lines[1]:
            adj.write(lines[0] + "\r\n")
        
#        Adverb
        if "adv." in lines[1]:
            adverb.write(lines[0] + "\r\n")
            
##        Pronoun    
#        if "prep." in lines[1]:
#            pronoun.write(lines[0] + "\r\n")


            
            
            
            
prep.close()
noun.close()
verb.close()
adj.close()
adverb.close()
#pronoun.close()