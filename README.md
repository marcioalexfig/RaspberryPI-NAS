# RaspberryPI-NAS

Este projeto é simplesmente um RaspberryPi (RPi 1, 2, 3... não importa), com Raspibian OS, com acesso à rede configurado e um HD externo com uma pasta compartilhada utilizando Samba.

<pre>
Passos da configuração:
- Instale o Raspibian OS (https://www.raspberrypi.org/software/)

- Instale o Samba (https://magpi.raspberrypi.org/articles/samba-file-server)

- Configure o Wi-fi

- Crie uma pasta no HD externo (FAT, NTFS etc)

- Crie um script "remontar.sh" na pasta "/home/pi/Documents" com 
base no arquivo (https://github.com/marcioalexfig/RaspberryPI-NAS/blob/main/remontar.sh). 
Este script tem a função de desmontar o HD externo 
e remonta-lo apontando para a pasta compartilhada HD1 
e reinicia o samba para fazer efeito.

- Este ultimo passo consiste em executar o script que acabamos 
de criar na inicialização do sistema, através do arquivo 
(https://github.com/marcioalexfig/RaspberryPI-NAS/blob/main/rc.local)

O arquivo rc.local já existe no sistema, é necessário abrir e editar 
(https://www.raspberrypi.org/documentation/linux/usage/rc-local.md).

Vamos apenas adicionar as linhas abaixo antes do "exit 0" conforme o exemplo mais abaixo.
<i>
cd /home/pi/Documents
./remontar.sh
</i>

</pre>

<b>"remontar.sh"</b>
<pre><i>
#!/bin/bash
sudo umount /dev/sda2
sudo mount -t auto /dev/sda2 /media/HD1
sudo /etc/init.d/smbd restart
</i></pre>

<b>"rc.local"</b>

<pre>
<i>
# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

cd /home/pi/Documents
./remontar.sh

exit 0
</i>
</pre>
