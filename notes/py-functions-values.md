# Function Values
Did you ever accidentally forget to add `()` after a function?
Get strange errors?
```python
name = input
print(name)  # <built-in function input>
```

Turns out functions are just values that you can store in variables too!
Then call them later!

This gives a generic way to perform an operation.
```python
def add_one(x):
  return x + 1

def add_five(x):
  return x + 5

def add_two_then_do_something(y, func):
  return 2 + func(y)

add_two_then_do_something(1, add_one)  # 4
add_two_then_do_something(1, add_five)  # 8
```

As of now, you should _avoid making your functions to take in other functions as arguments_.
Mostly, it's better to make separate functions than taking in one as an argument:
```python
def add_two_then_add_one(x):
  return x + 2 + 1

def add_two_then_add_five(x):
  return x + 2 + 5

add_two_then_add_one(1, add_one)  # 4
add_two_then_add_five(1, add_five)  # 8
```
