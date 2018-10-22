#37810 Assignment 2_Yi Jin

#assign variable car
cars = 100
#assign variable space_in_a_car
space_in_a_car = 4.0
#assign variable drivers
drivers = 30
#assign variable passengers
passengers = 90
#assign variable cars_not_driven by minus car by drivers
cars_not_driven = cars - drivers
#assign variable cars_driven which is equal to drivers
cars_driven = drivers
#assign variable carpool_capacity by multiplying cars_driven and space_in_a_car
carpool_capacity = cars_driven * space_in_a_car
#assign variable average_passengers_per_car by dividing passengers by cars_driven
average_passengers_per_car = passengers / cars_driven

#print sentences and variables
print("There are", cars, "cars available.")
#print sentences and variables
print("There are only", drivers, "drivers available.")
#print sentences and variables
print("There will be", cars_not_driven, "empty cars today.")
#print sentences and variables
print("We can transport", carpool_capacity, "people today.")
#print sentences and variables
print("We have", passengers, "to carpool today.")
#print sentences and variables
print("We need to put about", average_passengers_per_car,"in each car.")

print("Study Drills")
print("There is an error because we haven't defined the variable, i.e. we haven't assigned values to car_pool_capacity.")

print("(1) It is not nessary. If it is 4, the type of variables space_in_a_car and carpool_capacity will be floating point.")
