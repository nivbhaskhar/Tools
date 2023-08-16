# Install pipenv for mac

1. First install brew

   Links: 
   - https://mac.install.guide/homebrew/3.html
   - https://brew.sh/

2. Then install pipenv

   `brew install pipenv # this automatically installs python 3.11`

# Using pipenv

Goal : create a directory called datascience and a virtual environment with some useful datasci packages

## 1. Creating directory + virtual environment with packages
```
mkdir datascience # create directory
cd datascience  # go to directory
pipenv install
pipenv install pandas numpy
pipenv install jupyter
```

## 2. To use the virtual environment

### 2A. Method 1
```
# open new terminal
cd datascience 
pipenv shell # activate pipenv environment after cd-ing into the directory, then use packages from terminal as before
```

### 2B. Method 2
```
cd datascience
pipenv run python file.py # can avoid running pipenv shell first by directly running pipenv run
pipenv run jupyter notebook
```

Note: to quit environment, Ctrl + D

## 3. Uninstalling and reinstalling virtual environment
```
pipenv uninstall package # uninstalls package and dependencies
pipenv —rm # removes the pipenv environment
pipenv install # to reinstall the env
```

# Notes
1. If you do `which python` while in virtual environment, it will give `/Users/../.local/share/virtualenvs/datascience-.../bin/python` while when not in virtual environment, it might be `/usr/local/bin/python` etc
2. pipenv does this by modifying `$PATH` by prepending `/Users/../.local/share/virtualenvs/../bin` when virtual environment is activated within the directory. So we access the `python` and packages located here first


