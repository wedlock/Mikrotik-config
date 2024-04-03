# 2024-04-03 22:26:31 by RouterOS 7.14.2
# software id = X6K5-6NIL
#
# model = RBD52G-5HacD2HnD
# serial number = E5780E42AC6B
/interface bridge
add admin-mac=2C:C8:1B:BE:7D:19 auto-mac=no comment=defconf name=bridge \
    port-cost-mode=short
add name=bridgeWiFi
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-XX \
    disabled=no installation=outdoor mode=ap-bridge ssid=MikroTik-BE7D1D
set [ find default-name=wlan2 ] disabled=no mode=ap-bridge ssid=MikroTik-5G
/interface ethernet
set [ find default-name=ether5 ] loop-protect=on
set [ find default-name=ether4 ] name=mainOut
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface lte apn
set [ find default=yes ] ip-type=ipv4 use-network-apn=no
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk mode=dynamic-keys \
    supplicant-identity=MikroTik
add authentication-types=wpa2-psk mode=dynamic-keys name=bridge_password \
    supplicant-identity=""
/ip pool
add name=dhcp ranges=192.168.88.10-192.168.88.254
add name=dhcp_pool1 ranges=192.168.32.2-192.168.32.254
/ip dhcp-server
add address-pool=dhcp interface=bridge lease-time=1d10m name=defconf
/ip smb users
set [ find default=yes ] disabled=yes
/interface bridge port
add bridge=bridge comment=defconf ingress-filtering=no interface=ether3 \
    internal-path-cost=10 path-cost=10
add bridge=bridge comment=defconf ingress-filtering=no interface=mainOut \
    internal-path-cost=10 path-cost=10
add bridge=bridge comment=defconf ingress-filtering=no interface=ether5 \
    internal-path-cost=10 path-cost=10
add bridge=bridge comment=defconf ingress-filtering=no interface=wlan1 \
    internal-path-cost=10 path-cost=10
add bridge=bridge comment=defconf ingress-filtering=no interface=ether2 \
    internal-path-cost=10 path-cost=10
add bridge=bridgeWiFi interface=all internal-path-cost=10 path-cost=10
/ip firewall connection tracking
set udp-timeout=10s
/ip neighbor discovery-settings
set discover-interface-list=!all lldp-med-net-policy-vlan=1
/ip settings
set max-neighbor-entries=8192 tcp-syncookies=yes
/ipv6 settings
set disable-ipv6=yes max-neighbor-entries=8192
/interface detect-internet
set detect-interface-list=all
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface=ether1 list=WAN
/interface ovpn-server server
set auth=sha1,md5
/ip address
add address=192.168.88.1/24 comment=defconf interface=bridge network=\
    192.168.88.0
add address=192.168.32.1/24 disabled=yes interface=bridgeWiFi network=\
    192.168.32.0
/ip arp
add address=192.168.88.220 interface=bridge mac-address=F2:EA:0F:8A:7C:89
/ip dhcp-client
# DHCP client can not run on slave or passthrough interface!
add comment=defconf interface=ether1
/ip dhcp-server lease
add address=192.168.88.30 client-id=1:70:b3:d5:34:32:4f comment=\
    "Sterownik pieca" mac-address=70:B3:D5:34:32:4F server=defconf
add address=192.168.88.22 comment="Zarowka korytarz" mac-address=\
    D0:27:02:15:41:44 server=defconf
add address=192.168.88.54 client-id=1:d8:bb:c1:5b:80:8b comment=\
    "Desktop-Z\F3\B3ty" mac-address=D8:BB:C1:5B:80:8B server=defconf
add address=192.168.88.74 comment="MC SMART" mac-address=9C:28:41:13:75:C1 \
    server=defconf
add address=192.168.88.53 client-id=1:bc:ff:eb:99:5c:17 comment=\
    "Motorola ONE" mac-address=BC:FF:EB:99:5C:17 server=defconf
add address=192.168.88.29 comment="Sensor w samochodzie" mac-address=\
    E8:DB:84:DF:D3:8F server=defconf
add address=192.168.88.25 comment="Sterownik bramy metalowej" mac-address=\
    BC:FF:4D:C5:12:FF server=defconf
add address=192.168.88.40 client-id=1:ae:52:d1:dc:3a:df comment=\
    "Telefon Wiki" mac-address=AE:52:D1:DC:3A:DF server=defconf
add address=192.168.88.46 client-id=\
    ff:9b:94:6f:b3:0:1:0:1:2c:3d:db:d4:4a:73:9b:94:6f:b3 mac-address=\
    4A:73:9B:94:6F:B3 server=defconf
