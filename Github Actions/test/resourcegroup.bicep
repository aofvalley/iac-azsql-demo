targetScope = 'subscription'

param resourceGroupName string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: 'East US'
}
