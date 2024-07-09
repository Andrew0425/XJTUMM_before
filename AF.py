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

# with open('C:\\Users\86189\Desktop\OU401640_AY.4_Delta_2021.6.29_UK.txt',encoding='utf-8') as file:
#     contentA=file.read()
# with open('C:\\Users\86189\Desktop\ena_data_20230110-1117.txt',encoding='utf-8') as file:
#     contentB=file.read()
# print(LD(contentA,contentB))

def AF(M):
     m = len(M);
     anc = 1;
     s = 100000;

     for i in range(1,m+1):
          ans = 0
          for j in range(1,m+1):
               ans+=LD(M[i-1],M[j-1]);
          if ans<s:
               anc = i;
               s = ans;
     return anc
X = ['ATC','ATTGTAA','ATGGGGG']
# print(AF(X));
def TREE(anc,X):
     m = len(X)
     A = np.zeros(shape=(m+1,m+1));
     for i in range(1,m+1):
          for j in range(1,m+1):
               if LD(X[anc-1],X[j-1]) == LD(X[anc-1],X[i-1]) + LD(X[i-1],X[j-1]):
                    A[i,j] = 1;
     return A;
print(TREE(AF(X),X))

