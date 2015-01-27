# Tip Calculator

Given a dollar value such as $23.92, calculate the sum of that amount plus a given tip.

We define a grammar as follows:

	S → binary_expr
    
    binary_expr → 
        dollars (+|-) percentage
        |
        '(' binary_expr ')' (+|-) percentage

	dollars → '$' NUMBER 

	percentage → NUMBER '%'


This program can read in expressions like '$22.94 + 2%' or '($10 + 1%) + 1%'and calculate the correct dollar value. 

This iterated addition of percentages can also be used to calculate compound interest. For example, you could interpret the cost of the meal as the `dollars` component, and then interpret the `percentage` components as interest.
