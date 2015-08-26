#########################################################################
# File Name: map.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: 2014年03月28日 星期五 16时40分08秒
#########################################################################
#!/bin/bash
cp tdt_sc_8k/* tdt_sc_8kadapt -rf
#cd tdt_sc_8kadapt
./map_adapt -meanfn tdt_sc_8k/means -varfn tdt_sc_8k/variances -mixwfn tdt_sc_8k/mixture_weights -tmatfn tdt_sc_8k/transition_matrices -accumdir . -mapmeanfn tdt_sc_8kadapt/means -mapvarfn tdt_sc_8kadapt/variances -mapmixwfn tdt_sc_8kadapt/mixture_weights -maptmatfn tdt_sc_8kadapt/transition_matrices
echo "map_adapt completed!!"
./mk_s2sendump -pocketsphinx yes -moddeffn tdt_sc_8kadapt/mdef.txt -mixwfn tdt_sc_8kadapt/mixture_weights -sendumpfn tdt_sc_8kadapt/sendump
