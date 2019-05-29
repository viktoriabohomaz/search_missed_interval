require_relative 'node'
require_relative 'interval_tree'

require 'set'
class App
  attr_accessor :intervals, :missed_intervals, :min_values, :max_values
  def initialize
    @intervals = []
    @missed_intervals = []
    @min_values = []
    @max_values = []
  end

  def start
    loop do
      puts "Please, enter a command or 'h' for help"
      command = gets.chomp

      case command
      when '1'  
        input_data
      when '2'
        search_unfilled_intervals
      when '3'
        puts 'Bye Bye'
        return 
      when 'hepl', 'h'
        helper_prompt
      else
        puts "Wrong command - #{command}" 
      end
    end
  end

  private

  def helper_prompt
    puts '___________________________________________________'
    puts 'Allowed commands:'
    puts '    1 - Add new intervals (input "end" when all intervals will be entered)'
    puts '    2 - Show not covered by the input intervals'
    puts '    3 - Exit'
  end

  def create_intervals(interval)
    range = interval.scan(/\d+/)
    validate(range)
    new_range = (range.first.to_i..range.last.to_i)
    intervals << new_range
  end
  
  def validate(range)
    puts 'Invalid interval 1' if range.size > 2
    puts 'Invalid interval 2' if range.size < 2
    puts 'Invalid interval 3' if range.first.to_i > range.last.to_i
  end

  def search_unfilled_intervals
    intervals.uniq!
    tree = IntervalTree.new(intervals)
    generate_max_and_mins_values
    find_missed_intervals(tree)
    output_data
  end
  
  def output_data
    missed_intervals.each { |interval| puts interval}  
  end

  def generate_max_and_mins_values
    intervals.each { |i| min_values << i.first }
    intervals.each { |i| max_values << i.last }
    min_values.sort!
    max_values.sort!
  end

  def find_missed_intervals(tree)
    (intervals.size - 1).times do |num|
      next if max_values[num] == min_values[num + 1]
      result = tree.search(max_values[num]..min_values[num + 1])
      missed_intervals << result unless result.nil?
    end   
  end

  def input_data
    loop do
      input = gets.chomp
      case input
      when 'end'
        break
      else 
        create_intervals(input)  
      end
    end
  end
end
