# Basic commands in Pandas - creation of Pandas objects

We run through the basic commands in pandas for creating and working with series, dataframes, index objects

Reference : [Python DataScience Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/), Chapter 3, Introducing Pandas Objects


```python
import pandas as pd
```

# Series

## Creating a Series


```python
#Creating a series from a list
series_1 = pd.Series([2,4,6,8])
series_1
```




    0    2
    1    4
    2    6
    3    8
    dtype: int64




```python
#Creating a series from a list and specifying indices
series_2 = pd.Series([2,4,6,8], index = ['a', 'b', 'c', 'd'])
series_2
```




    a    2
    b    4
    c    6
    d    8
    dtype: int64




```python
#Creating a series from a dictionary
series_3 = pd.Series({'e': 2, 'f': 4, 'g': 6, 'h': 8})
series_3
```




    e    2
    f    4
    g    6
    h    8
    dtype: int64




```python
#Creating a series from part of a dictionary
series_4 = pd.Series({'e': 2, 'f': 4, 'g': 6, 'h': 8}, index = ['g', 'h'])
series_4
```




    g    6
    h    8
    dtype: int64




```python
#Creating a constant value series
series_5 = pd.Series('c', index=[1,3,5,7])
series_5
```




    1    c
    3    c
    5    c
    7    c
    dtype: object



## Accessing data from a series


```python
# Accessing an element from a series
series_1[1], series_2['a'], series_2.iloc[0], series_4.loc['g']
```




    (4, 2, 2, 6)




```python
#All values of a series
series_3.values, type(series_3.values)
```




    (array([2, 4, 6, 8]), numpy.ndarray)




```python
#Indices of a series
series_3.index, type(series_3.index)
```




    (Index(['e', 'f', 'g', 'h'], dtype='object'), pandas.core.indexes.base.Index)




```python
#Slice of a series
series_3[['e', 'f']], type(series_3[['e', 'f']])
```




    (e    2
     f    4
     dtype: int64,
     pandas.core.series.Series)




```python
#Slice of a series
series_3[0:3], type(series_3[0:2])
```




    (e    2
     f    4
     g    6
     dtype: int64,
     pandas.core.series.Series)




```python
#Slice of a series
series_3['e':'g'], type(series_3['e':'g'])
```




    (e    2
     f    4
     g    6
     dtype: int64,
     pandas.core.series.Series)



# Index


```python
a = pd.Series([1,3,5,7], index=[0,3,2,1])
b = pd.Series([10, 'a', 'b'], index = [1, 'A', 'B'])
```


```python
#Index objects of series
a.index, b.index
```




    (Int64Index([0, 3, 2, 1], dtype='int64'), Index([1, 'A', 'B'], dtype='object'))




```python
#Shape and type of index object
a.index.size, a.index.shape, a.index.ndim, a.index.dtype

```




    (4, (4,), 1, dtype('int64'))



## Index object as an ordered set


```python
#Set operations on index objects : intersection, union, symmetric difference
a.index & b.index, a.index | b.index, a.index ^ b.index
```




    (Index([1], dtype='object'),
     Index([0, 1, 2, 3, 'A', 'B'], dtype='object'),
     Index([0, 2, 3, 'A', 'B'], dtype='object'))




```python
#Set operations as methods of index objects
a.index.intersection(b.index),a.index.union(b.index),a.index.symmetric_difference(b.index)
```




    (Index([1], dtype='object'),
     Index([0, 1, 2, 3, 'A', 'B'], dtype='object'),
     Index([0, 2, 3, 'A', 'B'], dtype='object'))



## Index object as an immutable array

Immutable because you cannot modify an index value .. a.index[0] = 'something_else' will give an error


```python
#Array operations
a.index, a.index[:-1], a.index[[1,2]], a.index[0::2]
```




    (Int64Index([0, 3, 2, 1], dtype='int64'),
     Int64Index([0, 3, 2], dtype='int64'),
     Int64Index([3, 2], dtype='int64'),
     Int64Index([0, 2], dtype='int64'))



# DataFrames

## Creating a DataFrame


```python
#Creating an empty dataframe
column_names_1 = ["A","B", "C","D"]
row_names_1 = ['name','place','animal', 'thing']
df_1 = pd.DataFrame(columns = column_names_1, index = row_names_1)
df_1
```





<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>A</th>
      <th>B</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>name</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>place</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>animal</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>thing</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Creating a dataframe from a list of lists/2-d numpy arrays
df_2 = pd.DataFrame([[1,2,3,4],[5,6,7,8]], columns = ['c1', 'c2', 'c3', 'c4'], index = ['cat', 'dog'])
df_2
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
      <th>c1</th>
      <th>c2</th>
      <th>c3</th>
      <th>c4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>cat</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
    </tr>
    <tr>
      <th>dog</th>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Creating a dataframe from a dictionary of series objects
series_a = pd.Series([23,45,231,21], index = ['X', 'Y', 'Z', 'W'])
series_b = pd.Series([12,15,31,43], index = ['X', 'Y', 'c', 'd'])

df_3 = pd.DataFrame({'a_series': series_a,
              'b_series': series_b})
