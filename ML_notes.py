Regression
k - NN
SVM
k Means
Mean Shift
###################################################
Naive bayes
NLP
Decision Forest
###################################################
Neural Networks
Boltzmann machines
Auto encoders
###################################################

# Libraries
import pandas as pd  # ==> Needed for working with dataframes
import quandl  # ==> get dataframes from the internet
import math
import datetime
import numpy as np  # ==> Needed for working with arrays
# ==> Preparing the data for training algorithms
from sklearn import preprocessing, model_selection, svm
# ==> Load the linear regression algorithm
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt  # ==> Needed for plotting
from matplotlib import style
import pickle  # ==> Needed to save the classifier once it's fitted, to save time

###################################################
# get data from quandl
df = quandl.get('WIKI/GOOGL')

###################################################
# Create in -> out data
forecast_col = "Adj. Close"
forecast_out = int(math.ceil(0.01 * len(df)))
df['label'] = df[forecast_col].shift(-forecast_out)

X = np.array(df.drop(['label'], 1))
X = preprocessing.scale(X)
X = X[:-forecast_out]
X_lately = X[-forecast_out:]
df.dropna(inplace=True)
y = np.array(df['label'])
###################################################
# Make the split between train/test
X_train, X_test, y_train, y_test = model_selection.train_test_split(
    X, y, test_size=0.2)
###################################################
# create the classifier and fit it
clf = LinearRegression(n_jobs=-1)  # clf = svm.SVR(kernel='poly')
clf.fit(X_train, y_train)
###################################################
# export the classifier
with open('linear_regression.pickle', 'wb') as f:
    pickle.dump(clf, f)
###################################################
# import the classifier
pickle_in = open('linear_regression.pickle', 'rb')
clf = pickle.load(pickle_in)
###################################################
# checking the accuracy
accuracy = clf.score(X_test, y_test)
print(accuracy)
###################################################
# Make a prediction
forecast_set = clf.predict(X_lately)
print(forecast_set, accuracy, forecast_out)
###################################################
# Create a graph
df['Forecast'] = np.nan
last_day = df.iloc[-1].name
last_unix = last_day.timestamp()
one_day = 86400
next_unix = last_unix + one_day

for i in forecast_set:
    next_date = datetime.datetime.fromtimestamp(next_unix)
    next_unix += one_day
    df.loc[next_date] = [np.nan for _ in range(len(df.columns) - 1)] + [i]

df['Adj. Close'].plot()
df['Forecast'].plot()
plt.legend(loc=4)
plt.xlabel('Date')
plt.ylabel('Price')
plt.show()
###################################################
# making the splitting between for training and data for testing
from sklearn import preprocessing, model_selection, neighbors
    ratings_train, ratings_test, position_train, position_test = sklearn.model_selection.train_test_split(
        ratings_ar, position_ar, test_size=0.2)
###################################################
# Creating the k-NN classifier tool
knn_tool = sklearn.neighbors.KNeighborsClassifier()
###################################################
# Fitting the prepared data
knn_tool.fit(ratings_train, position_train)
###################################################
# Getting the accuracy after the classification done
accuracy = knn_tool.score(ratings_test, position_test)
print(f'Accuracy is: {accuracy*100} %')
###################################################
# Checking the model with an example
example_ratings = example_ratings.reshape(len(example_ratings), -1)
predictions = knn_tool.predict(example_ratings)
for i in range(len(example_ratings)):
    print(f'{example_names[i, 1]} was predicted {predictions[i]}, he is actually {example_names[i, 0]}')
###################################################
# SVM
it's a binary classifier
cvxopt module for optimizatio
inner product is the same with dot product
x1 = np.array([1, 2, 3])
x2 = np.array([2, 1, 3])
np.dot(x1, x2)
np.inner(x1, x2)
###################################################
# Tensor Flow
Hi level API: Keras
mnist - is a dataset that contains a 28x28 pixels images of handwritten digits 0-9
# importing TensorFlow
import tensorflow as tf
# Getting the data
mnist = tf.keras.dataset.mnist
# splitting the data into train and test
(x_train, y_train), (x_test, y_test) = mnist.load_data()
# Normalize the numbers (0-255)
x_train = tf.keras.utils.normalize(x_train, axis=1)
x_test = tf.keras.utils.normalize(x_test, axis=1)

# Create the model ( there are 2 types of models, sequential is the most common one)
model = tf.keras.models.Sequential()
# Adding layers (we need to flatten the data) ;
# Input layer
model.add(tf.keras.layers.Flatten())
# hidden layer : 128 neurons in the layer, the activation function ( what it's going to make the neuron fire)
model.add(tf.keras.layers.Dense(128, activation=tf.nn.relu))
model.add(tf.keras.layers.Dense(128, activation=tf.nn.relu)) # second hidden layer
model.add(tf.keras.layers.Dense(10, activation=tf.nn.softmax)) # output layer

# parameters for training the model ; the optimizer: the most complex part of the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])
# binary_categorical_crossentropy
# metrics: what do we wanna track
model.fit(x_train, y_train, epochs=3)

# Calculate the validation loss and the validation accuracy
val_loss, val_accuracy = model.evaluate(x_test, y_test)
print(val_loss, val_accuracy)

# Save the model
model.save('my_model')
# Import the model
new_model = tf.keras.models.load_model('my_model')
# Make a prediction: the output is an array if lots of results
predictions = new_model.predict([x_test])
# to see the result:
import numpy as np
print(np.argmax(predictions[0]))

# see with matplotlib
import matplotlib.pyplot as plt
plt.imshow(x_test[0], cmap=plt.cm.binary)
plt.show()

# Convolutional NN
# Load an outside dataset: cats and dogs
import cv2 ( pip install opencv-python)
IS AN ARTIFICIAL NEURON NETWORK USED FOR IMAGE ANALYSIS/DATA ANALYSIS/CLASSIFICATION PROBLEMS
Adding layers:
1.
model = keras.model.Sequential([Dense(5, input_shape(3,), activation='relu')])
2.
model = keras.model.Sequential()
model.add(Dense(5, input_shape(3,)))
model.add(Activation('relu'))