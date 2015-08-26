#!/usr/bin/env python
#-*- coding:utf-8 -*-
import re 
import json 
	
def PreProcess(sentence,edcode="utf-8"):  
	sentence = sentence.decode(edcode)  
	sentence= re.sub("[。，, !......! << >> <>/ ':：？/?、/|“”‘’;]","", sentence)  
	return sentence
      
def FMM(sentence,diction,result = [],maxwordLength = 4,edcode="utf-8"):  
        i = 0  
        sentence = PreProcess(sentence,edcode)  
        length = len(sentence)  
#        print "sentence length=%d"% length
        while i < length:  
            # find the ascii word  
            tempi=i  
            tok=sentence[i:i+1]  
            #while re.search("[0-9A-Za-z/-/+#@_/.]{1}",tok)<>None:  
            m= re.search("[0-9A-Za-z/-/+#@_/.]{1}",tok, re.M)  
            while m<>None:
#	        print m.groups(0)
		i= i+1  
                tok=sentence[i:i+1]  
                m= re.search("[0-9A-Za-z/-/+#@_/.]{1}",tok, re.M)  
 #           print "i=%d,tmpi=%d" %(i,tempi)
	    if i-tempi>0:  
                result.append(sentence[tempi:i].lower().encode(edcode))  
            # find chinese word  
            left = len(sentence[i:])  
            print "left===============%d sentence=%s" %(left,sentence[i:])
            if left == 1:  
                """go to 4 step over the FMM"""  
                """should we add the last one? Yes, if not blank"""  
                if sentence[i:] <> " ":  
                    result.append(sentence[i:].encode(edcode))  
                return result  
            m = min(left,maxwordLength)  
            for j in xrange(m,0,-1):  
                leftword = sentence[i:j+i].encode(edcode)  
             #   print leftword.decode(edcode)  
                if LookUp(leftword,diction):  
                    # find the left word in dictionary  
                    # it's the right one  
                    i = j+i  
                    
		    #tmp={leftword:diction[leftword]}
		    #result.append(tmp)  
                    result.append(leftword)
		    print re.sub("\n","",diction[leftword]),
	            fw.write(re.sub("\n", " ", diction[leftword]))
	            #print diction.get(leftword)
		    break  
                elif j == 1:  
                    """only one word, add into result, if not blank"""  
                    if leftword.decode(edcode) <> " ":  
                         #tmp={leftword:diction.get(leftword).encode(edcode)}
         	         #result.append(tmp)  
                         result.append(leftword)  
                         i = i+1 
                         #print diction[leftword], 
		         print re.sub("\n","",diction[leftword]),
	                 fw.write(re.sub("\n", " ", diction[leftword]))
                else:  
                    continue  
        #print "------------"
	return result  
def LookUp(word,dictionary):  
        if dictionary.has_key(word):  
            #print dictionary.get(word)
            return True  
        return False  
def ConvertGBKtoUTF(sentence):  
       return sentence.decode('gbk').encode('utf-8') 

if __name__=="__main__":
        fw=open("autodict", "w+")
	f=open("../../zh_broadcastnews_utf8.dic","r")
	dictions={}
  	d = f.readlines()
	f.close()      

	for ea in d:
	    wordlist = ea.split(' ', 1)
	    word = wordlist[0]    
	    phone = wordlist[1]
            dictions[word] = phone
 #       for loop in dictions:
#            print loop,dictions[loop]
#	    print "word=%s,phone=%s" %(word, phone)
#	for each in dictions:
 #           print "this user and emai :%-15s %s" % (each,  dictions[each])

	f = open("robot.ori",'r')  
	d = f.readlines()
	f.close()
	for line in d:  
	   # s = FMM(ConvertGBKtoUTF(line),dictions)  
	    #print line,
 	    print re.sub("\n","",line),
	    fw.write(re.sub("\n", " ", line))
	    s = FMM(line, dictions)  
            #print s.encode('utf-8')
            print ""
            fw.write("\n")
        for i in s:  
            print i
	        #print i.decode("utf-8")  
                  #jsoninfo=json.dumps(i)	         
         	  #print jsoninfo.decode("utf-8")
   	fw.close()    	   
#print "||||||||||||||||||||||||" 
