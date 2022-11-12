param location string = resourceGroup().location
param hostnames array

resource staticFrontend 'Microsoft.Web/staticSites@2022-03-01' = {
  name: 'sdsoftware-be-static-app'
  location: location
  properties: { }
  sku: {
    tier: 'Free'
    name: 'Free'
  }
}


resource staticWebappHostnames  'Microsoft.Web/staticSites/customDomains@2022-03-01' = [ for hostname in hostnames: {
  name: hostname
  parent: staticFrontend
}]
