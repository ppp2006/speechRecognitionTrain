#encoding=utf-8

import sys
import jieba

tone_base = {}
multi_tone_base = {}

with open('dictdata/single_words.dic') as fp:
    for line in fp:
        han_zi, yin_biao = line.rstrip('\n').split(' ', 1)
        tone_base[han_zi.decode('utf-8')] = yin_biao

with open('dictdata/zh_han_zi_and_tone.dic') as fp:
    for line in fp:
        duan_ju, yin_biao = line.rstrip('\n').split(' ', 1)
        multi_tone_base[duan_ju.decode('utf-8')] = yin_biao

for line in sys.stdin:
    ju_zi = line.rstrip('\n')
    tone_list = []
    seg_list = jieba.cut(ju_zi) #jieba return decoded utf-8 string!!
    for duan_yu in seg_list:
        try:
            #sys.stdout.write(duan_yu)  #OK
            tone = multi_tone_base[duan_yu]
            #sys.stdout.write(tone) #null
            tone_list.append(tone)
        except KeyError:
            #print duan_yu + 'not found in multi_tone_base!'

            for char in duan_yu:
                tone = tone_base[char]
                tone_list.append(tone)
    print ju_zi + ' ' + ' '.join(tone_list)
            
