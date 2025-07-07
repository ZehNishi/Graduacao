import pandas as pd
import numpy as np

train_data_all = pd.read_csv('train.csv')
test_data_all = pd.read_csv('test.csv')

train_data = train_data_all.copy()
test_data = test_data_all.copy()

train_data = train_data.drop(['Name'], axis=1)
test_data = test_data.drop(['Name'], axis=1)

train_data = pd.get_dummies(train_data, columns=['HomePlanet'], drop_first=False)
test_data = pd.get_dummies(test_data, columns=['HomePlanet'], drop_first=False)

train_data = pd.get_dummies(train_data, columns=['Destination'], drop_first=False)
test_data = pd.get_dummies(test_data, columns=['Destination'], drop_first=False)


train_data['CryoSleep'] = train_data['CryoSleep'].astype(bool)
test_data['CryoSleep'] = test_data['CryoSleep'].astype(bool)

train_data['VIP'] = train_data['VIP'].astype(bool)
test_data['VIP'] = test_data['VIP'].astype(bool)


train_data[['Deck', 'Num', 'Side']] = train_data['Cabin'].str.split('/', expand=True)
test_data[['Deck', 'Num', 'Side']] = test_data['Cabin'].str.split('/', expand=True)

train_data = train_data.drop(columns=['Cabin'])
test_data = test_data.drop(columns=['Cabin'])

train_data = pd.get_dummies(train_data, columns=['Deck', 'Side'], drop_first=False)
test_data = pd.get_dummies(test_data, columns=['Deck', 'Side'], drop_first=False)

train_data['Num'] = train_data['Num'].astype(float)
test_data['Num'] = test_data['Num'].astype(float)

cols = [col for col in train_data.columns if col != 'Transported'] + ['Transported']
train_data = train_data[cols]

from sklearn.impute import SimpleImputer

imputer = SimpleImputer(strategy='median')

train_data['Age'] = imputer.fit_transform(train_data[['Age']])
train_data['RoomService'] = imputer.fit_transform(train_data[['RoomService']])
train_data['FoodCourt'] = imputer.fit_transform(train_data[['FoodCourt']])
train_data['ShoppingMall'] = imputer.fit_transform(train_data[['ShoppingMall']])
train_data['Spa'] = imputer.fit_transform(train_data[['Spa']])
train_data['VRDeck'] = imputer.fit_transform(train_data[['VRDeck']])
train_data['Num'] = imputer.fit_transform(train_data[['Num']])

test_data['Age'] = imputer.fit_transform(test_data[['Age']])
test_data['RoomService'] = imputer.fit_transform(test_data[['RoomService']])
test_data['FoodCourt'] = imputer.fit_transform(test_data[['FoodCourt']])
test_data['ShoppingMall'] = imputer.fit_transform(test_data[['ShoppingMall']])
test_data['Spa'] = imputer.fit_transform(test_data[['Spa']])
test_data['VRDeck'] = imputer.fit_transform(test_data[['VRDeck']])
test_data['Num'] = imputer.fit_transform(test_data[['Num']])

X_train = train_data.drop(columns=['Transported'])
y_train = train_data['Transported']

X_test = test_data.copy()

from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier, AdaBoostClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.neural_network import MLPClassifier

# Logistic Regression
logistic_model = LogisticRegression(max_iter=10000)
logistic_model.fit(X_train, y_train)
y_pred_logistic = logistic_model.predict(X_test)
output_logistic = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_logistic})
output_logistic.to_csv('logistic_regression_predictions.csv', index=False)

# SVM
svm_model = SVC()
svm_model.fit(X_train, y_train)
y_pred_svm = svm_model.predict(X_test)
output_svm = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_svm})
output_svm.to_csv('svm_predictions.csv', index=False)

# Decision Tree
decision_tree_model = DecisionTreeClassifier(max_depth=5)
decision_tree_model.fit(X_train, y_train)
y_pred_tree = decision_tree_model.predict(X_test)
output_tree = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_tree})
output_tree.to_csv('decision_tree_predictions.csv', index=False)

# Random Forest
random_forest_model = RandomForestClassifier(n_estimators=100, max_depth=5)
random_forest_model.fit(X_train, y_train)
y_pred_rf = random_forest_model.predict(X_test)
output_rf = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_rf})
output_rf.to_csv('random_forest_predictions.csv', index=False)

# Gradient Boosting
gb_model = GradientBoostingClassifier(n_estimators=100)
gb_model.fit(X_train, y_train)
y_pred_gb = gb_model.predict(X_test)
output_gb = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_gb})
output_gb.to_csv('gradient_boosting_predictions.csv', index=False)

# AdaBoost
adaboost_model = AdaBoostClassifier(n_estimators=50)
adaboost_model.fit(X_train, y_train)
y_pred_ab = adaboost_model.predict(X_test)
output_ab = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_ab})
output_ab.to_csv('adaboost_predictions.csv', index=False)

# K-Nearest Neighbors
knn_model = KNeighborsClassifier(n_neighbors=5)
knn_model.fit(X_train, y_train)
y_pred_knn = knn_model.predict(X_test)
output_knn = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_knn})
output_knn.to_csv('knn_predictions.csv', index=False)

# Naive Bayes
nb_model = GaussianNB()
nb_model.fit(X_train, y_train)
y_pred_nb = nb_model.predict(X_test)
output_nb = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_nb})
output_nb.to_csv('naive_bayes_predictions.csv', index=False)

# Neural Network
mlp_model = MLPClassifier(hidden_layer_sizes=(100,), max_iter=1000)
mlp_model.fit(X_train, y_train)
y_pred_mlp = mlp_model.predict(X_test)
output_mlp = pd.DataFrame({'PassengerId': test_data['PassengerId'], 'Transported': y_pred_mlp})
output_mlp.to_csv('mlp_predictions.csv', index=False)


