#! /bin/bash
Rscript scaler.R
awk -F "\"*,\"*" '{print $15}' train_sc.csv | tail -n +2 > y_bh.txt
cut -d, -f 2-14 train_sc.csv | tail -n +2 | sed 's/,/ /g' > X_b.txt
awk -F" " '{print "1",$0}' X_b.txt > X_bh.txt
rm X_b.txt

for i in {1..14}
do
   echo 0.1
done > b_bh.txt

awk -F "\"*,\"*" '{print $15}' val_sc.csv | tail -n +2 > y_v_bh.txt
cut -d, -f 2-14 val_sc.csv | tail -n +2 | sed 's/,/ /g' > X_v_b.txt
awk -F" " '{print "1",$0}' X_v_b.txt > X_v_bh.txt
rm X_v_b.txt
