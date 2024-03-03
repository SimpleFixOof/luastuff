# luastuff

- [luastuff](#luastuff)
  - [Printing and commenting](#printing-and-commenting)
  - [Data types](#data-types)
  - [Math](#math)
  - [Strings](#strings)
  - [Conditional statements](#conditional-statements)
  - [Loops](#loops)


## Printing and commenting
```lua
print("Hello World!") -- Print example and comment example
-- print("aaa") -- Printed code

--[[
    Multiline comment example
]]

print("Hello " .. "World!") -- Concat/append in lua
```

## Data types

```lua
--[[
    nil,
    number 1 1.24 0.1 44
    string "hello"
    boolean true false
    table
]]

-- Variable names cannot start with numbers or use dashes

local superVariable123

-- Multiline string

local description = [[
    Interesting
    Wow
]]

-- nil and false are false

c = 20 -- global, should start with a capital letter

_G.Hello = "Hello World!" -- also global definition

type(variable) -- gets the type
```

## Math
```lua
-- string to integer conversion

local str = "22"
local num = tonumber(str)

+, *, / and - -- basic maths
^ -- power
% -- modulo, integer - no 0.33333
math.pi -- pi value
math.random() -- random value
-- to make it actually random
math.randomseed(os.time())

-- min/max value of list
math.min(1,2,3,4,5)

-- round down
math.floor(3.4) -- 3

-- round up
math.ceil(3.4) -- 4

-- sin/cos/tan
math.sin(20)
```

## Strings
```lua
-- normal characters dont exist, even a single letter is a string in lua if we're looking at the variable type

--string length
local str = "aaa"
print(#str)

-- convert integer to string
local x = tostring(22)

-- escape symbols
\n -- newline
\t -- tab
\v -- vertical tab
\\ -- backslash - escapes backslash symbol

-- lowercase/uppercase
string.lower(str)
string.upper(str)

-- length
string.len(str)

-- substring - string, from, to
string.sub(str, 1, 5)

-- ASCII - character, from - to possible
string.char(97)

-- character - ASCII, from - to possible
string.byte("a")

-- repeat
string.rep("?", 10 ",")

-- format
string.format("pi: %.2f\nMy age: %i", math.pi, 18)

-- find gives start and end index
string.find("Hello World", "orl")

-- match
string.match("Hello World", "orl")

-- replace, returns new string and how many times replacement happened
string.gsub("Hello World", "o", "!")
```

## Conditional statements
```lua
--[[
    >
    <
    >=
    <=
    ~= - not equal
    == equal
]]

-- and, or, not
```

## Loops
```lua
```