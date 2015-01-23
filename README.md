# Tip Calculator

Given a dollar value such as $23.92, calculate the sum of that amount plus a given tip.

We define a grammar as follows:

	S → dollars (+|-) percentage

	dollars → '$' NUMBER 

	percentage → NUMBER '%'


The goal is to be able to read in expressions like '$22.94 + 2%' and calculate the correct dollar value. 

This is easy, although the syntactic sugar of being able to just add percentages is really nice. Also, I should learn how to use parser generators.
