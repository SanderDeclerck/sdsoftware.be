param location string = resourceGroup().location
param customDomains array

resource staticFrontend 'Microsoft.Web/staticSites@2022-03-01' = {
  name: 'sdsoftware-be-static-app'
  location: location
  properties: { }
  sku: {
    tier: 'Free'
    name: 'Free'
  }
}

module staticWebappHostnamesDnsRecords 'dns/cname.bicep' = [for customDomain in customDomains: {
  name: 'records'
  scope: resourceGroup(customDomain.resourceGroup)
  params: {
    dnsZone: customDomain.dnsZone
    subdomain: customDomain.dnsRecordName
    cname: staticFrontend.properties.defaultHostname
  }
}]

resource staticWebappHostnames  'Microsoft.Web/staticSites/customDomains@2022-03-01' = [ for customDomain in customDomains: {
  name: customDomain.hostname
  parent: staticFrontend
  dependsOn: staticWebappHostnamesDnsRecords
}]


