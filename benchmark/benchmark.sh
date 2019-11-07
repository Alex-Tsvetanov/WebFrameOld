#!/bin/bash

for i in `seq 1 30`; do
    echo -n $i;
    # >&2 echo "Label: C++";
    # time curl http://localhost:8888/$i;
    # >&2 echo "Label: Python";
    # time curl http://localhost:5000/$i;
    >&2 echo "Label: Node.JS Express";
    time curl http://localhost:3000/$i;
done 2> tmp/test.record > tmp/output
rm tmp/output
cat tmp/test.record | grep -E -i -w 'Label|real' | sed ':a;N;$!ba;s/C++\nreal/C++/g' | sed ':a;N;$!ba;s/Node.JS Express\nreal/Node.JS Express/g' | sed ':a;N;$!ba;s/Python\nreal/Python/g' | sed 's/Label: //g' | sed ':a;N;$!ba;s/s\nPython/s <1> Python/g' | sed ':a;N;$!ba;s/s\nNode.JS Express/s <2> Node.JS Express/g' > tmp/test.record.filtered;
# cat tmp/test.record.filtered | sed 's/C++//g' | sed 's/Python//g' | sed 's/ //g' | sed ':a;N;$!ba;s/\t//g' | sed 's/m/*60+/g' | sed 's/s//g' | sed 's/^/print(100 - ((/' | sed 's/$/)*100));/' | sed 's/<->/)\/(/';
echo "C++:";
cat tmp/test.record.filtered | sed 's/C++//g' | sed 's/Python//g' | sed 's/Node.JS Express//g' | sed 's/ //g' | sed ':a;N;$!ba;s/\t//g' | sed 's/<1>.*//g';
echo "Python:";
cat tmp/test.record.filtered | sed 's/C++//g' | sed 's/Python//g' | sed 's/Node.JS Express//g' | sed 's/ //g' | sed ':a;N;$!ba;s/\t//g' | sed 's/.*<1>//g' | sed 's/<2>.*//g';
echo "Node.JS Express:";
cat tmp/test.record.filtered | sed 's/C++//g' | sed 's/Python//g' | sed 's/Node.JS Express//g' | sed 's/ //g' | sed ':a;N;$!ba;s/\t//g' | sed 's/.*<2>//g';

cat tmp/test.record | grep -E -i -w 'Label|real' | sed 's/Label: //g' | sed ':a;N;$!ba;s/Node.JS Express\nreal//g'
