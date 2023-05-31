@description('The name of the SQL logical server.')
param serverName string = uniqueString('sql', resourceGroup().id)

@description('The name of the SQL Database.')
param sqlDBName string = 'SampleDB'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param administratorLogin string

@description('The administrator password of the SQL logical server.')
@secure()
param administratorLoginPassword string

resource sqlServer 'Microsoft.Sql/servers@2021-08-01-preview' = {
  name: serverName
  location: location
  tags: {
    demo1: 'iac'
    demo2: 'bicep'
    demo3: 'azsql'
  }
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}

resource sqlDB 'Microsoft.Sql/servers/databases@2021-08-01-preview' = {
  parent: sqlServer
  name: sqlDBName
  location: location
  tags: {
    demo1: 'iac'
    demo2: 'bicep'
    demo3: 'azsql'
  }
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}

resource firewallRule 'Microsoft.Sql/servers/firewallRules@2021-08-01-preview' = {
  parent: sqlServer
  name: 'AllowAzureServices'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

