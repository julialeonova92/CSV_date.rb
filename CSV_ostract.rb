# CSV_ostruct.rb
require 'ostruct'
require 'csv'
new_hash = OpenStruct.new
movie=CSV.read('movies.txt', { :col_sep => '|' }).map{|hsh| hsh}.map do |row| 
	new_hash=OpenStruct.new(:title=>row[1], :year=>row[2], :country=>row[3], :date=>row[4], :genre=>row[5], :longe=>row[6], :rating=>row[7], :director=>row[8], :actor=>row[9])
end
 
require 'date'
 	puts movie.sort_by{ |hsh| hsh.longe.to_i}.last(5).map{|hsh| [hsh.title + ": " + hsh.longe]}
	puts movie.find_all{ |hsh| hsh.genre.include?("Comedy")}.sort_by {|hsh| hsh.date}.map{|hsh| [hsh.title + ": " + hsh.genre + ", " + hsh.date]} 
	puts "The number of films produced not in the USA is: " + movie.reject{|hsh| hsh.country==("USA")}.size.to_s
	puts movie.group_by{|hsh| hsh.director}.map{|dir, group| ["Director #{dir}" + ", namber of films: #{group.size.to_s}"]}

	 puts movie.map{|hsh| Date._parse(hsh.date)}.group_by{|k| k[:mon]}.map{|dir, group| ["mon: #{dir.to_s}," + " how many films: #{group.size.to_s}"]}
    
