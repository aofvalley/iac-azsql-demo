param serverName string 
param databaseName string 
param location string
param administratorLogin string
@secure()
param administratorLoginPassword string




resource sqlServer 'Microsoft.Sql/servers@2014-04-01' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    version: '12.0'
  }
}

resource firewallRule 'Microsoft.Sql/servers/firewallRules@2014-04-01' = {
  name: 'AllowAllAzureIPs'
  parent: sqlServer
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource database 'Microsoft.Sql/servers/databases@2014-04-01' = {
  name: databaseName
  location: location
  parent: sqlServer
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    requestedServiceObjectiveName: 'Basic'
  }
}

output serverFqdn string = sqlServer.properties.fullyQualifiedDomainName
output databaseId string = database.id
