h = 3
bounce = 0.66
window = 1.5
counter = -1
rebounce = window
# “if” is just the requirement of the code to return -1 in case the first jump doesnt
# meet the window
if window > h * bounce
  puts -1
else
  until window > rebounce
    rebounce = h * bounce
    counter += 2
    h = rebounce.round(2)
    # just introduced the puts to double check the new height and count of bounces
    puts h
  end
  # will be replaced with return in codewars pust just to visualize the solution
  puts counter
end