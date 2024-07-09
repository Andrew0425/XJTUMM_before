with open(r"E:\2023美赛\word.txt") as f:
    word=f.read()
for i in range(3):
    X1=word[5*i]
    X2=word[5*i+1]
    X3=word[5*i+2]
    X4=word[5*i+3]
    X5=word[5*i+4]
    X=X1+X2+X3+X4+X5
    print(X)
'''    for x in range(97,123):
        if word.count(chr(x))>1:
            print(X,':',word.count(chr(x)))
'''
