# Install pipenv for mac

1. First install brew

  Links: 
  - https://mac.install.guide/homebrew/3.html
  - https://brew.sh/

2. Then install pipenv
   `brew install pipenv # this automatically installs python 3.11`

# Using pipenv

Goal : create a directory called datascience and a virtual environment with some useful datasci packages

```
mkdir datascience # create directory
cd datascience  # go to directory
pipenv install
pipenv install pandas numpy
pipenv install jupyter
pipenv shell # activate pipenv environment after cd-ing into the directory
pipenv run python file.py
pipenv run jupyter notebook
pipenv uninstall package # uninstalls package and dependencies
pipenv —rm # removes the pipenv environment
pipenv install # to reinstall the env
```


