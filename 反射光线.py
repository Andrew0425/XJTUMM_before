import pandas as pd
import numpy as np
import math

def nearest_k_points(point, points,k):
    # 计算每个点到给定点的距离
    distances = [(p, math.sqrt((p[0]-point[0])**2 + (p[1]-point[1])**2)) for p in points]
    # 根据距离对列表进行排序
    distances.sort(key=lambda x: x[1])
    # 取出距离最小的3个点的坐标
    return [p[0] for p in distances[:k]]

def main():
    # 输入n个点的坐标
    df = np.array(pd.read_excel('C:/Users/86189/Desktop/2023/T3/001.xlsx',header=0))
    # 输入给定点的坐标
    given_point = (0, 0)
    # # 输入k
    k = 6
    # # 调用函数，输出结果
    # print(nearest_k_points(given_point,df,k))
    Result = []
    re = []
    for i in range(len(df)):
        given_point = df[i]
        '''given_point[2]=4'''
        Fanshe = np.array([0-given_point[0],-200-given_point[1],80-4])
        Fanshe = Fanshe/(np.linalg.norm(Fanshe))
        M = []
        M.append(given_point[0])
        M.append(given_point[1])
        a = nearest_k_points(given_point,df,k)

        M.append(Fanshe[0])
        M.append(Fanshe[1])
        M.append(Fanshe[2])
        M.append(nearest_k_points(given_point,df,k))
        M.append(a[1][0])
        M.append(a[1][1])
        M.append(a[2][0])
        M.append(a[2][1])
        M.append(a[3][0])
        M.append(a[3][1])
        M.append(a[4][0])
        M.append(a[4][1])
        M.append(a[5][0])
        M.append(a[5][1])
        Result.append(M)
    data = pd.DataFrame(Result)
    writer = pd.ExcelWriter('4ceng_001.xlsx')  # 写入Excel文件
    data.to_excel(writer, 'sheet2', )  # ‘page_1’是写入excel的sheet名
    writer.save()

if __name__ == "__main__":
    main()
