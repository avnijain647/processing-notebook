from PyDictionary import PyDictionary
dictionary = PyDictionary()

f = open("english3.txt", "r")
meanings = open("meaning.txt","w+")

for line in f:
#    print line,
    m = str(dictionary.meaning(line))
    if m!="None":
        print(line+" "+m)
        meanings.write(line+m + "\r\n")

meanings.close()