import numpy as np
def LD(X,Y):
    m = len(X);
    n = len(Y);
    LD = np.zeros(shape=(m+1,2));
    for i in range(m+1):
        LD[i,0] = i;
    for j in range(1,n+1):
        LD[0,1]=j
        for i in range(1,m+1):
            if X[i-1] == Y[j-1]:
                LD[i,1] = LD[i-1,0];
            else:
                LD[i,1] = 1+min(LD[i-1,0],LD[i-1,1],LD[i,0])
        for i in range(m+1):
            LD[i,0]=LD[i,1]
    return LD[m,1];

with open('C:\\Users\86189\Desktop\data\MZ520935_B.1.617.2_Delta_2021.6.19_USA.txt',encoding='utf-8') as file:
    contentA=file.read()
with open('C:\\Users\86189\Desktop\data\OD932379_B.1.1.7_Alpha_2021.1.6_UK.txt',encoding='utf-8') as file:
    contentB=file.read()
print(LD(contentA,contentB))
