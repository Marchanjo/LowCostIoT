nome = "interruptor"
rele = 3
gpio.mode(rele, gpio.OUTPUT)
gpio.write(rele, gpio.HIGH)
status = "desligado"
wifi.setmode(wifi.STATION)
wifi.sta.config("CITI-Terreo","1cbe991a14")
wifi.sta.setip({ip="192.168.0.95", netmask="255.255.255.0", gateway="192.168.0.1"})
wifi.sta.autoconnect(1)
if server then
    server:close()
end
server=net.createServer(net.TCP)
server:listen(80, function(conexao)
    conexao:on("receive", function(cliente, mensagem)
        if mensagem then
            print(mensagem)
            ini1, ini2 = mensagem:find("GET")
            fim1, fim2 = mensagem:find("HTTP")
            dado = mensagem:sub(ini2+3, fim1-2)
            print(dado)   
            if dado == "?pin=on" then
                gpio.write(rele, gpio.LOW)
                status = "ligado"    
            end      
            if dado == "?pin=off" then
                gpio.write(rele, gpio.HIGH)
                status = "desligado"
            end
            resposta = nome .. "_" .. status
            tamanho = string.len(resposta)
            reply = "HTTP/1.1 200 OK\r\nContent-Length:" .. tostring(tamanho) .. "\r\nConnection:close\r\n\r\n"..resposta
            conexao:send(reply)
            --tamanho = string.len(resposta)
            --conexao:send("HTTP/1.1 200 OK")
            --conexao:send("Content-Length:" .. tostring(tamanho))
            --conexao:send("Connection:close\r\n")
            --conexao:send(resposta)
        end
    end)
    conexao:on("sent", function(conexao) conexao:close() end)
end)
