param location string = resourceGroup().location

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: 'sdsoftware-be-static-app'
  location: location
  sku: {
    tier: 'Free'
    name: 'Free'
  }
}
