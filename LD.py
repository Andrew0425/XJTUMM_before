import numpy as np
def LD(X,Y):
     m = len(X);
     n = len(Y);
     LD = np.zeros(shape=(m+1,n+1));
     b = np.empty(shape=(m+1,n+1));
     for j in range(n+1):
          LD[0,j] = j;
     for i in range(m+1):
          LD[i,0] = i;
     for i in range(1,m+1):
          for j in range(1,n+1):
               if X[i-1] == Y[j-1]:
                    LD[i,j] = LD[i-1,j-1];
               else:
                    if LD[i-1,j-1]>LD[i-1,j]:
                         if LD[i-1,j]>LD[i,j-1]:
                              LD[i,j] = LD[i,j-1]+1;
                              b[i,j] = 2;
                         else:
                              LD[i,j] = LD[i-1,j]+1;
                              b[i,j] = 3;
                    else:
                         if LD[i-1,j-1]>LD[i,j-1]:
                              LD[i,j] = LD[i,j-1]+1;
                              b[i,j] = 2;
                         else:
                              LD[i,j] = LD[i-1,j-1]+1;
                              b[i,j] = 1;
     return LD[m,n];

with open('C:\\Users\86189\Desktop\DELTA.txt',encoding='utf-8') as file:
     contentA=file.read()
with open('C:\\Users\86189\Desktop\ALPHA.txt',encoding='utf-8') as file:
     contentB=file.read()
print(LD(contentA,contentB))
