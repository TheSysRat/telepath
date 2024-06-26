# [About](#about)
### Telepath - custom wordlist generator using templates. Telepath is "Mentalist" on steroids...just simple, lightweight bash script! You can use it for generating by your own templates or single custom oneround customization wordlist. Let's play RedTeamers !!

<picture>
 <img src="/Pics/telepath.png">
</picture>

# Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Template usages](#batch-processing)
  - [Single Round Options](#single-round-options)
- [Credits](#credits)
- [About](#about)
- [License](#license)

# [Installation](#installation)

To install this script, simply download it and make it executable:
```
git clone https://github.com/TheSysRat/telepath
cd telepath
chmod +x telepath.sh
./telepath.sh -h
```

# [Template usages](#batch-processing)

## Basics usage >>>

```
./telepath.sh -i [input_wordlist] -p [template_file] -o [output_file]
```
### Template options >>

```
b=[string]  -  add prepend string
e=[string]  -  add append string
l=true      -  convert all string in basic wordlist to lowercase
u=true      -  convert all string in basic wordlist to uppercase
s=[number]  -  morfology of chars
```

### -s parametr options :
```
1  :   Change 'a' to '@' and 'A' to '@'
2  :   Change 'e' to '3' and 'E' to '3'
3  :   Change 'i' to '1' and 'I' to '1'
4  :   Change 'i' to '!' and 'I' to '!'
5  :   Change 'o' to '0' and 'O' to '0'
6  :   Change 's' to '5' and 'S' to '5'
7  :   Change 'c' to '(' and 'C' to '('
8  :   Change 'b' to '8' and 'B' to '8'
9  :   Change 'a' to '4' and 'A' to '4'
0  :   Change 'l' to '1' and 'L' to '1'
```

## Template example >> 
### Prapare your basic dictionary by Cewl,Cewler etc. >
```
cat input.txt >>

helloworld
testttest
mypassword
thisisnotmypassword
```
### Create own template as you will >
```
cat temptate.txt >>

b=123 e=@@@
u b=123
l b=000
s=1234567890
```
### Create your custom dictionary >
```
./telepath.sh -i input.txt -p template.txt -o output.txt
```
```
cat output.txt >>

123HelloWorld@@@
123TestTTest@@@
123Mypassword@@@
123ThisISnotMYpassword@@@
123HELLOWORLD
123TESTTTEST
123MYPASSWORD
123THISISNOTMYPASSWORD
000helloworld
000testttest
000mypassword
000thisisnotmypassword
H3110W0r1d
T35tTT35t
Myp@55w0rd
Th1515n0tMYp@55w0rd
```
### NOTE: Check example in example folder ;-), or just run >
```
./telepath.sh -i ./Example/input.txt -p ./Example/template.txt -o output.txt && cat output.txt
```

# [Single Round Options](#single-round-options)

## Basic usage >>>

```
./telepath.sh -i <input_file> [-b <begin_string>] [-e <end_string>] -o <output_file> [-l] [-u] [-s <special_operations>] [-h]

```
### Options >>
```
-i <input_file>: Specify the input file.
-b <begin_string>: String to prepend to each line.
-e <end_string>: String to append to each line.
-o <output_file>: Specify the output file.
-l: Convert lines to lowercase.
-u: Convert lines to uppercase.

-s <special_operations>: Perform special operations:
1: Change 'a' to '@' and 'A' to '@'
2: Change 'e' to '3' and 'E' to '3'
3: Change 'i' to '1' and 'I' to '1'
4: Change 'i' to '!' and 'I' to '!'
5: Change 'o' to '0' and 'O' to '0'
6: Change 's' to '5' and 'S' to '5'
7: Change 'c' to '(' and 'C' to '('
8: Change 'b' to '8' and 'B' to '8'
9: Change 'a' to '4' and 'A' to '4'
0: Change 'l' to '1' and 'L' to '1'

-h: Display help message.
```
### Example >>
```
./telepath.sh -i input.txt -b "Start: " -e " :End" -o output.txt -l -s 123
```

# [Credits](#credits)

[LinkedIn - profile](https://www.linkedin.com/in/thesysrat/)

[Web-Page: www.thesysrat.com](https://thesysrat.com/)

[Blog: www.thesysrat.com/blog/](https://thesysrat.com/blog/)

[HackTheBox - profile](https://app.hackthebox.com/profile/1298347)

[TryHackMe - profile](https://tryhackme.com/p/TheSysRat)

# [License](#license)
This project is licensed under the MIT License. 
