server = true
bootstrap_expect = 1
node_name = "servidorUbuntu"
datacenter = "dc1"
data_dir = "/opt/consul"

bind_addr      = "192.168.100.3"
client_addr    = "0.0.0.0"
advertise_addr = "192.168.100.3"

ui = true
ports { dns = 8600 }