param ($service='demo-az-func', $location='eastus', $env='prod', $iteration='001') 

$rgService = "rg-$service-$env"
$appName = "func-$service-$env"

if ($(az group list --query "[?name=='$rgService'] | length(@)") -eq 0)
{
  az group create --name $rgService --location $location
}

az deployment group create --resource-group $rgService --template-file main.bicep --parameters appInsightsLocation=$location appName=$appName