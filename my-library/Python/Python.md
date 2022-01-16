# What is Python

This is a programming language that lets you work quickly and integrate systems more effectively

## IDE/Editor

- Vim
- PyCharm
- VsCode

## Foundations

- Pythonic : The conventional way to do that task in python
- File I/O : Input and Output
- Python Package Index : a repository of software for program
- Modules
- Python Interpreter
  - a VM that interpretes the code
  - it's input is the instruction sets called bytecode
  - the lexer, parser and compiler generate code objects for the interpreter to work on
- Python standard library
- Testing
  - Using python codes to test codes
- Git/Github
- Dunders
- Iterators/Generators/Decorators
- OOP vs FP
  - object oriented programming
  - Functional programming
- PEP
- Virtual Environments
  - Virtualenv
  - venv default built in python3.3

## Popular Libraries

- Six : for working with python 2/3
- Tkinter : GUI library for python
- PyQt: GUI library
- Requests:
  - Requests is a HTTP library for the Python
  - not in the python standard library
- Pillow: Imaging library for python
- Asyncio

  - helps to write concurrent code using the async/await syntax
    import asyncio

  async def main():
  print("Hello")
  await asyncio.sleep(1)
  print("..., World!")

  asyncio.run(main())

- Pygame: game libraries

## Computer Science

- Algorithms
- Data structures
- Time complexity
- Space complexity

## CI/CD

- Jenkins
- Teamcity

## Python for Web Development

- Popular frameworks
  - flask
  - django
- ASGI vs WSGI

## Test Automation

- Pytest
- selenium
- unnitest

## Scripting

- sys admin
- DevOps
- Software Engineer

# PEP

- Python enhancement proposals
- This is a design doc providing info to the python community.
- PEP should provide a concise technical specification of the feature and a rationale for the feature
- pep8 is the most popular

## Python Language vs Implementation

- language

  - This is the set of rules we need to follow to right the python code
  - The syntax and workflows

- Implementation
  - a program that understands the python code and executes it
  - software that makes the code usable
  - The python software we downloaded from python.org is the python interpreter (CPython)
- Types of python implementations
  - Cpython
  - PyPy: Subset of python
  - Jython: Java
  - IronPython: c#

## How is Python Code Executed

- Computers doesn't understand programing languages (C#, python, Java, etc)
- Computers understand Machine Code
- For example, if we write a code in C, we need to use a C-Compiler to convert it to a MachineCode
  - the machinecode is specific to type of cpu of a computer(Hardware)
  - so a software written in C-language is OS specific cos the cpu of a windows is different to that of mac ( so they will have different machine codes )
- in the case of a Java code

  - Java compiler converts it Java Bytecode which is not OS specific
  - But we stil need a software to convert the Java Bytecode to Machine Code
  - JVM(Java Virtual Machine) converts the Java Bytecode to MachineCode
  - so at runtime, if an OS has jvm, it will convert the Bytecode to MachineCode

- Python Case
  - CPython is the compiler that compiles the python code to Python Bytecode and also it has inbuilt Python VM that interpretes the bytecode to Machine code
  - Jython makes it possible to import java codes in your python code
    Jython compiles into Java Bytecode, uses JVM to convert to machine code

## Typing

- Static
  - c++
  - c#
  - Java
- Dynamic
  - Javascript
  - Ruby
  - Python

## Useful String methods

- capitalize()
- casefold(): converts string into lower case
- center(): returns a centered string
- count(): returns the number of times a specified value occur in a string
- encode(): encodes the string
- endswith(): returns true if the string ends with the specified value
- find(): searches the string for a specified value and returns the position of where it was found
- split(): splits the string at the specified sperator

## Arithmetic operators

- -
- -
- -
- /
- // : division result no remainder
- % : remainder of a division
- \*\* : to the power of
- x += 1 : increments value of x by 1

## f - formatted string literals

- These are expressions evaluated at runtime
- we use it to get the value of a variable at runtime, so that way we change the value of the variable at one location only in our code

name = "Fidelis"
print(f"His name is {name}")

## Debugging Python code

- F9/ fn + F9: inserts a break point
- F5: to run the app up to the break point
- F10: to run the code line by line
- F11: to jump into a function we defined
- shift + F5: To stop the debugger

## VSCode Coding Tricks

- Windows

  - Press end key to move cursor to the end of the line
  - Press home key to move cursor to the begginning of the line
  - alt + up/down keys to move texts from line to line
  - shift + alt + down to duplicate lines
  - to comment multiple lines, ctrl + /

- Mac
  - Press fn + right arrow to move cursor to the end of the line
  - Press fn + left arrow to move cursor to the end of the line
  - option + up/down keys to move texts from line to line
  - shift + option + down to duplicate lines
  - to comment multiple lines, command key + /

## Data Structure

- Lists
  - []: defines a list
  - list of numbers, strings and lists
  - [[1, 3, 4], [2, 3]]
  - zeroes = [0] \* 100
  - letters = ["a", "b"]
  - combined = zeroes + letters
  - numbers = list(range(20))
  - chars = list("hELLO World")
  - print(len(chars))
  - list unpacking
    numbers = [1,2 ,3 4]
    first, \*other, last = numbers
    print(first)
    print(other)
  - Adding or removing Items in a list
    - ADD
      letters.append()
      letters.insert(0, "")
    - Remove
      letters.pop(): remove item at the end of the list
      letters.pop(0): remove item at the given index 0
      letters.remove("")
      del letters[0:3]
      letters.clear()
  - Find Items in list
    - if d in letters:
    - use the count function to get the n0 of times an item occured
    - we can use the index function
  - Sort items
    - numbers.sort(reverse=True)
    - numbers.sorted(reverse=True)

## Lambda Functions

- This is useful when we use a function as an argument to another function
- For example
  items = [
  ("Product1", 10),
  ("Product2", 9),
  ("Product3", 12),
  ]

<!-- items.sort(key=lambda item:item[1])  This is the lambda function  -->

print(items)

## Map Functions
