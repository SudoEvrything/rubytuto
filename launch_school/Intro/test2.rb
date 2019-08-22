family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

siblings = family.select { |k,v| (k == :sisters) || (k == :brothers)}
p family[:uncles][1]

t = Time.new(2008, 7, 4)
t.monday?
t.friday?

def test(b)
	b.map! { |letter| "I like the letter: #{letter}"}
end
a = ['a', 'b', 'c']
test(a)