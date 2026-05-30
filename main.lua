--The 21 Game
--Programmed by Pie
--Coding isn't fun

math.randomseed(os.time())

local cards = {2,3,4,5,6,7,8,9}
local hand = {}
local cardSum = 0

--Drawing a random card for hand
function hit()
    local index = math.random(#cards)
    local card = cards[index]

    table.insert(hand, card)
    cardSum = cardSum + card

    print("Card drawn:", card)
    print("Total:", cardSum)
    print()
end

--Win/Lose 
function lose()
    print("You lose, nice try.")
    os.exit(0)
end

function win()
    print("You win, good job!")
    os.exit(0)
end

--Gameloop
function gameLoop()
    if #hand == 0 then
        for i = 1,2 do
            hit()
        end
    end

    while true do
        print("Give up(1) or Hit(2)?")
        local choice = tonumber(io.read())

        if choice == 1 then
            lose()

        elseif choice == 2 then
            hit()

            if cardSum > 21 then
                lose()
            elseif cardSum == 21 then
                win()
            end
        else
            print("Invalid choice!")
        end
    end
end

gameLoop()