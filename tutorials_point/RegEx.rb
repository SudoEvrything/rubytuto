text = "A regular expression is a sequence of characters that define  a search pattern."
p text.scan(/\b[aeiou][a-z]*\b/) #word starting with vowels
p text.scan(/\b([A-Za-z]+)\b +\b[AEIOUaeiou][a-z]*\b/) #words immediately followed by word starting with vowels
