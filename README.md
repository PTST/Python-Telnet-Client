<h1>TelnetTool</h1>
<h3>Et værktøj til at erstatte brugen af telnet, til følgende funktioner.</h3>
- Scanne WiFi kanaler på routeren.
- Få aktive forbindelser.
- Tjekke GIP status.
- Gendan routeren til fabriks indstillinger.
- Fix H Firmware
- Portforwarde til følgende tjenester:
  - Apple TV
  - Sonos
  - Xbox One
  - Xbox 360
  - Playstation 4
  - Dankort terminaler
  - Chromecast
  - Canal Digital GO

<h3>Liste over knapper og hvilken kommando de udfører</h3>

Knap | Kommando
------------ | -------------
ACS | wireless acs rescan <br> wireless acs scanreport
Connection Stats | connection stats
Reset CPE | system reset <br> 1 <br> 1
GIP Tjek | dhcp server pool list
Fix H Firmware | dns client dnsadd addr=212.242.40.3 port=53<br>dns client dnsadd addr=212.242.40.51 port=53
Port Forward | service host add name=<b>navn</b><br>service host rule add name=<b>navn</b> protocol=any portrange=<b>port</b><br>service host assign name=<b>navn</b> host=<b>IP</b> log=disabled<br><br>Tager <b>navn</b> og <b>port</b>, fra den tjeneste der er blevet valgt fra <i>Portforward liste</i>. og <b>IP</b> fra feltet <i>Enheds IP</i>

<h3>Screenshots af TelnetTool</h3>

<img src="https://cloud.githubusercontent.com/assets/17211264/15633428/d7138cc4-25ac-11e6-8510-0dedb09850b5.png" width="45%"></img> <img src="https://cloud.githubusercontent.com/assets/17211264/15633429/d7289ca4-25ac-11e6-928a-88495fdfadee.png" width="45%"></img> <img src="https://cloud.githubusercontent.com/assets/17211264/15633434/d739da32-25ac-11e6-927d-83b75e049843.png" width="45%"></img> <img src="https://cloud.githubusercontent.com/assets/17211264/15633432/d73797f4-25ac-11e6-91bb-b777fe95d0ae.png" width="45%"></img> <img src="https://cloud.githubusercontent.com/assets/17211264/15633431/d73792fe-25ac-11e6-9b82-85e870dd98ac.png" width="45%"></img> <img src="https://cloud.githubusercontent.com/assets/17211264/15633433/d737bfa4-25ac-11e6-9271-e95765198c59.png" width="45%"></img> <img src="https://cloud.githubusercontent.com/assets/17211264/15633430/d73764fa-25ac-11e6-9fb6-d5f34ed29edf.png" width="45%"></img> <img src="https://cloud.githubusercontent.com/assets/17211264/15633435/d73f5cb4-25ac-11e6-866b-8ee4106926ad.png" width="45%"></img> 

