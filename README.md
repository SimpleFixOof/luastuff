

Based on:

[Steve's teacher - Full Lua Programming Crash Course - Beginner to Advanced](https://youtu.be/1srFmjt1Ib0?si=Zmektywkjj52tqsT)

[Lua.org](https://www.lua.org)

Self experience
 



- [Printing and commenting](#printing-and-commenting)
- [Data types](#data-types)
- [Math](#math)
- [Strings](#strings)
- [Conditional statements](#conditional-statements)
- [Loops](#loops)
- [User input](#user-input)
- [Tables](#tables)
- [Functions](#functions)
- [Co-Routines](#co-routines)
- [Files](#files)
- [OS module](#os-module)
- [Modules](#modules)
- [OOP (Object Oriented Programming)](#oop-object-oriented-programming)
- [Metamethods](#metamethods)
- [Using "classes" in lua](#using-classes-in-lua)
- [Try Catch in lua](#try-catch-in-lua)
- [Using C api](#using-c-api)


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
if something then
    ...
elseif somethingElse then
    ...
else
    ...
end

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
-- Loop up
for i = 1, 100, 1 do
    print(i)
end

-- Loop down
for i = 1, 100, -1 do
    print(i)
end

-- Loop array
local arr = {1,2,3,4,5,6}

for i = 1, #arr do
    print(arr[i])
end

-- While
local count = 10

while count > 0 do
    print(count)
    count = count - 1
end

-- Repeat until something happens, basically runs at least once compared to while
local x = 1
repeat
    print(x)
    x = x + 1
until x > 10
```

## User input
```lua
local value = io.read()
```

## Tables
```lua
-- Table - container for values
local arr = {1, 2, 3}
print(arr) -- returns table:0x553 something, this is table address in ram

-- to print the table values use index, indexes in lua start from 1
print(arr[1])

-- Sorting, function on how to sort is also passable
table.sort(arr)

-- Insert
table.insert(arr, index, 1)

-- Remove
table.remove(arr, index)

-- Concatenate
local arr = {"a", "b", "c"}
table.concat(arr, " ") -- printing results in "a b c"

-- Multidimensional table - array in array
local arr = {
    {1,2,3},
    {4,5,6},
    {7,8,9}
}
print(arr[1][1]) -- 1

-- Loop over multidimensional table
for i = 1, #arr do
    for j = 1, #arr[i] do
        print(arr[i][j])
    end
end
```

## Functions
```lua
-- if its a local function, it can be accessed only from this file, but if it's a _G function then we can access it from any file
-- we can also return multiple values at once
local add10 = function (number)
    local outcome = 10 + number
    return number, outcome
end

local stored, output = add10(20)

-- Recursion
local function counter(number, end_num)
    local count = number + 1
    
    if (count < end_num) then
        return counter(count, end_num)
    end
    return count
end

print(counter(10,15))

-- we can return a function
local function counter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

local x = counter()
print(x())

-- Unspecified amount of arguments
local function sum(...)
    local sums = 0

    for key, value in pairs({...}) do -- also loops over tables, {} - converts into a table 
        print(key) -- index
        print(value) -- value
        sums = sums + value
    end

    --[[
        We can also loop over the data like this:

        for i = 1, #{...} do
        end

        But the pairs method also gives us the key
    ]]

    return sums
end

print(sum(1,2,3))
```
## Co-Routines
```lua
-- Basically a thread/async function
local routine_1 = coroutine.create(function)

routine_1 = coroutine.create(
    function ()
        for i = 1, 10, 1 do
            print("(Routine 1): " .. i)
            if i == 5 then
                coroutine.yield() -- Makes it wait
            end
        end
    end
)

local routine_function = function()
    for i = 11, 20, 1 do
        print("(Routine 2): " .. i)
    end
end

local routine_2 = coroutine.create(routine_function)

coroutine.resume(routine_1)
coroutine.resume(routine_2)
print(coroutine.status(routine_1))
coroutine.resume(routine_1)
print(coroutine.status(routine_1))

--[[
    Status:
        running - is running
        suspended - is suspended or not started
        normal - is active but not running
        dead - has finished or stopped with error
]]

coroutine.resume(routine_1) -- Resumes/starts a routine

-- Yield basically makes a pause for a running coroutine
```

## Files
```lua
-- sets the current output file
io.output("test.txt")

-- writes to said file
io.write("abc")

-- close said file
io.close()

-- set input file
io.input("test.txt")

-- reads 5 characters
local file = io.read(5)

-- possible to filter read, if the file had 88s written in it we would receive 88
local file = io.read("*number")

-- reads line by line
local file = io.read("*line")

-- read all
local file = io.read("*all")

-- open file and set it's mode
local file = io.open("test.txt")

--[[
    Modes:
        r - Read mode
        w - Write mode
        a - Append mode
        r+ - Update mode, all previous data preserved
        w+ - Update mode, all previous data erased
        a+ - Append update mode, previous data preserved, writing only allowed at the end
        rb - Read mode binary
        wb - Write mode binary
        ab - Append mode binary
        r+b - Update mode, all previous data preserved binary
        w+b - Update mode, all previous data erased binary
        a+b - Append update mode, previous data preserved, writing only allowed at the end binary
]]

-- Another way to close the file
file:close()

-- Writes to file
file:write("abc")
```

## OS module
```lua
-- time since 1970 in seconds
os.time()

-- from 1970 until specified date
os.time(
    year = 2000,
    month = 10,
    day = 1,
    hour = 13,
    min = 20,
    sec = 10
)

-- gives time difference in seconds
os.difftime(os.time(), past)

-- gives current date
os.date()

-- get environment variable
os.getenv("ENV_NAME")

-- rename
os.rename("file.txt", "new.xml")

-- remove
os.remove("file.txt")

-- execute terminal commands, not reccomended
os.execute("whoami")

-- get execution time
local start = os.clock()

for i = 1, 1000 do
    local x = 10
end

print(os.clock() - start)

-- exit application
os.exit()
```

## Modules
```lua
-- Functions of module are called using module.function()
-- Module returns a table to a user

_G.test = {}

-- Has to be a global function to use outside of this file
function test.add(x, y)
    return x + y
end

return test

-- Module importing
local mod = require("test")
```

## OOP (Object Oriented Programming)
```lua
local function Pet(name)
    name = name or "Luis"
    return {
        name = name,
        status = "Hungry",

        feed = function(self)
            self.status = "Full"
        end
    }
end

local cat = Pet("Oof")
local cat2 = Pet()
print(cat.name) -- Oof
print(cat2.name) -- Luis

print(cat.status) -- Hungry
cat:feed()
print(cat.status) -- Full


-- Inheritance
local function Dog(name, breed)
    local dog = Pet(name)

    dog.breed = breed
    dog.loyalty = 0
    
    dog.isLoyal = function(self)
        return self.loyalty >= 10
    end

    dog.feed = function(self)
        self.status = "Full"
        self.loyalty = self.loyalty + 5
    end

    dog.bark = function(self)
        print("Woof")
    end

    return dog
end

local woofer = Dog("Dogger", "Poodle")

woofer:feed() -- woofer.loyalty - 5

print(woofer.breed) -- Poodle
woofer:bark() -- "Woof"
```

## Metamethods
```lua
local function addTableValues(x,y)
    return x.num + y.num
end

local tbl1 = {num = 50}
local tbl2 = {num = 10}

local ans = tbl1 + tbl2

print(ans) -- Error

local metatable = {
    __add = addTableValues -- __add is the same as + symbol
    __sub = function (x,y)
        return x.num - y.num
    end
}

setmetatable(tbl1, metatable)

local ans2 = tbl1 + tbl2 -- 60
local ans3 = tbl1 - tbl2 -- 40

--[[
    __add = +
    __sub = -
    __mul = *
    __div = /
    __mod = %
    __pow = ^
    __concat = ..
    __len = #
    __eq = ==
    __lt = <
    __le = <=
    __gt = >
    __ge = >=
]]

-- If we look at these as vectors
local tbl1 = { x = 10, y = 20 }
local tbl2 = { x = 5, y = 9 }

local function addTableValues(v1, v2)
    return {x = v1.x + v2.x, y= v1.y + v2.y}
end

local vector = tbl1 - tbl2
print(vector.x, vector.y) -- x: 15 y: 29
```
## Using "classes" in lua
```lua
ParsedElement = {ai = nil, dataTitle = nil, data = nil, unit = nil}

function ParsedElement:new(o, elementAi, elementDataTitle, elementType)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    self.ai = elementAi
    self.dataTitle = elementDataTitle
    if elementType == "S" then
        self.data = ""
    elseif elementType == "N" then
        self.data = 0
    elseif elementType == "D" then
        self.data = ".."
        self.data = "a"
    else
        self.data = ""
    end
    self.unit = ""
    return o
end

elementToReturn = ParsedElement:new(nil, "a", "Super", 123)

elementToReturn.ai = "something"
elementToReturn.dataTitle = "a"
elementToReturn.data = "c"
elementToReturn.unit = "meters"
```
## Try Catch in lua
```lua
-- similar functionality can be achieved using pcall

function test()
    print(a[i]) -- a may not be a table
end

if (pcall(test)) then
    -- all good
else
    -- error
end

-- can be also used like this
local status, err = pcall(function() error({code=121})end)
print(err.code) -- 121
```

## Using C api
[Relevant examples](https://www.troubleshooters.com/codecorn/lua/lua_c_calls_lua.htm)
```lua
--- Calling a lua function from c
lua_call (lua_State *L, int nargs, int nresults);

-- in lua:
a = f("how", t.x, 14)

-- in c:
lua_getglobal(L, "f") -- function to be called
lua_pushliteral(L, "how") -- 1st argument
lua_getglobal(L, "t") -- table to be indexed
lua_getfield(L, -1, "x") -- push result of t.x ( 2nd arg )
lua_remove(L, -2) -- Remove t from stack
lua_pushinteger(L, 14) -- 3rd argument
lua_call(L, 3, 1) -- call f with 3 arguments and 1 result
lua_setglobal(L, "a") -- set global a

-- lua file loading into c:
lua_State *L; -- create state variable
L = luaL_newstate();

luaL_openlibs(L); -- load Lua libraries

luaL_loadfile(L, "test.lua") -- load but dont run lua script file

lua_pcall(
	L, 
	number_of_args, 
	number_of_returns, 
	errfunc_idx
	); -- Priming run of the loaded Lua script to create the script's global variables

--Pass all arguments to the Lua script on the stack

lua_pcall(
	L, 
	number_of_args, 
	number_of_returns, 
	errfunc_idx
	); -- Run the loaded Lua script

--Retrieve the return from the Lua script

lua_close(L); -- Close the Lua state variable
```