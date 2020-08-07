# TF-IDF using scikit-learn


```python
#imports
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer
from sklearn.feature_extraction.text import TfidfVectorizer
```

# What is TF-IDF ? 

You are given a collection of documents. Let N be the number of documents and _d_ be a particular document in the collection. Let _w_ be a word in the vocabulary list for the collection of documents.

* Choices for __term-frequency__ *tf(w,d)*:
  - _f(w,d)_ = number of times w appears in d (__sublinear_tf = False__, default setting in scikit-learn)
  - log(1 + _f(w,d)_ ) (__sublinear_tf= True__)
  

Let __document-frequency__ *df(w)* = the number of documents in which _w_ occurs

* Choices for __inverse-document-frequency__ *idf(w)*:
  - log(N/df(w)) + 1 (__smooth_idf=False__)
  - log(N+1/df(w)+1) + 1 (__smooth_idf= True__, default setting in scikit-learn) <br>
    (Imagine adding an extra document to the collection which contains every word in the vocabulary list)
    
    
* Then __tf-idf__ of _w_ in _d_ is given to be *tf-idf(w,d) = tf(w,d) x idf(w)* if *w* occurs in *d*
* __tf-idf__ of _w_ in _d_ is 0 is *w* does not occur in *d*
* The __tf-idf__ of _d_ is the vector of  __tf-idf__  of the words in the vocabulary list with respect to d
* Sci-kit-learn normalizes the __tf-idf__ of every document _d_ so that it has unit 1 norm <br>
  (__norm = 'l2'__ default setting in scikit-learn, __norm = 'l1'__, __norm=None__)

# Goal : Understand the scikit-learn syntax for finding TF-IDF

Let's find the tf-idf representation of the simple list_of_documents given below using two methods

* CountVectorizer + TfidfTranformer
* TfidfVectorizer 




```python
#Running example
list_of_documents = ["There are four words", 
                     "are there ? " ,
                     "are there, are there ?" ,
                     "four four four are there"]
```

# Count Vectorizer


```python
my_count_vectorizer = CountVectorizer()
count_sparse_array = my_count_vectorizer.fit_transform(list_of_documents)
```


```python
vocabulary = my_count_vectorizer.get_feature_names()
vocabulary
```




    ['are', 'four', 'there', 'words']




```python
print(my_count_vectorizer.vocabulary_.get('there'))
print(my_count_vectorizer.vocabulary_.get('fifth_word'))
```

    2
    None



```python
print(type(count_sparse_array))
print(count_sparse_array)
count_sparse_array
```

    <class 'scipy.sparse.csr.csr_matrix'>
      (0, 2)	1
      (0, 0)	1
      (0, 1)	1
      (0, 3)	1
      (1, 2)	1
      (1, 0)	1
      (2, 2)	2
      (2, 0)	2
      (3, 2)	1
      (3, 0)	1
      (3, 1)	3





    <4x4 sparse matrix of type '<class 'numpy.int64'>'
    	with 11 stored elements in Compressed Sparse Row format>




```python
count_array = count_sparse_array.toarray()
count_array
```




    array([[1, 1, 1, 1],
           [1, 0, 1, 0],
           [2, 0, 2, 0],
           [1, 3, 1, 0]])



# Tf-idf Tranformer


```python
my_transformer = TfidfTransformer(sublinear_tf = False, smooth_idf=False, norm=None)
```


```python
tfidf_from_sparse_count_array = my_transformer.fit_transform(count_sparse_array)
tfidf_from_count_array = my_transformer.fit_transform(count_array)
```


```python
print(type(tfidf_from_sparse_count_array), type(tfidf_from_sparse_count_array))
#Checking equality of these two tfidfs
print(f"Number of unequal entries in these two tfidfs is {(tfidf_from_sparse_count_array != tfidf_from_count_array).nnz}")
```

    <class 'scipy.sparse.csr.csr_matrix'> <class 'scipy.sparse.csr.csr_matrix'>
    Number of unequal entries in these two tfidfs is 0



```python
idf = my_transformer.idf_
print(type(idf), idf.shape)
print(idf)
```

    <class 'numpy.ndarray'> (4,)
    [1.         1.69314718 1.         2.38629436]



```python
count_array
```




    array([[1, 1, 1, 1],
           [1, 0, 1, 0],
           [2, 0, 2, 0],
           [1, 3, 1, 0]])




```python
tfidf_from_count_array.toarray()
```




    array([[1.        , 1.69314718, 1.        , 2.38629436],
           [1.        , 0.        , 1.        , 0.        ],
           [2.        , 0.        , 2.        , 0.        ],
           [1.        , 5.07944154, 1.        , 0.        ]])



# Tf-idf Vectorizer

It basically is like combining CountVectorizer and TfidfTranformer into one step. You can customize it using the same parameters as above. You can also use the idf, get_feature_names() to extract the idf of words and the vocabular list


```python
my_vectorizer = TfidfVectorizer(sublinear_tf = False, smooth_idf=False, norm=None)
```


```python
second_tfidf = my_vectorizer.fit_transform(list_of_documents)
```


```python
print(type(second_tfidf))
print(second_tfidf)
```

    <class 'scipy.sparse.csr.csr_matrix'>
      (0, 3)	2.386294361119891
      (0, 1)	1.6931471805599454
      (0, 0)	1.0
      (0, 2)	1.0
      (1, 0)	1.0
      (1, 2)	1.0
      (2, 0)	2.0
      (2, 2)	2.0
      (3, 1)	5.079441541679836
      (3, 0)	1.0
      (3, 2)	1.0



```python
second_vocabulary = my_vectorizer.get_feature_names()
print(second_vocabulary)
second_idf = my_vectorizer.idf_
print(type(second_idf), second_idf.shape)
print(second_idf)
```

    ['are', 'four', 'there', 'words']
    <class 'numpy.ndarray'> (4,)
    [1.         1.69314718 1.         2.38629436]



```python
second_tfidf.toarray()
```




    array([[1.        , 1.69314718, 1.        , 2.38629436],
           [1.        , 0.        , 1.        , 0.        ],
           [2.        , 0.        , 2.        , 0.        ],
           [1.        , 5.07944154, 1.        , 0.        ]])




```python

```
