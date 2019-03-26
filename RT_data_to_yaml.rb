require 'yaml'

ruby_talks_data = {
  :presubs => [
    [/\bdont\b/, "don't"],
    ["youre", "you're"],
    [/\bur\b/, "your"]
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
    'i like *'      => [
                        "Why do you like *?",
                        "Wow! I like * too!"
                       ]
  }
}

puts ruby_talks_data.to_yaml

f = File.open(ARGV.first || 'RT_data', "w")
f.puts ruby_talks_data.to_yaml
f.close