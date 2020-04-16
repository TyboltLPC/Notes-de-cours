# POWERSHELL

## FOREACH

````
$services=Get-Service

foreach ($service in $services){


    if ($service.Status -eq "Running"){

        Write-Host "Le service $($service.name) est actuellement : $($service.status)" -ForegroundColor Green

    } elseif ($service.Status -eq "Stopped") {

        Write-Host "Le service $($service.name) est actuellement : $($service.status)" -ForegroundColor Red
}}
````

## IF
```
$variable=6

  if($variable -ge 5){
    Write-Host "La valeur de la variable est supérieure à 5" -ForegroundColor Yellow

  }elseif($variable -eq 3)
    Write-Host "La valeur de la variable est égale à 3" -ForegroundColor Red

    }else{

        Write-Host "La valeur de la variable est égale à $($Variable)" -ForegroundColor Green
```

## FOR
```
for($i=20;$i -ge 15;$i--){

    #portion du code à exécuter
    Write-Host "La valeur de i est : $($i)" -ForegroundColor Green

    Start-Sleep 1
}
Write-Host "La valeur de i est : $($i)" -ForegroundColor Red
```

## DO
````
$i=8
do{

    #execution du code

    Write-Host "La variable I est égale à : $($i)" -ForegroundColor Green

    $i--

    Start-Sleep 1

}while ($i -ge 5)

    Write-Host "La variable I est égale à : $($i)" -ForegroundColor Red
````

## while
````
$i=0

while ($i -le 5){


   #execution du code

   Write-Host "La valeur de I est égale à : $($i)" -ForegroundColor Green

   $i++

   Start-Sleep 1


} Write-Host "La valeur de I est égale à : $($i)" -ForegroundColor Red
````

## SWITCH
````
$ville= Read-Host "Dans quelle ville habitez vous ?"

Switch($ville){

    ("Paris") { Write-Host "Vous êtes actuellement en France" -ForegroundColor Cyan }
    ("Lisboa") { Write-Host "Vous êtes actuellement au Portugal" -ForegroundColor Red }
    ("Berlin") { Write-Host "Vous êtes actuellement en Allemagne" -ForegroundColor Yellow }
    ("Amsterdam") { Write-Host "Vous êtes actuellement au Pays-Bas" -ForegroundColor Green }
    default { Write-Host "Navré mais je ne connais pas ce pays ou cette ville !!!" -ForegroundColor Gray}


}
````
