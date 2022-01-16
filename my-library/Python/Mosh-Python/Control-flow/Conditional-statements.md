- these are statements that sets to a boolean expression
- temp = 35
  if temp > 30:

- multiple conditions we use elif

## Ternary operators

message = "a" if condition else "b"

## Logical operators

- and
- or
- not : converts the value of a boolean
- they are short circuit

## Chaining comparison operators

if 18 <= age < 65:
print("Eligible")

## For loops

- we use loop to create a repetitve task
- we can have nested loops

## Iterables

- the range function is iterable
- strings are also iterable
- lists are also iterable
- you can also create custom objects that are iterable
  for item in shopping_cart:
  print(item)

## While loop

- repeat a task as long as a condition is met
- you can set infinite loops with while
  while True:

## Functions

- start with def
- def greet():

- difference btw parameter and argument is

  - parameter is the key
  - argument is the value

- Types of functions

  - functions that perform a task
  - functions that return a value

- We can use functions to have multiple parameters

  - iterable parameters can be specified using
    - func(\*numbers)
  - multiple params in dictionary
    - user_details(\*\*user)

- local variables and params are within the function
- global variables are accessible anywhere in the code
- always avoid modifying global variables to use as a local variable in a function
