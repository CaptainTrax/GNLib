
function GNLib.LerpColor( t, c1, c2 )
    return Color( Lerp( t, c1.r, c2.r ), Lerp( t, c1.g, c2.g ), Lerp( t, c1.b, c2.b ), c1.a == c2.a and c1.a or Lerp( t, c1.a, c2.a ) )
end

function GNLib.EncodeURL( url )
    return string.Replace( url, " ", "%20" )
end

local apikey = "trnsl.1.1.20190822T114859Z.8b4909373dc0b830.cf06aab555bbefc0acd710f07f8d6903105fe7ff"
function GNLib.AutoTranslate( target, text, callback )
    local url = string.format( "https://translate.yandex.net/api/v1.5/tr.json/translate?key=%s&text=%s&lang=%s", apikey, text, target )

    http.Fetch( GNLib.EncodeURL( url ), function( body )
        local reception = util.JSONToTable( body )

        if callback then
            callback( table.concat( reception.text or {}, " " ) or "", reception )
        end
    end )
end

function GNLib.Translate( source, target, text, callback )
    local url = string.format( "https://translate.yandex.net/api/v1.5/tr.json/translate?key=%s&text=%s&lang=%s-%s", apikey, text, source, target )

    http.Fetch( GNLib.EncodeURL( url ), function( body )
        local reception = util.JSONToTable( body )

        if callback then
            callback( table.concat( reception.text, " " ), reception )
        end
    end )
end

function GNLib.SendDiscordMessage( webhook, msg )
    http.Post( "https://guthen.000webhostapp.com/discord.php", { url = webhook, msg = msg } )
end

function GNLib.SendDiscordEmbed( webhook, title, msg, footer )
    http.Post( "https://guthen.000webhostapp.com/discord_embed.php", { url = webhook, msg = msg, title = title, footer = footer } )
end

function GNLib.IsPair( value )
    if not isnumber(value) then return end
    return value % 2 == 0
end

--  > This function come from GMod Creators Area
function GNLib.Benchmark( callback, name )
    local start = SysTime()
    
    callback()

    local totalTime = ( SysTime() - start ) * 1000
    local endTime = tostring( totalTime ) .. 'ms'
    print( name or '', 'Time elapsed: ', endTime )

    return totalTime
end
