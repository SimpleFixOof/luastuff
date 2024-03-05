print("Test lua file with all examples!\r\n")

print("---Printing---")
print("Hello World!")

-- To append/concat string in lua we use ..

print("Hello " .. "World!")

print("\n\n---Variables---")

print("Multiline string:")
local description = [[
Interesting
Wow
]]

print(description)

C = 20 -- global variable

_G.Hello = "Hello World!"

print("Global variable:")
print(Hello)

print("Variable type:")
print(type(Hello)) -- Type

print("\n\n---Math---")
print("String 2 to integer:")

local str = "2"
local num = tonumber(str)
print(num)

print("Power 2 ^ 5:")
print(2 ^ 5)

print("Modulo 10 % 3")
print(10 % 3)

print("Getting pi:")
print(math.pi)

print("Getting random values:")
print(math.random())

print(math.random(10))

math.randomseed(os.time())
print(math.random(10,50))

print("Get lowest/maximum value:")
print(math.min(1, 2, 4, 20, 50, -1))

print("Round down:")

print(math.floor(3.3))

print("Round up:")

print(math.ceil(3.1))

print("\n\n---Strings---")

print("Conver integer to string:")
print(tostring(22))

print("\n\n---Co-Routine---")
local routine_1 = coroutine.create(
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

local file = io.open("test.txt","w")