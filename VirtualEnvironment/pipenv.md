# Install pipenv for mac

1. First install brew

   Links: 
   - https://mac.install.guide/homebrew/3.html
   - https://brew.sh/

2. Then install pipenv

   `brew install pipenv # this automatically installs python 3.11`

# Using pipenv

Goal : create a directory called datascience and a virtual environment with some useful datasci packages

## Creating directory + virtual environment with packages
```
mkdir datascience # create directory
cd datascience  # go to directory
pipenv install
pipenv install pandas numpy
pipenv install jupyter
```

## To use the virtual environment

### Method 1
```
# open new terminal
cd datascience 
pipenv shell # activate pipenv environment after cd-ing into the directory, then use packages from terminal as before
```

### Method 2
```
cd datascience
pipenv run python file.py # can avoid running pipenv shell first by directly running pipenv run
pipenv run jupyter notebook
```

Note: to quit environment, Ctrl + D

### Uninstalling and reinstalling virtual environment
```
pipenv uninstall package # uninstalls package and dependencies
pipenv —rm # removes the pipenv environment
pipenv install # to reinstall the env
```


