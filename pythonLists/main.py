# use '#' instead of // like other coding lang for same purpose.
cars1 = ["Ford", "Volvo", "BMW"] # array - creates a list of cars

# check https://www.w3schools.com/python/python_arrays.asp for array func

# note: python does not have 'arrays' by technicality, can use lists to take func - will refer as 'arrays' in my case

x = cars1[0] # create an x variable and assign the first item in the cars array to it 

print(x) # prints x 

user3 = "human3" # creates a variable and assign it a value
users = ["human1", "human2", user3] # new array 

for y in users:  
  print(y)

users.append("human4") # .append is an add method to an array
print(users[3]) 

print("removed list")
users.pop(2) # .pop is a remove method to an array, in this case, removes the third item in the array

users.remove("human1") #.remove is also a remove method to an array, in this case, will remove the item with 'human1' - only the first occurance of 'human1' - i.e one will be removed, not all

for y in users:  
  print(y) # check list again, result human2 + human4


# cars func examples

# car2 func
# A function that returns the 'year' value:
def funcCar2(e):
  return e['year']

cars2 = [
  {'car': 'Ford', 'year': 2005},
  {'car': 'Mitsubishi', 'year': 2000},
  {'car': 'BMW', 'year': 2019},
  {'car': 'VW', 'year': 2011}
]

cars2.sort(key=funcCar2)

print(cars2)

# car3 func
# a functon that returns the length of a value
def funcCar3(e):
  return len(e)

cars3 = ['Ford', 'Mitsubishi', 'BMW', 'VW']

cars3.sort(reverse=True, key=funcCar3)

print(cars3)



