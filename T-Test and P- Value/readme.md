![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Inferential statistics - T-test & P-value

## Part 1

1. *One tailed t-test* - In a packing plant, a machine packs cartons with jars. It is supposed that a new machine will pack faster on the average than the machine currently used. To test that hypothesis, the times it takes each machine to pack ten cartons are recorded. The results, in seconds, are shown in the tables in the file `files_for_lab/ttest_machine.xlsx.`.
   Assume that there is sufficient evidence to conduct the t test, does the data provide sufficient evidence to show if one machine is better than the other?

2. *Matched Pairs Test* - In this challenge we will compare dependent samples of data describing our Pokemon (file `files_for_lab/pokemon.csv`). Our goal is to see whether there is a significant difference between each Pokemon's defense and attack scores. Our hypothesis is that the defense and attack scores are equal. Compare the two columns to see if there is a statistically significant difference between them and comment your result.


# Inferential statistics - ANOVA

Note: The following lab is divided in 2 sections.

## Part 2.1

In this activity, we will look at another example. Your task is to understand the problem and write down all the steps to set up ANOVA. After the next lesson, we will ask you to solve this problem using Python. Here are the steps that you would need to work on:
    - Null hypothesis
    - Alternate hypothesis
    - Level of significance
    - Test statistic
    - P-value
    - F table
    


### Context

In this challenge,we will return to the Pokemon dataset.   We want to understand whether there are significant differences among various types of pokemons' Total value, i.e. Grass vs Poison vs Fire vs Dragon... There are many types of pokemons which makes it a perfect use case for ANOVA. (file `files_for_lab/pokemon.csv`)
First let's obtain the unique values of the pokemon types.
Second we will create a list named pokemon_totals to contain the Total values of each unique type of pokemons.
Third we run ANOVA test on pokemon_totals.


- State the null hypothesis
- State the alternate hypothesis
- What is the significance level
- What are the degrees of freedom of model, error terms, and total DoF



## Part 2.2


- What conclusions can you draw from the experiment and why?
- Interpret the ANOVA test result. Is the difference significant?
