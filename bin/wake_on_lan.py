#/usr/bin/env python

# git clone https://github.com/remcohaszing/pywakeonlan.git

from wakeonlan import send_magic_packet

send_magic_packet( 'f0:18:98:f0:77:d6'
                 , ip_address='santiagomok.dev'
                 , port='2223'
                 )
