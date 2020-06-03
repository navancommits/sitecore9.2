Param(
	$solrVersion = "7.5.0",
	$nssmVersion = "2.24",
    $installSubFolder = "instance-8",
    $installFolder = "C:\solr\$installSubFolder",
    $solrSvcName="solr-$installSubFolder-$solrVersion" #change here if your service name is different

$svc = Get-Service "$solrSvcName" -ErrorAction SilentlyContinue
if($svc)
{
    Write-Host "Uninstalling Solr service"
    &"$installFolder\nssm-$nssmVersion\win64\nssm.exe" stop "$solrSvcName" 
	&"$installFolder\nssm-$nssmVersion\win64\nssm.exe" remove "$solrSvcName" confirm
}
else
{
	Write-Host "Solr service does not exist!"
}

Write-Host "Deleting Solr Instance Folder"
rm $installFolder -force -recurse -ea ig
Write-Host "Deleted Solr Instance Folder"
