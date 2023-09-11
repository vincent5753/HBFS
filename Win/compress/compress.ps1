Clear-Host

$excludelist = Get-Content ".\exclude.txt"
$mdsizelist = Get-Content ".\mdsizes.txt"

Get-ChildItem -Directory | ForEach-Object {
  $folder = "$_"
  $minsize = 9999999999
  $minsizefile = ""
  # 比對資料夾484在例外清單裡
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
    #Write-Output "`"$_`""
    #$mdsize=256
    foreach ($mdsize in $mdsizelist){
	    Clear-Host
      Write-Output "<<< Folder: $_   mdsize: ${mdsize}m >>>"
      $Process = Start-Process "C:\Program Files\7-Zip\7z.exe" -ArgumentList "a","-t7z","-m0=lzma2","-mx=9","-ms=on","-mmt=2","-mfb=64","-md=${mdsize}m","`"$_(${mdsize},64).7z`"","`"$_`"" -NoNewWindow -PassThru
      $Process.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::High
      $Process.WaitForExit()
      #7z a -t7z -m0=lzma2 -mx=9 -ms=on -mmt=2 -mfb=64 -md="${mdsize}m"  "`"$_(${mdsize},64).7z`"" "`"$_`""
	    Write-Output "Exit Code: $LASTEXITCODE"
	    $acvfile = "$_(${mdsize},64).7z"
	    Write-Host "AcvFile: $acvfile"
	    $tmpfilename= Get-Item "$_(${mdsize},64).7z"
	    $acvsize = $tmpfilename.Length
	    Write-Host "AcvSize: $acvsize"
	    If ($acvsize –lt $minsize){
		    $minsize = $acvsize
		    $minsizefile = $acvfile
	    }else{
		    Write-Host "$acvfile 不是最小檔案，刪除"
		    Remove-Item -Path "$acvfile"
	    }
	    Write-Output "<<< MinSizeFile: $minsizefile Minsize: $minsize >>>"
      #ls | Sort-Object -Property Length | Select-Object -Property Length, Name
      Write-Output ""
      #Write-Output "### 單資料夾分隔線 ###"
    }
	  #Clear-Host
	  Get-ChildItem -File | ForEach-Object {
	    #Write-Host "$_"
	    if("$_" -like "$folder*" ){
		    if("$_" -eq "$minsizefile"){
		      Write-Host "[info] 嘿，這是最小檔案"
		  }else{
		    Write-Host "$_ 不是最小檔案，幫你刪掉"
		    Remove-Item -Path "$_"
		    }
	    }
    }
    Write-Output ""
    #ls | Sort-Object -Property Length | Select-Object -Property Length, Name    
    #Write-Output "### 不同資料夾分隔線 ###"
  }
  Clear-Host
  ls | Sort-Object -Property Length | Select-Object -Property Length, Name
  Write-Output ""
}