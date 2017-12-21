# oo_practice
personal practice exercise while on vacation from [codebar](http://tutorials.codebar.io/ruby/lesson4/tutorial.html)

### Exercise 1 : Celsius to Fahrenheit

Celsius class that takes temperature as parameter which is then converted into Fabrenheit.

* Use an initialize method to create
* Use conversion formula **frahrenheit = celsius * 1.8 + 32**
* Use the **round** method

Sample Input/Output :
```
Mon | 16 degrees C  | 61 degrees F
Tue | 17 degrees C  | 63 degrees F
Wed | 18 degrees C  | 64 degrees F
Thu | 18 degrees C  | 64 degrees F
Fri | 21 degrees C  | 70 degrees F
Sat | 16 degrees C  | 61 degrees F
Sun | 19 degrees C  | 66 degrees F
```

_instead of prompting (gets.chomp) for user to enter these values, I will be using ARGV._


### Exercise 2 : Tutorial difficulty level

Create object with the following information:
* name
* type
* difficulty

The difficulty of each tutorial MUST be defined as symbols and the ranging values are:
* :easy,
* :medium,
* :hard,
* :advanced, and
* :expert.

Other important instructions:
```
In the Tutorial class create a method called is_harder_than? that takes in
another tutorial as a parameter and returns true if parent tutorial’s difficulty
level is higher than the tutorial passed in a parameter and false if the
difficulty level is lower. This only happens if the tutorial types are the same.

Alternatively, it outputs You cannot compare a Ruby with a JavaScript tutorial
where Ruby and JavaScript are the types of the given tutorials.
```

The output should look like this:
```
tutorial1 = Tutorial.new("Object Oriented Ruby", :ruby, :medium)
tutorial2 = Tutorial.new("Introduction to JavaScript", :javascript, :easy)
tutorial3 = Tutorial.new("HTTP Requests, AJAX and APIs", :javascript, :medium)

tutorial1.is_harder_than?(tutorial2)
# You cannot compare a Ruby with a JavaScript tutorial

tutorial2.is_harder_than?(tutorial1)
# You cannot compare a JavaScript with a Ruby tutorial

tutorial2.is_harder_than?(tutorial3)
# false

tutorial3.is_harder_than?(tutorial2)
# true
```

### Exercise 3 : Inheritance - a Superhero person

This is a code along exercise rather than one I would have to figure out on my own.

Inheritance is a way for classes to inherit or get features from another parent
class. Just like how you would inherit some D.N.A genes from your parents, a child
class can inherit functions or features from a parent class.

This makes creating a program much easier when functionality needs to be shared between
objects. In the example that we are about to do in _ex3_inheritance_superhero_person_,
which contains a Person and a SuperHero class, Not everyone is a Super Hero, but all Super Heros are People(a person).
