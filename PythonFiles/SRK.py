import csv
Compound = []
A12 = []
with open("SRK.csv") as csvfile:
    csvreader = csv.reader(csvfile,delimiter=',')

    for row in csvreader:
        Comp1 = row[3]
        Comp1 = Comp1.capitalize()
        Comp1 = Comp1.strip(" ")


        Comp2 = row[4]
        Comp2 = Comp2.capitalize()
        Comp2 = Comp2.strip(" ")

        if Comp1+'_'+Comp2 not in Compound:
            Compound.append(Comp1+'_'+Comp2)
            A12.append(row[2])
        #    A21.append(row[1])
  #      alpha.append(row[4])

print Compound
print A12
no = len(Compound)
no1 = len(A12)
print no
print no1
with open('SRK.txt','a') as txtfile:
     txtfile.write("{")
     for i in range(0,no):
         txtfile.write('"'+Compound[i]+'",')
     txtfile.write("}")
     txtfile.write("\n")
     txtfile.write("\n")
     for i in range(0,no):
         txtfile.write(str(A12[i])+',')




