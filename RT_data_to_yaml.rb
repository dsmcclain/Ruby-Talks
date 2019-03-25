require 'yaml'

ruby_talks_data = {
  :presubs => [
    ["dont", "don't"],
    ["youre", "you're"],
    ["ur", "your"]
  ],
  :responses => {
    :default        => [
                        "I don't understand.",
                        "What?",
                        "Huh?"
                      ],
    :greeting       => ["Hi there. I'm [name]. What's happening?"],
    :farewell       => ["Goodbye!"],
    'hello'         => [
                        "How's it going?",
                        "Hi there!"
                       ],
  }
}

puts ruby_talks_data.to_yaml

f = File.open(ARGV.first || 'RT_data', "w")
f.puts ruby_talks_data.to_yaml
f.close