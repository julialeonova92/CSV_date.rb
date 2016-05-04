# CSV_ostruct.rb
require 'ostruct'
require 'csv'
require 'date'
new_hash = OpenStruct.new
movie=CSV.read('movies.txt', { :col_sep => '|' }).map{|hsh| hsh}.map do |row|
	new_hash=OpenStruct.new(:title=>row[1], :year=>row[2], :country=>row[3], :date=>row[4], :genre=>row[5], :longe=>row[6], :rating=>row[7], :director=>row[8], :actor=>row[9])
end 
puts "The five longest movies: \n \n"
puts movie.sort_by{ |hsh| hsh.longe.to_i}.last(5).
	map{|mov| [mov.title + ": " + mov.longe]}
puts "\n"

puts "All of comedy, sorted by release date: \n \n"
puts movie.find_all{ |hsh| hsh.genre.include?("Comedy")}.
	sort_by {|hsh| hsh.date}.
	map{|mov| [mov.title + ": " + mov.genre + ", " + mov.date]}
puts "\n"

puts "The list of the directors in alphabetical order (no repeats!) \n \n"
puts movie.sort_by{|hsh| hsh.director}.map{|dir| dir.director}.uniq
puts "\n"

non_usa=movie.reject{|hsh| hsh.country==("USA")}.size
puts "The number of movies produced not in the USA is: " + non_usa.to_s
puts "\n"

puts "The number of movies grouped by director \n \n"
puts movie.group_by{|hsh| hsh.director}.
	map{|dir, group| ["Director is #{dir}" + ", namber of his movies: #{group.size.to_s}"]}
puts "\n"

puts "The number of movies produced each month \n \n"
puts movie.map{|hsh| Date._parse(hsh.date)}.
	group_by{|k| k[:mon]}.
	map{|mon, group| ["mon: #{mon.to_s}," + " number of movies: #{group.size.to_s}"]}
