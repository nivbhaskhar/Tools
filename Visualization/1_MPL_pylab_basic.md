# Matplotlib's (pylab interface) basic commands for line plots

We run through the basic commands in matplotlib (pylab interface) for plotting lines.  
_Reference_ : [Python DataScience Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/), Chapter 4, Simple line plots


```python
import matplotlib as mpl
import matplotlib.pyplot as plt
plt.style.use('classic')
import numpy as np

%matplotlib inline
```

# A simple plot

## Code


```python
fig_first=plt.figure()
plt.plot([1,2,3],[2,4,6])

```




    [<matplotlib.lines.Line2D at 0x10a2927d0>]




![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_5_1.png)


## Adding a semicolon


```python
fig_second=plt.figure()
#semicolon suppresses printing <matplotlib.lines.Line2D at 0x1148c7ed0>]
plt.plot([1,2,3],[2,4,6]);


```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_7_0.png)


# Subplots

## Plotting subplots


```python
fig_third=plt.figure()
#creates a 2 x 3 grid and in the first slot, will plot the following
plt.subplot(2,3,1)
plt.plot([1,2,3],[1,1,1])

#creates a 2 x 3 grid and in the third slot, will plot the following
plt.subplot(2,3,3)
plt.plot([1,2,3],[2,4,6])

#creates a 2 x 3 grid and in the fifth slot, will plot the following
plt.subplot(2,3,5)
plt.plot([1,2,3],[6,4,1]);
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_10_0.png)


## Stateful: Current figure and axes


```python
fig_third=plt.figure()
#creates a 2 x 3 grid and in the first slot, will plot the following
plt.subplot(2,3,1)
plt.plot([1,2,3],[1,1,1])

#plt.gca() gets current axes, plt.gcf() gets current figure
print("First slot - ", end='')
print(f" current axes: {plt.gca()}")

#creates a 2 x 3 grid and in the third slot, will plot the following
plt.subplot(2,3,3)
plt.plot([1,2,3],[2,4,6])
print("Third slot = ", end='')
print(f" current axes: {plt.gca()}")

#creates a 2 x 3 grid and in the fifth slot, will plot the following
plt.subplot(2,3,5)
plt.plot([1,2,3],[6,4,1]);
print("Fifth slot - ", end='')
print(f" current axes: {plt.gca()}")
```

    First slot -  current axes: AxesSubplot(0.125,0.547727;0.227941x0.352273)
    Third slot =  current axes: AxesSubplot(0.672059,0.547727;0.227941x0.352273)
    Fifth slot -  current axes: AxesSubplot(0.398529,0.125;0.227941x0.352273)



![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_12_1.png)


# Multiple plots in a single image


```python
fig_fourth=plt.figure()
plt.plot([1,2,3],[1,2,3]);
plt.plot([1,2,3],[2,2,2]);
plt.plot([1,2,3],[3,2,1]);
plt.plot([2,2,2],[3,2,1]);





```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_14_0.png)


# Colours and line styles


```python
#Different styles of specifying color and line style

fig_fifth=plt.figure()
plt.subplot(2,3,1)
plt.plot([1,2,3,4],[1,1,1,1], color="green", linestyle="dashed", marker="*")

plt.subplot(2,3,3)
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o')

plt.subplot(2,3,4)
plt.plot([1,2,3],[6,4,1], color="cyan", linestyle="solid");


plt.subplot(2,3,6)
plt.plot([1,2,3],[10,8,6], "-.y");
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_16_0.png)


## For more options


```python
help(plt.plot)
```

# Axes display

## Axes limits


```python
fig_sixth=plt.figure()
plt.subplot(2,1,1)
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o')

# Setting x limits from -5 to 5 and y limits from -10 to 10
plt.subplot(2,1,2)
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o')
plt.xlim(-5,5)
plt.ylim(-10,10);


#Introduces proper spacing between subplots
fig_sixth.tight_layout()


```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_21_0.png)


## Reversing axes


```python
fig_seventh = plt.figure()
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o')
plt.xlim(5,-5)
plt.ylim(-10,10);
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_23_0.png)


## Using plt.axis()

### Instead of x_lim and y_lim


```python
fig_eighth = plt.figure()
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o');
#plt.axis([x_min, x_max, y_min, y_max])
plt.axis([-5,5,-10,10]);
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_26_0.png)


### Making one unit of x = one unit of y


```python
fig_ninth = plt.figure()
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o');
plt.axis('equal');
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_28_0.png)


### Tighten bounds on plot


```python
fig_tenth = plt.figure()
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o')
plt.axis('tight');
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_30_0.png)


### For more options


```python
help(plt.axis)
```

# Labels

## Labelling a single graph


```python
fig_eleventh = plt.figure()
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o')
plt.axis([-5,5,-8,8])
plt.title("Here is a title")
plt.xlabel("X axis")
plt.ylabel("Y axis");
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_35_0.png)


## Turn off x, y axes


```python
fig_twelfth = plt.figure()
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o')
plt.axis([-5,5,-8,8])
plt.title("Here is a title")
plt.xlabel("X axis")
plt.ylabel("Y axis")
plt.axis(False);
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_37_0.png)


## Labelling multiple graphs



```python
fig_thirteenth = plt.figure()
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o', label="red line")
plt.plot([0,1,2,3],[2,2,2,2], color="g", linestyle="--", marker='*', label="green line")
plt.title("Here is a title")
plt.xlabel("X axis")
plt.ylabel("Y axis")
plt.legend();
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_39_0.png)


## Fancier options


```python
fig_fourteenth=plt.figure()
plt.plot([0,1,2,3],[0,2,4,6], color="r", linestyle=":", marker='o', label="red line")
plt.plot([0,1,2,3],[2,2,2,2], color="g", linestyle="--", marker='*', label="green line")
plt.title("Here is a title")
plt.xlabel("X axis")
plt.ylabel("Y axis")
plt.legend(fancybox=True, shadow=True)
fig_fourteenth.tight_layout();
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_41_0.png)


## Labelling subplots 


```python
fig_fourteenth=plt.figure()
#creates a 2 x 3 grid and in the first slot, will plot the following
plt.subplot(2,3,1)
plt.plot([1,2,3],[1,1,1], color="r", linestyle=":", marker='o', label="red line")
plt.legend(loc='upper center', bbox_to_anchor=(0.5, 1.05),
          ncol=3, fancybox=True, shadow=True)

#creates a 2 x 3 grid and in the third slot, will plot the following
plt.subplot(2,3,3)
plt.plot([1,2,3],[2,4,6], color="g", linestyle="--", marker='*', label="green line")
plt.legend(loc='upper center', bbox_to_anchor=(0.5, 1.05),
          ncol=3, fancybox=True, shadow=True)

#creates a 2 x 3 grid and in the fifth slot, will plot the following
plt.subplot(2,3,5)
plt.plot([1,2,3],[6,4,1], color="b", linestyle="-", marker='^', label="blue line")
plt.legend(loc='upper center', bbox_to_anchor=(0.5, 1.05),
          ncol=3, fancybox=True, shadow=True);
```


![png](1_MPL_pylab_basic_files/1_MPL_pylab_basic_43_0.png)

