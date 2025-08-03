function Fantasy_API (player, cmd, ...)
    local jsona = table.concat({...}, " ")
    if not jsona or jsona == "" then
        return
    end

    local url = "https://api-music.fantasyresources.net/search?src=" .. jsona

    fetchRemote( url, function (data, errno)
        if errno ~= 0 then return end

        local json = fromJSON(data)
        if not json.id then
            print("Nenhuma música encontrada.")
            return
        end

        if json then
            print("Tocando música: " .. json.title .. " por " .. json.author, player, 0, 255, 0)
            local url_play = "https://api-music.fantasyresources.net/play-client?id=" .. json.id
            triggerClientEvent( player, "Client-Side:PlayMusic", player, player, url_play)
        else
            print("Música não encontrada.")
        end
    end)
end

addCommandHandler( "musica", Fantasy_API)