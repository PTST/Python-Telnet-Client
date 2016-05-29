<h1>TelnetTool</h1>
<h3>Et værktøj til at erstatte brugen af telnet, til følgende funktioner.</h3>
- Scanne WiFi kanaler på routeren.
- Få aktive forbindelser.
- Tjekke GIP status.
- Gendan routeren til fabriks indstillinger.
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
Sæt Porte | service host add name=<b>navn</b><br>service host rule add name=<b>navn</b> protocol=any portrange=<b>port</b><br>service host assign name=<b>navn</b> host=<b>IP</b> log=disabled<br><br>Tager <b>navn</b> og <b>port</b>, fra den tjeneste der er blevet valgt fra <i>Portforward liste</i>. og <b>IP</b> fra feltet <i>Enheds IP</i>



