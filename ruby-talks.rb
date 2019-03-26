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

  def response_to(input)
    prepared_input = preprocess(input).downcase
    sentence = most_important_sentence(prepared_input)
    responses = possible_responses(sentence)
    responses[rand(responses.length)]
  end

  private

  def preprocess(input)
    perform_substitutions input
  end

  def perform_substitutions(input)
    @data[:presubs].each { |s| input.gsub!(s[0], s[1]) }
    input
  end

  def random_response(key)
    random_index = rand(@data[:responses][key].length)
    @data[:responses][key][random_index].gsub(/\[name\]/, @name)
  end

  def most_important_sentence(input)
    key_words = @data[:responses].keys.select do |k|
      k.class == String && k =~ /^\w+$/
    end

    WordPlay.most_important_sentence(input, key_words)
  end

  def possible_responses(sentence)
    responses = []

    @data[:responses].keys.each do |pattern|
      next unless pattern.is_a?(String)
      if sentence.match('\b' + pattern.gsub(/\*/, '') + '\b')
        if pattern.include?('*')
          responses << @data[:responses][pattern].collect do |phrase|
            puts "phrase is #{phrase}"
            matching_section = sentence.sub(/^.*#{pattern}\s+/, '').chop
            puts "matching section is #{matching_section} end"
            phrase.sub('*', WordPlay.switch_pronouns(matching_section))
          end
        else  
          responses << @data[:responses][pattern]
        end
      end
    end

    responses << @data[:responses][:default] if responses.empty?
    responses.flatten
  end
end