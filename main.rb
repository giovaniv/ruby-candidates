# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here

#binding.pry

pp @candidates
pp experienced?(@candidates[0])
pp experienced?(@candidates[1])
pp find(1)                             # find method, should return nil
pp find(5)                             # find method, should return first candidate
pp qualified_candidates(@candidates)   # filter qualified candidates
pp sort_experience_points(@candidates)  # sort by experience and then by github points