python driver/host.py -p $1 -i $2.hex
python driver/host.py -p $1 -d $2.in
python driver/host.py -p $1 -c s
sleep 5
python driver/host.py -p $1 -c s
python driver/host.py -p $1 -r out.txt
diff out.txt $2.out