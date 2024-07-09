from sklearn.metrics import accuracy_score
from sklearn.metrics import mean_squared_error
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split

# 将数据分为训练集和测试集，用来测试模型分类正确率
df = pd.read_excel(r'E:/2023美赛/Q32.xlsx', sheet_name = "Sheet1")
train_set, test = train_test_split(deepcopy(df), test_size = 0.2, random_state = 42)

def train(k=1):

	# 创建分类器
    clf = KNeighborsClassifier(n_neighbors=5)
    
	# 训练数据
    clf.fit(train_set[train_set.columns[:-1]], train_set['y'])
    
	# 测试数据
    test_predictions = clf.predict(test[test.columns[:-1]])
    print('Accuracy:', accuracy_score(test['y'], test_predictions))
    print('MSE:', mean_squared_error(test['y'], test_predictions))
    
    # 预测数据，绘图
    for i, fig in enumerate([('#87CEEB', '.'), ('orange', 'x')]):
    	
	    spots = pd.DataFrame(np.take(bg_spots, np.where(clf.predict(bg_spots) == i)[0], axis=0))
	    
	    plt.scatter(spots[0], spots[1], s=0.2, marker=fig[1], color=fig[0])
    
