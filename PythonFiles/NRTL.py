import csv
Compound = []
A12 = []
A21 = []
alpha = []
with open("nrtlnewfinal.csv") as csvfile:
    csvreader = csv.reader(csvfile,delimiter=',')

    for row in csvreader:
        Comp1 = row[5]
        Comp1 = Comp1.capitalize()
        Comp1 = Comp1.strip(" ")


        Comp2 = row[6]
        Comp2 = Comp2.capitalize()
        Comp2 = Comp2.strip(" ")

        Compound.append(Comp1+'_'+Comp2)
        A12.append(row[2])
        A21.append(row[3])
        alpha.append(row[4])

print Compound
print A12
no = len(Compound)
print no
with open('NRTL.txt','a') as txtfile:
     txtfile.write("{")
     for i in range(0,no):
         txtfile.write('"'+Compound[i]+'",')
     txtfile.write("}")
     txtfile.write("\n")
     txtfile.write("\n")
     for i in range(0,no):
         txtfile.write("{"+str(A12[i])+","+str(A21[i])+","+str(alpha[i])+"},")




