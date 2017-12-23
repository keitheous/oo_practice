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

*Overriding methods*
You can override methods by redefiniting the same method in the subclass. This is done in SuperHero class as method to_s.


### Exercise 4 : Codebar Workshops and Members

Members
* Two different types of members: Students and Coaches. Both members have full_name attributes.
* Students have a unique *about* attribute.
* Coaches have 2 unique attributes *bio* and *skills*.

Workshops have
* a date
* a venue_name
* coaches, and
* students
* an *add_participant* method that accepts a *member* attribute. If the member is Coach, add them to the coach list. Alternatively, if the member is a Student, add them to the students list.
* a *print_details* method to output the the details of the workshop.
* Create a method to print the workshop details, a method to print out the students and one to print out the coaches. Call these from print_details. Make sure that these methods cannot be invoked from outside the class.

Below is the expected behavior we are expecting:
```
workshop = Workshop.new("12/03/2014", "The Basics of Object Oriented Programming")

jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")
lena = Student.new("Lena Smith", "I am really excited about learning to program!")
vicky = Coach.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")
nicole = Coach.new("Nicole McMillan", "I have been programming for 5 years in Ruby and want to spread the love")
nicole.add_skill("Ruby")

workshop.add_participant(jane)
workshop.add_participant(lena)
workshop.add_participant(vicky)
workshop.add_participant(nicole)
workshop.print_details
#
# Workshop - 12/03/2014 - Venue: Shutl
#
# Students
# 1. Jane Doe - I am trying to learn programming and need some help
# 2. Lena Smith - I am really excited about learning to program!
#
# Coaches
# 1. Vicky Ruby - HTML, JavaScript
#    I want to help people learn coding.
# 2. Nicole McMillan - Ruby
#    I have been programming for 5 years in Ruby and want to spread the love
```


### Exercise 5 : Text based adventure game!

Create a *1) Player*, *2) Location*, & *3) Map class*.

1) Player - should have an arrays of items and location. Start with initialize.

**Task 1 : Viewing location and picking up items**
Sample Hash for location :
```
location = {
  description: "You are in the living-room. A wizard is snoring loudly on the couch.",
  items: ["whiskey", "bucket"]
}
```

Implement these functions:

* *look_around* prints out the description of the location, all the items of a location (*"You see a #{item} on the floor"*)
* *pick_up(item)* removes an item from the *location*, and adds it to *Players*’s *items* array (in this case living_room).

Test scripts that should work up to this point:
```
player = Player.new(location)
player.look_around
player.pick_up("whiskey")
player.look_around
```

**Task 2 : Moving between locations**
* Create map for player to move between *locations* that initialize with a list of locations sampled below and assigns the *current_location* to the first on the list.

sample locations:
```
locations = [{
  name: "living_room",
  description: "You are in the living-room. A wizard is snoring loudly on the couch.",
  items: ["whiskey", "bucket"],
  edges: [{
    direction: "upstairs",
    item: "ladder",
    location: "attic"
  }]
},
{
  name: "attic",
  description: "You are in the attic. There is a giant welding torch in the corner.",
  edges: [{
    direction: "downstairs",
    item: "ladder",
    location: "living_room"
  }]
}]
```

* Implement a *move_to* that receives *direction* param that we want to move to.
 It must find the location connected to the current location with that path. To do that, we need to iterate over the *locations* and then the *edges* of each location, and _return the edge’s location_ if its direction matches the direction we are trying to go towards.

 For instance, referring to the hash above, if your "current_location" is "attic", "move_to" "downstairs" would return "living_room".

* Implement a *describe* method to print out the *description* of the *current_location*. In addition to that, print out the location's available paths.
`puts "There is a #{path[:item]} going #{path[:direction]} from here."`


Test scripts that should work up to this point:
```
map = Map.new(Map::DEFAULT_LOCATIONS)
p 'moving upstairs'
map.move_to("upstairs")
p 'moving dowstairs'
map.move_to("downstairs")
```

**Task 3 : Integrating Map and Player**
* Change *Player* to accept the instance of *Map* when it is initialized (@map).

* *Player* class creates a *location* method that points to *@map.current_location* and a *walk* method that calls for *Map*'s *move_to(direction)*

Test scripts that *would* work up to this point:
```
player = Player.new
player.map.locations
    => [{:name=>"living_room", :description=>"You are in the living-room. A wizard is snoring loudly on the couch.", :items=>["whiskey", "bucket"], :edges=>[{:direction=>"upstairs", :item=>"ladder", :location=>"attic"}]}, {:name=>"attic", :description=>"You are in the attic. There is a giant welding torch in the corner.", :edges=>[{:direction=>"downstairs", :item=>"ladder", :location=>"living_room"}]}]
player.map.current_location
    => {:name=>"living_room", :description=>"You are in the living-room. A wizard is snoring loudly on the couch.", :items=>["whiskey", "bucket"], :edges=>[{:direction=>"upstairs", :item=>"ladder", :location=>"attic"}]}
```


**Task 4 - Loading data**
by requiring [yaml](http://ruby-doc.org/stdlib-2.1.0/libdoc/yaml/rdoc/YAML.html), load this [file](https://gist.github.com/despo/c3ea3f753c0630fea000) and run it on the classes. This has been added to the supplimentary_resources folder.

Test scripts that *would* work up to this point:
```
data = File.read('./supplimentary_resources/adventure.yml')
adventure_map = YAML.load(data)
player = Player.new(adventure_map)
```

**Exception Handling and Homework**
I will work on this at a later time.
