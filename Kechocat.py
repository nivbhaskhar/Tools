import sys
print(' '.join(sys.argv[1:]))
try:
  while True:
    print(input())
except EOFError:
  pass
