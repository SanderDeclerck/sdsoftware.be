param location string = resourceGroup().location

resource staticFrontend 'Microsoft.Web/staticSites@2022-03-01' = {
  name: 'sdsoftware-be-static-app'
  location: location
  properties: { }
  sku: {
    tier: 'Free'
    name: 'Free'
  }
}
