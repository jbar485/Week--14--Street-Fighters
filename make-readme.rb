puts "Create your README.md"
puts "Enter the name of your application"
app_name = gets.chomp
puts "Enter the date of the convert version"
version_date = gets.chomp
puts 'Enter a brief (one sentence or so) description of your application'
brief_description = gets.chomp
puts "Enter the contributors"
contributors = gets.chomp
puts "Enter a detailed description of your application"
detailed_description =gets.chomp
puts "Enter any known bugs"
known_bugs = gets.chomp
puts "Enter any support details or any ways someone could reach you"
support_details = gets.chomp
puts "Enter any technologies used, or highlight any cool features and what went into them"
technologies = gets.chomp
puts "Enter licensing information"
license = gets.chomp


File.open("README.md", "w") { |file| file.puts "# _#{app_name}_

#### _#{brief_description}, #{version_date}_

#### By _**#{contributors}**_

## Description

_#{detailed_description}_

## Specs
| Behavior  | Input  | Output  |
|---|---|---|
|   |   |   |
|   |   |   |
|   |   |   |
|   |   |   |

## Setup/Installation Requirements

* _This is a great place_
* _to list setup instructions_
* _in a simple_
* _easy-to-understand_
* _format_

_{Leave nothing to chance! You want it to be easy for potential users, employers and collaborators to run your app. Do I need to run a server? How should I set up my databases? Is there other code this app depends on?}_

## Known Bugs

_#{known_bugs}_

## Support and contact details

_#{support_details}_

## Technologies Used

_#{technologies}_

### License

*#{license}*

Copyright (c) 2019 **_#{contributors}_**
"}

puts "Your Readme has been created! Remember to add your specs and setup guide"