add address=192.168.88.12 client-id=1:ac:50:de:52:d8:b9 comment=Drukarka \
    mac-address=AC:50:DE:52:D8:B9 server=defconf
add address=192.168.88.11 client-id=1:5a:6d:33:5c:2b:b4 mac-address=\
    5A:6D:33:5C:2B:B4 server=defconf
add address=192.168.88.48 client-id=1:3c:7c:3f:ca:61:e0 comment="Router ASUS" \
    mac-address=3C:7C:3F:CA:61:E0 server=defconf
add address=192.168.88.56 client-id=\
    ff:8e:2e:e9:98:0:1:0:1:2c:95:99:1d:5a:3d:8e:2e:e9:98 comment=\
    "MariaDB for Homeassistant" mac-address=5A:3D:8E:2E:E9:98 server=defconf
add address=192.168.88.57 client-id=\
    ff:58:cb:c5:63:0:1:0:1:2c:95:9e:b4:12:81:58:cb:c5:63 comment=\
    "InfkuxDB for Homeassistant" mac-address=12:81:58:CB:C5:63 server=defconf
add address=192.168.88.58 client-id=\
    ff:b5:f2:e4:be:0:1:0:1:2c:95:a3:17:c2:87:b5:f2:e4:be comment=\
    "MariaDB for Homeassistant" mac-address=C2:87:B5:F2:E4:BE server=defconf
add address=192.168.88.59 client-id=\
    ff:ee:ff:e3:e7:0:2:0:0:ab:11:7f:fe:9d:a0:3b:10:df:50 mac-address=\
    BC:24:11:21:77:A9 server=defconf
add address=192.168.88.68 client-id=\
    ff:11:77:d1:fb:0:1:0:1:2d:65:ee:20:bc:24:11:77:d1:fb comment=CasaOS \
    mac-address=BC:24:11:77:D1:FB server=defconf
add address=192.168.88.78 client-id=1:bc:24:11:87:6b:a4 comment=TrueNAS \
    mac-address=BC:24:11:87:6B:A4 server=defconf
/ip dhcp-server network
add address=192.168.88.0/24 comment=defconf dns-server=8.8.4.4 gateway=\
    192.168.88.1
/ip dns
set allow-remote-requests=yes servers=192.168.88.220
/ip dns static
add address=192.168.88.1 comment=defconf name=router.lan
/ip firewall address-list
add list=ddos-attackers
add list=ddos-targets
/ip firewall filter
add action=accept chain=input comment=\
    "defconf: accept established,related,untracked" connection-state=\
    established,related,untracked
add action=drop chain=input comment="defconf: drop invalid" connection-state=\
    invalid
add action=accept chain=input comment="defconf: accept ICMP" protocol=icmp
add action=accept chain=input comment=\
    "defconf: accept to local loopback (for CAPsMAN)" dst-address=127.0.0.1
add action=drop chain=input comment="defconf: drop all not coming from LAN" \
    in-interface-list=!LAN
add action=accept chain=forward comment="defconf: accept in ipsec policy" \
    ipsec-policy=in,ipsec
add action=accept chain=forward comment="defconf: accept out ipsec policy" \
    ipsec-policy=out,ipsec
add action=fasttrack-connection chain=forward comment="defconf: fasttrack" \
    connection-state=established,related hw-offload=yes
add action=accept chain=forward comment=\
    "defconf: accept established,related, untracked" connection-state=\
    established,related,untracked
add action=drop chain=forward comment="defconf: drop invalid" \
    connection-state=invalid
add action=drop chain=forward comment=\
    "defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    connection-state=new in-interface-list=WAN
add action=fasttrack-connection chain=forward dst-port=53 hw-offload=yes \
    protocol=tcp
add action=fasttrack-connection chain=forward dst-port=53 hw-offload=yes \
    protocol=udp
add action=return chain=detect-ddos dst-limit=32,32,src-and-dst-addresses/10s
add action=add-dst-to-address-list address-list=ddos-targets \
    address-list-timeout=10m chain=detect-ddos
add action=add-src-to-address-list address-list=ddos-attackers \
    address-list-timeout=10m chain=detect-ddos
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN
add action=masquerade chain=srcnat out-interface=bridgeWiFi
/ip smb shares
set [ find default=yes ] directory=/flash/pub
/routing bfd configuration
add disabled=no
/system clock
set time-zone-name=Europe/Warsaw
/system note
set show-at-login=no
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