df_3
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
      <th>a_series</th>
      <th>b_series</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>W</th>
      <td>21.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>X</th>
      <td>23.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>Y</th>
      <td>45.0</td>
      <td>15.0</td>
    </tr>
    <tr>
      <th>Z</th>
      <td>231.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>c</th>
      <td>NaN</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>d</th>
      <td>NaN</td>
      <td>43.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Creating a dataframe from a dictionary of dictionaries
dict_a = {'X':23, 'Y':45, 'Z':231, 'W':21}
dict_b = {'X': 12, 'Y': 15, 'c': 31, 'd':43}

df_4 = pd.DataFrame({'a_dict': series_a,
              'b_dict': series_b})
df_4
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
      <th>a_dict</th>
      <th>b_dict</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>W</th>
      <td>21.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>X</th>
      <td>23.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>Y</th>
      <td>45.0</td>
      <td>15.0</td>
    </tr>
    <tr>
      <th>Z</th>
      <td>231.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>c</th>
      <td>NaN</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>d</th>
      <td>NaN</td>
      <td>43.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Creating a dataframe from a list of series objects
series_a = pd.Series([23,45,231,21], index = ['X', 'Y', 'Z', 'W'])
series_b = pd.Series([12,15,31,43], index = ['X', 'Y', 'c', 'd'])

df_5 = pd.DataFrame([series_a,series_b])
df_5
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
      <th>X</th>
      <th>Y</th>
      <th>Z</th>
      <th>W</th>
      <th>c</th>
      <th>d</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>23.0</td>
      <td>45.0</td>
      <td>231.0</td>
      <td>21.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>12.0</td>
      <td>15.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>31.0</td>
      <td>43.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Creating a dataframe from a list of dictionaries
dict_a = {'X':23, 'Y':45, 'Z':231, 'W':21}
dict_b = {'X': 12, 'Y': 15, 'c': 31, 'd':43}

df_6 = pd.DataFrame([dict_a,dict_b])
df_6
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
      <th>X</th>
      <th>Y</th>
      <th>Z</th>
      <th>W</th>
      <th>c</th>
      <th>d</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>23</td>
      <td>45</td>
      <td>231.0</td>
      <td>21.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>12</td>
      <td>15</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>31.0</td>
      <td>43.0</td>
    </tr>
  </tbody>
</table>
</div>



## Getting columns and row names 


```python
new_df.columns
```




    Index(['A', 'B', 'C', 'D'], dtype='object')




```python
type(new_df.columns)
```




    pandas.core.indexes.base.Index




```python
new_df.index
```




    Int64Index([1, 2, 3, 4, 5, 6], dtype='int64')




```python
type(new_df.index)
```




    pandas.core.indexes.numeric.Int64Index



## Accessing and adding entries to a cell in the dataframe


```python
new_df.loc[2,'C'] = '2+C'
```


```python
new_df
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
      <th>A</th>
      <th>B</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>new_a</td>
      <td>new_b</td>
      <td>new_c</td>
      <td>new_d</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>q</td>
      <td>2+C</td>
      <td>new_f</td>
    </tr>
    <tr>
      <th>3</th>
      <td>c</td>
      <td>r</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>d</td>
      <td>s</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>e</td>
      <td>t</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>new_g</td>
    </tr>
  </tbody>
</table>
</div>




```python
new_df.loc[3,'D']
```




    nan



## Adding entries to a column in the dataframe


```python
new_df['A'] = ['1+a', '2+a', '3+a','4+a', '5+a', '6+a']
```


```python
new_df['B'] = pd.Series(['1+b', '2+b', '3+b', '4+b', '5+b', '6+B'], index=[1,2,3,4,5,6])
```


```python
new_df
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
      <th>A</th>
      <th>B</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>a</td>
      <td>p</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>q</td>
      <td>something</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>c</td>
      <td>r</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>d</td>
      <td>s</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>e</td>
      <td>t</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>f</td>
      <td>u</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



## Adding entries to a row in the dataframe


```python
new_df.loc[1] = ['new_a +1', 'new_b + 1', 'new_c + 1', 'new_d+1']
```


```python
new_df.loc[2, -2:] = ['new_c+2', 'new_d+2']
```


```python
new_df.loc[6] = pd.Series('new_g', index=['D'])
```


```python
new_df
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
      <th>A</th>
      <th>B</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>new_a</td>
      <td>new_b</td>
      <td>new_c</td>
      <td>new_d</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>q</td>
      <td>new_e</td>
      <td>new_f</td>
    </tr>
    <tr>
      <th>3</th>
      <td>c</td>
      <td>r</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>d</td>
      <td>s</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>e</td>
      <td>t</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>new_g</td>
    </tr>
  </tbody>
</table>
</div>



## Accessing multiple entries in the dataframe


```python
new_df.loc[:, 'A']
```




    1    new_a
    2        b
    3        c
    4        d
    5        e
    6      NaN
    Name: A, dtype: object




```python
new_df.loc[[1,2], ['A']]
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
      <th>A</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>new_a</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
    </tr>
  </tbody>
</table>
</div>




```python
new_df.iloc[:, 1]
```




    1    new_b
    2        q
    3        r
    4        s
    5        t
    6      NaN
    Name: B, dtype: object




```python
new_df.iloc[1:3, 2:4]
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
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2</th>
      <td>new_e</td>
      <td>new_f</td>
    </tr>
    <tr>
      <th>3</th>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>


