# CSV_ostruct.rb
require 'ostruct'
require 'csv'
new_hash = OpenStruct.new
movie=CSV.read('movies.txt', { :col_sep => '|' }).map{|hsh| hsh}.map do |row| 
	new_hash=OpenStruct.new(:title=>row[1], :year=>row[2], :country=>row[3], :date=>row[4], :genre=>row[5], :longe=>row[6], :rating=>row[7], :director=>row[8], :actor=>row[9])
end
 
 	p movie.sort_by { |new_hash| new_hash.longe.to_i}.map{|new_hash| new_hash.longe}.last(5) 
	p movie.find_all{ |hsh| hsh[:genre].include?("Comedy")}.sort_by {|hsh| hsh[:date]}.map { |hsh| hsh[:title] } 
	p movie.reject{|hsh| hsh[:country]==("USA")}.size 
  p movie.group_by{|hsh| hsh[:director]}.map{|dir, group| [dir, group.size]}
  p movie.map{|hsh| Date._parse(hsh[:date])}.group_by{|k| k[:mon]}.map{|dir, group| [dir, group.size]}
    
