# k-fold cross validation using scikit-learn

Recall that we predicted precipitation from other weather features using a [Decision Tree regressor](https://github.com/nivbhaskhar/Tools/blob/master/scikit-learn/decision_tree_regressor.md). There, we split up the input data into training and test data sets. This meant that the test data set was never used in training at all. In this notebook, we'll use cross validation to more efficiently use the input data for both training and testing.

# The basic idea

The idea is to split up your dataset into k chunks or *folds*. Let's call the folds F_1, F_2, ...F_k. We'll proceed to train k Models (M_1,....M_k) on different training and test-data as follows:

* Train the i-th model M_i on training data comprising of all folds except the i-th fold F_i. 
* Evaluate Model_i on test data = F_i

Thus, for each of the k models M_i, we get a validation error estimate E_i.

We report the k validation error estimates as *cross-validation scores* 


* The average of these error-scores tells us how biased our model is. If the average error is low, this implies our model has low bias.


* The standard deviation of these error-scores tells us how our model's performance varies with the training dataset used. If the standard deviation is high, this means our model has high variance 







# Imports


```python
#imports
import pandas as pd
import matplotlib.pyplot as plt
plt.style.use('classic')
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor
from sklearn.metrics import mean_squared_error


from sklearn.model_selection import cross_val_score
from sklearn.model_selection import cross_val_predict
```

# Weather data from before


```python
col_names = ['date','avgtemp', 'mintemp', 'pp', 'snow', 'wind-dir', 'wind-speed', 'wind-gut', 'air-pressure', 'sunshine', 'dummy']
#Reads the comma separated csv into a pandas dataframe
daily_weather_df =pd.read_csv('KCQT0.csv', sep=',',names=col_names, header = None)
#Delete irrelevant cols
del daily_weather_df['dummy']
del daily_weather_df['air-pressure']
del daily_weather_df['wind-speed']
del daily_weather_df['snow']
del daily_weather_df['wind-dir']
del daily_weather_df['date']
del daily_weather_df['mintemp']
#Delete rows with NaN entries
daily_weather_df.dropna(inplace=True)
```


```python
daily_weather_df.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>avgtemp</th>
      <th>pp</th>
      <th>wind-gut</th>
      <th>sunshine</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>10.4</td>
      <td>13.9</td>
      <td>2.0</td>
      <td>1018.9</td>
    </tr>
    <tr>
      <th>1</th>
      <td>12.0</td>
      <td>15.6</td>
      <td>8.1</td>
      <td>1021.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>11.4</td>
      <td>18.9</td>
      <td>1.3</td>
      <td>1026.5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>12.6</td>
      <td>20.0</td>
      <td>3.0</td>
      <td>1024.9</td>
    </tr>
    <tr>
      <th>4</th>
      <td>13.3</td>
      <td>21.7</td>
      <td>1.9</td>
      <td>1018.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Drop precipitation column to get weather_features
weather_features = daily_weather_df.drop(['pp'], axis=1)
precipitation_labels = daily_weather_df['pp']
```

# Regression tree


```python
tree_reg = DecisionTreeRegressor(max_depth=4)
```

# Cross validation scores

The syntax for computing cross validation scores over k folds is 


```cross_val_score(model, features, labels, scoring=scoring_method, cv=k)```


One thing to note is that the scoring expects a scoring_method/function for which *greater is better* (i.e. it wants to maximize the score). So you should not give it a loss function (for which lesser is better).


We used mean_squared_error as a loss function when we evaluated our Decision Tree regressor one just one training-test split. Here, we'll use *neg_mean_squared_error*, which is just the negative of the mean_squared_error.


Minimizing mean_squared_error is maximizing neg_mean_squared_error



```python
scores = cross_val_score(tree_reg, weather_features, precipitation_labels,
                             scoring="neg_mean_squared_error", cv=5)
```


```python
print(type(scores))
print(scores)
```

    <class 'numpy.ndarray'>
    [-4.21900535 -3.27126449 -3.13457551 -3.14451502 -3.38513429]



```python
scores.mean()
```




    -3.430898932367797




```python
scores.std()
```




    0.40460168118423745



# Comparison to earlier validation-error estimate

The mean squared error on our test-data set from earlier was 3.13. (We reported the root-mean square error to be around 1.77). We see that the average cross validation score is -3.43, or the average mean-square error of test-datasets across the k=5 folds is 3.43.

The cross-validation error gives a much better estimate of the error, as it uses every element in the dataset as a test-input (exactly once in some fold). 

# Predictions

The syntax for cross validation predictions over k folds is 


```cross_val_predict(model, features, labels, cv=k)```

Note that every input datapoint is part of exactly 1 test-data set in exactly one fold. cross_val_predict returns this prediction for every input datapoint when it was part of the test-dataset. 



```python
predictions = cross_val_predict(tree_reg, weather_features, precipitation_labels, cv=5)
```


```python
predictions.shape
```




    (1866,)




```python
predictions[:10]
```




    array([16.495     , 17.51790123, 16.495     , 17.51790123, 17.51790123,
           17.51790123, 17.51790123, 16.495     , 16.495     , 17.51790123])




```python

```
