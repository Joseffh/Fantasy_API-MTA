addEvent( "Client-Side:PlayMusic", true)
addEventHandler( "Client-Side:PlayMusic", root, function (player, url)
    if not url or url == "" then return end
    local x, y, z = getElementPosition(player)
    playSound3D(url, x, y, z, true)
    print("Tocando música: " .. url, player, 0, 255, 0)
end)