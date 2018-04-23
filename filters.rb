# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # Your code Here
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end
  nil
end

def experienced?(candidate)
  # Your code Here
  if candidate[:years_of_experience] >= 2
    return true
  else
    return false
  end
end

def recent?(candidate)
  date = Date.parse(candidate[:date_applied])
  today = Date.today
  if (today - date) <= 15
    return true
  else 
    return false
  end 
end

def language?(candidate)
  if (candidate[:languages].include?("ruby") || candidate[:languages].include?("python"))
    return true
  else 
    return false
  end
end


def qualified_candidates(candidates)
  # Your code Here
  output = []
  candidates.each do |candidate|
    if experienced?(candidate) && candidate[:github_points] >= 100 && language?(candidate) && recent?(candidate)
      output << candidate
  end
  return output
end

# More methods will go below
def ordered_by_qualifications(candidates)
  myArray = candidates
  #first sort by github points
  myArray.sort! { |a, b|  a[:github_points] <=> b[:github_points] }
  #sort by experience
  myArray.sort! { |a, b|  a[:years_of_experience] <=> b[:years_of_experience] }

  return myArray
end

  