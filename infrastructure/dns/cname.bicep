param dnsZone string
param subdomain string
param cname string


resource dnsZoneObject 'Microsoft.Network/dnsZones@2018-05-01' existing = {
  name: dnsZone
}

resource record 'Microsoft.Network/dnsZones/CNAME@2018-05-01' = {
  name: subdomain
  parent: dnsZoneObject
  properties: {
    TTL: 3600
    CNAMERecord: {
      cname: cname
    }
  }
}
