require_relative "search_missed_interval/version"
require_relative "search_missed_interval/app.rb"

module SearchMissedInterval
  class Error < StandardError; end
    def self.call
      App.new.start 
    end
end

SearchMissedInterval.call
