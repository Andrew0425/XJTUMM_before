import numpy as np
import random as rd
import matplotlib.pyplot

def LD(X, Y):
    m = len(X)
    n = len(Y)
    LD = np.zeros(shape=(m+1, 2))
    for i in range(m+1):
        LD[i, 0] = i
    for j in range(1, n+1):
        LD[0, 1] = j
        for i in range(1, m+1):
            if X[i-1] == Y[j-1]:
                LD[i, 1] = LD[i-1, 0]
            else:
                LD[i, 1] = 1+min(LD[i-1, 0], LD[i-1, 1], LD[i, 0])
        for i in range(m+1):
            LD[i, 0] = LD[i, 1]
    return LD[m, 1]


def GLD(X, Y, k):
    return (2*LD(X, Y))/(k*(len(X)+len(Y))+LD(X, Y))


def RAND(time):  # 随机字符串
    a = ''
    values = ['A', 'T', 'C', 'G']
    for i in range(time):
        a += rd.choice(values)
    return a


def RC(A, times):  # 随机修改times个碱基
    for i in range(times):
        m = rd.randint(1, len(A)-1)
        if A[m] == 'A':
            A = A[:m]+rd.choice(['T', 'C', 'G'])+A[m+1:]
        elif A[m] == 'T':
            A = A[:m]+rd.choice(['A', 'C', 'G'])+A[m+1:]
        elif A[m] == 'C':
            A = A[:m]+rd.choice(['T', 'A', 'G'])+A[m+1:]
        else:
            A = A[:m]+rd.choice(['T', 'C', 'A'])+A[m+1:]
    return A


def RD(A, times):  # 随机删除times个碱基
    for i in range(times):
        m = rd.randint(1, len(A))
        A = A[:m]+A[m+1:]
    return A


def RA(A, times):  # 随机增加times个字符
    for i in range(times):
        m = rd.randint(1, len(A))
        A = A[:m]+rd.choice(['A', 'T', 'C', 'G'])+A[m:]
    return A


# X = RAND(3000);
# Y = RC(X,60);
# Y = RD(Y,45);
# Y = RA(Y,45);
# print('>01')
# print(X);
# print('>02')
# print(Y);
# A = [];
# for i in range(130,172,2):
#      A.append(GLD(X,Y,i/100))
# print(A)
# A = [0.03650094398993078, 0.03595784252944823, 0.0354306658521686, 0.034918723660445516, 0.034421364985163204, 0.03393797542422469, 0.03346797461050202, 0.033010813887307915, 0.03256597417181359, 0.03213296398891967, 0.03171131765992345, 0.03130059363194819, 0.03090037293553543, 0.03051025775907417, 0.03012987012987013, 0.029758850692662903, 0.02939685757729346, 0.02904356534802203, 0.028698664027709056, 0.028361858190709046, 0.02803286611889802]
# B = []
# for i in range(21):
#     B.append(1-(abs(A[i]-0.029)/0.029))
# print(B)
# matplotlib.pyplot.plot(range(130,172,2),B);
# matplotlib.pyplot.scatter(range(130,172,2),B);
# matplotlib.pyplot.show()
# K = []
# for i in range(1200,3200,200):
#     n = int(i/100)
#     X = RAND(i)
#     Y = RC(X,n);
#     Y = RD(Y,2*n);
#     Y = RA(Y,2*n);

#     K.append(GLD(X,Y,1.6))
# print(K)

# k = [0.029758850692662903, 0.029469980206729713, 0.030011542901115813, 0.030095759233926128, 0.02985993535477913, 0.029942633272701833, 0.030011542901115813, 0.030069847283059073, 0.029036515618125824, 0.028949799815214044]
# mega = [0.03,0.03,0.031,0.031,0.03,0.03,0.031,0.031,0.03,0.03]
# A = [0.99196169,0.982332674,0.968114287,0.940492476,0.995331178,0.965891396,0.968114287,0.939682728,0.967883854,0.964993327]
# matplotlib.pyplot.plot(range(1200,3200,200),A)
# matplotlib.pyplot.show()
# matplotlib.pyplot.plot(range(1200,3200,200),k)
# matplotlib.pyplot.plot(range(1200,3200,200),mega)
# matplotlib.pyplot.show()

ch = [0.025,0.05,0.075,0.1,0.125,0.15,0.175]
AA = [0.838461538,0.947545013,1,0.776712329,0.65754717,0.63994656,0.6375]
matplotlib.pyplot.plot(ch,AA);
matplotlib.pyplot.show();
