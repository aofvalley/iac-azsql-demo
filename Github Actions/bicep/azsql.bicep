param resourceGroupName string = 'alfonsodsqlbicepgit'
param serverName string = 'alfonsodbicepserver'
param databaseName string = 'BicepDB'

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' = {
  name: serverName
  location: resourceGroup().location
  properties: {
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'MyP@ssword123'
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
  parent: sqlServer
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    requestedServiceObjectiveName: 'Basic'
  }
}

output serverFqdn string = sqlServer.properties.fullyQualifiedDomainName
output databaseId string = database.id
