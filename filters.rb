# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  my_candidate = @candidates.select { |person| person[:id] == id }
  if my_candidate == nil
    return nil
  else
    return my_candidate
  end
end

def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    true
  else
    false
  end
end

def qualified_candidates(candidates)
  experienced = criteria(candidates, :years_of_experience, ' ', '>= 2')
  points = criteria(experienced, :github_points, ' ', '> 100')
  ruby = criteria(points, :languages, '.include?', '"Ruby"')
  python = criteria(ruby, :languages, '.include?', '"Python"')
  over_age = criteria(python, :age, ' ', '> 17')
  last_15_days = criteria(over_age, :date_applied, ' ', '> 15.day.ago.to_date' )
  return last_15_days
end

def sort_experience_points(candidates)
  return candidates.sort_by{ |t| [ t[:years_of_experience], t[:github_points] ] }.reverse
end

# More methods will go below

def criteria(data, field, cond1, cond2)
  my_select = "data.select { |item| item[:#{field}]#{cond1} #{cond2} }"
  return eval(my_select)
end
