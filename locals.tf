locals {
  AppNameHash            = substr(lower(md5("${var.AppName}")), 0, 6)

  outbound_ports_map = {
    #"300" : "445"
  } 

  inbound_ports_map = {
    "200" : "3389"#, # If the key starts with a number, you must use the colon syntax ":" instead of "="
    #"300" : "445"
  } 
}