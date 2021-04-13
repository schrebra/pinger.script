$Output= @()
$names = Get-Content "C:\temp\computers.txt"

foreach ($name in $names){
	if (Test-Connetion -ComputerName $name -Count 1 -ErrorAction SilentlyContinue){
	$Output+= "$name Online"
	Write-Host "$Name" "Online" -ForegroundColor Green
	}

	else{
		$Output+="$name Offline"
		Write-Host "$Name" "Offline" -ForegroundColor Red
		}
}

$Output | Out-file "C:\temp\ping.results.csv"

$Output | Out-GridView