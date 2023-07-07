$apiUrl = "http://172.30.214.31/zabbix/api_jsonrpc.php"
$apiUser = "Admin"
$apiPass = "zabbix"

# Construir la solicitud de autenticación
$requestBody = @{
    jsonrpc = "2.0"
    method = "user.login"
    params = @{
        user = $apiUser
        password = $apiPass
    }
    id = 1
} | ConvertTo-Json

# Enviar la solicitud a la API de Zabbix
$response = Invoke-RestMethod -Uri $apiUrl -Method Post -Body $requestBody -ContentType "application/json"

# Verificar la respuesta
if ($response.error) {
    Write-Host "Error: $($response.error.message)"
} else {
    $authToken = $response.result
    Write-Host "Autenticacion exitosa. Token de autenticacion: $authToken"

    # Crear el grupo de usuarios en Zabbix
    $groupParams = @{
        jsonrpc = "2.0"
        method = "usergroup.create"
        params = @{
            name = "flexxibleit"
        }
        auth = $authToken
        id = 1
    } | ConvertTo-Json

    $groupResponse = Invoke-RestMethod -Uri $apiUrl -Method Post -Body $groupParams -ContentType "application/json"

    # Verificar la respuesta
    if ($groupResponse.error) {
        Write-Host "Error al crear el grupo de usuarios: $($groupResponse.error.message)"
    } else {
        $groupId = $groupResponse.result.usrgrpids[0]
        Write-Host "Grupo de usuarios creado exitosamente. ID del grupo de usuarios: $groupId"
    }

    # Imprimir respuesta completa para depuración
    Write-Host "Respuesta de la API:"
    $groupResponse | ConvertTo-Json -Depth 100
}
