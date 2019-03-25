require 'yaml'
require_relative 'wordplay'

class RubyTalks
  attr_reader :name

  def initialize(options)
    @name = options[:name] || "Unnamed Talker"
    begin
      @data = YAML.load(File.read(options[:data_file]))
    rescue
      raise "Can't load data file"
    end
  end

  def greeting
    random_response :greeting
  end

  def farewell
    random_response :farewell
  end

  private

  def random_response(key)
    random_index = rand(@data[:responses][key].length)
    @data[:responses][key][random_index].gsub(/\[name\]/, @name)
  end
end