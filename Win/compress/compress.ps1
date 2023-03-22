Clear-Host

$excludelist = Get-Content ".\exclude.txt"
$mdsizelist = Get-Content ".\mdsizes.txt"

Get-ChildItem -Directory | ForEach-Object { 

  foreach ($line in $excludelist){
    if ("$line" -eq "$_"){
      #Write-Host "Going to skip $_"
      $pass=1
      break
    }else{
      #Write-Host "$_"
      #continue
    }
    #continue
    #Write-Output $_.Name
  }
  if ($pass -eq 1){
    #Write-Output "Skipping..."
    $pass=0
  }else {
    #Write-Output $_.Name
    # zip code here
    Write-Output "`"$_`""
    #$mdsize=256
    foreach ($mdsize in $mdsizelist){
      Write-Output "<<< Folder: $_   mdsize: ${mdsize}m >>>"
      7z a -t7z -m0=lzma2 -mx=9 -ms=on -mmt=2 -mfb=64 -md="${mdsize}m"  "`"$_(${mdsize},64).7z`"" "`"$_`""
      ls | Sort-Object -Property Length | Select-Object -Property Length, Name
      Write-Output ""
      Write-Output "### 單檔分隔線 ###"
    }
    Write-Output ""
    ls | Sort-Object -Property Length | Select-Object -Property Length, Name    
    Write-Output "### 不同檔分隔線 ###"
    #Write-Host 7z a -t7z -m0=lzma2 -mx=9 -ms=on -mmt=2 -mfb=64 -md="${mdsize}m"  "`"$_(${mdsize},64).7z`"" "`"$_`""
  }
  Write-Output "Exit Code: $LASTEXITCODE"
  ls | Sort-Object -Property Length | Select-Object -Property Length, Name
  Write-Output ""
}