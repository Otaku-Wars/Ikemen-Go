-- Script to run AI battles indefinitely with random characters

-- Function to randomly select a character
function randomCharacter()
    -- Assuming your characters are in the 'chars' directory
    local chars = {
        "kfm",    -- Add your character names here
        -- "ryu",
        -- "ken",
        -- Add as many characters as you want
    }
    return chars[math.random(#chars)]
end

-- Function to set up and run a single battle
function runBattle()
    -- Set player 1 and player 2 to random characters
    setPlayer(1, randomCharacter())
    setPlayer(2, randomCharacter())

    -- Set the AI level (1 to 8, with 8 being the hardest)
    setAILevel(1, 8)
    setAILevel(2, 8)

    -- Start the match
    startMatch()

    -- Wait for the match to finish
    waitUntilMatchOver()
end

-- Main loop to run battles indefinitely
while true do
    runBattle()
end
