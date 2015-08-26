#encoding=utf-8

import sys
import jieba

tone_base = {}
multi_tone_base = {}
location_list =[]
device_list =[]
action_list =[]
#with open('dictdata/single_words.dic') as fp:
#    for line in fp:
#        han_zi, yin_biao = line.rstrip('\n').split(' ', 1)
#        tone_base[han_zi.decode('utf-8')] = yin_biao
#
#with open('dictdata/zh_han_zi_and_tone.dic') as fp:
#    for line in fp:
#        duan_ju, yin_biao = line.rstrip('\n').split(' ', 1)
#        multi_tone_base[duan_ju.decode('utf-8')] = yin_biao
with open('smarthomedata/location.dic') as fp:
    for line in fp:
        location1 = line.rstrip('\n')
        print location1
        location_list.append(location1.decode('utf-8'))
with open('smarthomedata/device.dic') as fp:
    for line in fp:
        device1 = line.rstrip('\n')
        print device1
        device_list.append(device1.decode('utf-8'))
with open('smarthomedata/action.dic') as fp:
    for line in fp:
        action1 = line.rstrip('\n')
        print action1
        action_list.append(action1.decode('utf-8'))


#for line in sys.stdin:
#    ju_zi = line.rstrip('\n')
    ju_zi=u"打开客厅吊灯"
#    seg_generator = jieba.cut(ju_zi) #jieba return decoded utf-8 string!!
#    seg_list=list(seg_generator)
    seg_list=[]
    seg_list1=jieba.cut(ju_zi)
    for seg in seg_list1:
        seg_list.append(seg)
	print seg
#    print location_list
#    print device_list
#    print action_list
    for location in location_list:
        print location
	if location in seg_list:
           param_location = location
           print param_location
           print "xxxxx"
    print "begin"
    for location in location_list:
#        print location
	if location in seg_list:
           param_location = location
           print param_location
	   for device in device_list:
#                print device
		if device in seg_list:
                   param_device = device
    		   print param_device
		   for action in action_list:
#        	       print action
		       if action in seg_list:
           	          param_action = action
                          print param_action
#    print param_location+param_device+param_action
    if param_location!="" and param_device!="" and param_action!="":
       print "param OK"
            
