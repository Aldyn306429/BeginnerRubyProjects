# frozen_string_literal: true

def show_image(image_number)
  if image_number == 7
    puts "
          ___________
         |          |
         |          |
         |          |
        / \\
       /   \\
      /     \\
     /       \\
    /         \\
    ===========
    "
  elsif image_number == 6
    puts "
          ___________
         |          |
         |          |
         |          |
        / \\        ( )
       /   \\
      /     \\
     /       \\
    /         \\
    ===========
    "
  elsif image_number == 5
    puts "
          ___________
         |          |
         |          |
         |          |
        / \\        ( )
       /   \\        |
      /     \\
     /       \\
    /         \\
    ===========
    "
  elsif image_number == 4
    puts "
          ___________
         |          |
         |          |
         |          |
        / \\        ( )
       /   \\        |
      /     \\       |
     /       \\
    /         \\
    ===========
    "
  elsif image_number == 3
    puts "
          ___________
         |          |
         |          |
         |          |
        / \\        ( )
       /   \\       /|
      /     \\       |
     /       \\
    /         \\
    ===========
    "
  elsif image_number == 2
    puts "
          ___________
         |          |
         |          |
         |          |
        / \\        ( )
       /   \\       /|\\
      /     \\       |
     /       \\
    /         \\
    ===========
    "
  elsif image_number == 1
    puts "
          ___________
         |          |
         |          |
         |          |
        / \\        ( )
       /   \\       /|\\
      /     \\       |
     /       \\     /
    /         \\
    ===========
    "
  elsif image_number.zero?
    puts "
          ___________
         |          |
         |          |
         |          |
        / \\        ( )
       /   \\       /|\\
      /     \\       |
     /       \\     / \\
    /         \\
    ===========
    "
  end
end