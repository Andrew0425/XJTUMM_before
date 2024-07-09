
def lcs(str1, str2, dp):
    len1 = len(str1)
    len2 = len(str2)

    for i in range(1, len1+1):                           # dp表第一行和第一列元素为0，所以i和j要从1开始，到最后一个元素len1+1
        for j in range(1, len2+1):
            if str1[i-1] == str2[j-1]:                   # i=1时字符串从a[0]开始
                dp[i][j] = dp[i-1][j-1] + 1
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
 
    return dp[len1][len2]                                # dp表右下角最后一个元素为最长公共子序列长度
 
"""
计算具体的公共子序列
"""
def getlcs(str1, str2, dp):
    i = len(str1)
    j = len(str2)
    res = " "
 
    while(i != 0 and j != 0):                            # 两个字符串最后一个元素相等的话，选择一个字符串中的元素添加到res=" "中
        if(str1[i-1] == str2[j-1]):
            res += str1[i-1]
            i -= 1
            j -= 1
        else:
            if(dp[i][j] == dp[i-1][j]):                  # dp[i][j]从左边来还是从上边来
                i -= 1
            else:
                j -= 1
 
    return res[::-1]                                     # res是从右往左的字符串，所以要逆序将其输出为从左往右的字符串
 
# str1 = 'ATTGCA'
# str2 = 'ATCGA'

# lenA = len(str1)
# lenB = len(str2)
 
# dp = [[0 for i in range(lenB+1)] for j in range(lenA+1)] # 生成一个行为lenB+1，宽为lenA+1的二维数组
 
# length = lcs(str1, str2, dp)
# print("最长公共子序列长度为：", length) 
# res = getlcs(str1, str2, dp)
# print("最长公共子序列为：", res)



def DQ(X,Y):
    m = len(X);
    n = len(Y)

    x = 0;
    x0 = 0;
    y = 0;
    y0 = 0;
    length = lcs(X,Y,[[0 for i in range(n+1)] for j in range(m+1)]);
    res = getlcs(X,Y,[[0 for i in range(n+1)] for j in range(m+1)]);
    res1 = res
    ires = 0;
    for i in range(length):
        index = res[i];
        while X[x] != index:
            x+=1;
            print(x)
        while Y[y] != index:
            y+=1;
            print(y)
        while x < y:
            X = X[:x]+'Y'+X[x:];
            x+=1;
        while x > y:
            Y = Y[:y]+'Y'+Y[y:];
            y+=1;
        d = y-y0-1;
        while d != 0:
            res1 = res1[:ires]+'Y'+res1[ires:];
            ires += 1;
            d -= 1;
        x0 = x;
        y0 = y;
        x+=1;
        y+=1;
    return X,Y,res1;

X = 'ATTGCA'
Y = 'ATCGCAA'
print(DQ(X,Y));
