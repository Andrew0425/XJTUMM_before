import numpy as np
def LCS_LENGTH(X,Y):
     m = len(X);
     n = len(Y);
     # p = np.empty(shape=m+1,dtype=str)
     # for i in range(1,m+1):
     #      p[i] = X[i-1];
     # q = np.empty(shape=n+1,dtype=str)
     # for j in range(1,n+1):
     #      q[i] = Y[i-1];
     c = np.zeros((m+1,n+1))
     b = np.zeros((m+1,n+1));
     # 左上方箭头 -> 1
     # 左箭头 -> 2
     # 上箭头 -> 3
     # i = 0 or j = 0

     for i in range(m+1):
          c[i,0] = 0;
     for j in range(n+1):
          c[0,j] = 0;
     for i in range(1,m+1):
          for j in range(1,n+1):
               if X[i-1] == Y[j-1]:
                    c[i,j] = c[i-1,j-1]+1;
                    b[i,j] = 1;
               elif c[i,j-1] >= c[i-1,j]:
                    c[i,j] = c[i,j-1];
                    b[i,j] = 2;
               else:
                    c[i,j] = c[i-1,j];
                    b[i,j] = 3;
     # 时间复杂度O(mn)
     return c,b;
def PRINT_LCS(b,X,i,j,):
     if i == 0:     return ;
     if j == 0:     return ;
     if b[i,j] == 1:
          print(X[i-1])
          PRINT_LCS(b,X,i-1,j-1);
     elif b[i,j] ==3:    PRINT_LCS(b,X,i-1,j);
     elif b[i,j] ==2:     PRINT_LCS(b,X,i,j-1);
     # O(m+n)
A = 'ATCGTACG'
B = 'TATCG'
a,b = LCS_LENGTH(A,B);
print(PRINT_LCS(a,A,len(A),len(B)));
