ESP8266
- com NodeMCU : flash feito pelo ESPtool (arquivo nodemcu na pasta esptool) 
	- conexão dos esp com cabo FTDI: http://cdn.instructables.com/FLB/M8JA/I3VHABJ2/FLBM8JAI3VHABJ2.MEDIUM.jpg
		em alguns casos deve-se colocar o RESET em alto
	- para fazer o flash: python esptool.py --port COMX write_flash 0x00000 arquivo_que_tem_o_firmware.bin
- enviar o init.lua para o esp por meio do ESPlorer, escolher a porta e o baudrate (normamente é 9600 ou 115200)
	- mudar ip que é setado na programação (192.168.0.95) se necessário 
	- se não funcionar testar subir o arquivo "teste_site.lua" e abrir em um browser o "ip"+":80" (para descobrir o ip envie "wifi.sta.getip()" por serial no ESPlorer)


Aplicativo
- simples para envio de comandos "on" ou "off" para o ESP.
- selecionar ip e porta
- somente HomeActivity está sendo utilizado.