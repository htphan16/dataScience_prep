'''Problem 1(a). Pig Latin.
In "Pig Latin", English words are transformed according to the following rules:
If the word begins with one or more consonants, those consonants are moved to the end of the word, followed by "ay":
pig -> igpay
Latin -> Atinlay
trash -> ashtray
If the word begins with "qu", both of these letters are moved to the end of the word, followed by "ay":
quarter -> arterquay
If the word begins with a vowel, it is followed by "yay":
apple -> appleyay
out -> outyay.
Note that more than one consonant may be moved to the end of the word. Note also that "y" functions as a consonant at the start of words. 
Note also that capitalization should be preserved after manipulating the word.
Write Python code that takes a word and converts it to Pig Latin. If the input consists of multiple words or contains punctuation, 
your code should print a suitable error message.
We want you to solve this problem from "first principles," using what you learned about strings in lesson 5. 
Do not use the re module or other regular expressions in this problem.
'''
import string
import csv

def pigLatin(word):
	for c in string.punctuation:
		if c in word or ' ' in word:
			return 'Not a word. Please retry'
	if word[0].lower() in ['a','e','u','i','o']:
		new_word = word + 'yay'
	elif word[0:2] == 'qu':
		new_word = word[2:] + 'quay'
	else:
		i = 0
		cons = ''
		while word[i].lower() not in ['a','e','u','i','o']:
			cons = cons + word[i].lower()
			i = i + 1
		new_word = word[i:] + cons + 'ay'
			
	if word[0].isupper():
		new_word = new_word.capitalize()
	return new_word

print(pigLatin('pig'))
print(pigLatin('trash'))
print(pigLatin('Latin'))
print(pigLatin('apple'))
print(pigLatin('out'))
print(pigLatin('ou-t'))
print(pigLatin('ou t'))
print(pigLatin('o u t'))
print(pigLatin('ou?t'))
print(pigLatin('ou`t'))
print(pigLatin('ou*t'))
print(pigLatin('Tree'))
print(pigLatin('Math is the best'))
print(pigLatin('Math'))


'''Problem 1(b). Test Suite.
Test your code on the following words, and be sure your output matches what is shown on the right hand side of each arrow. 
Print the results of each test. If your output does not match, then fix your code in 1(a).
* orange -> orangeyay
* yellow -> ellowyay
* Strip -> Ipstray
* quarter -> arterquay
* schmooze -> oozeschmay
* a -> ayay
* Pig Latin -> (should produce an error message)
* Ke$ha -> (should produce an error message)
'''
print(pigLatin('orange'))
print(pigLatin('yellow'))
print(pigLatin('Strip'))
print(pigLatin('quarter'))
print(pigLatin('schmooze'))
print(pigLatin('a'))
print(pigLatin('Pig Latin'))
print(pigLatin('Ke$ha'))

'''Problem 2(a). Letter Frequencies.
The files encryptedA.txt and encryptedB.txt contain two different encrypted messages on similar topics. 
One message was originally in English and one was in Welsh.
Write Python code that reads a text file into memory and creates a dictionary object with a frequency count for each letter. 
For example, for encryptedA.txt, your output should contain the key:value pairs 'a': 78 and 'b': 31. 
Do not distinguish between uppercase and lowercase letters, and ignore punctuation. 
If a given letter does not appear in the text, there should be a key:value pair with value 0.
Use Python to determine which letter has the highest frequency in each text file, and print the result.
'''

def freq_dict(filename):
	file = open(filename, 'r')
	data = file.read()
	freq_dict = {}
	for letter in string.ascii_lowercase:
		freq = data.count(letter)
		freq_dict[letter] = freq
	return freq_dict
	file.close()
	
freqEnglish = freq_dict('encryptedA.txt')
freqWelsh = freq_dict('encryptedB.txt')


'''Problem 2(b). Formatting for R.
Write your dictionaries with frequency counts to .csv files, with one column for the key and one column for the frequency counted.
'''

def to_csv(filename, original):
	with open(filename, 'w', newline='') as csvfile:
		fieldnames = string.ascii_lowercase
		writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
		writer.writeheader()
		writer.writerow(original)

to_csv('freqEnglish.csv', freqEnglish)
to_csv('freqWelsh.csv', freqWelsh)


