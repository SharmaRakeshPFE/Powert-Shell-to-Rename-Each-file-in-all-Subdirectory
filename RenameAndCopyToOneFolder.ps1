cls
##Author Rakesh
##Description :- Loop thorough each folder rename the file name to its folder name as folder name is unique but same files names in all folder 
##and copy content later to one folder
## Reading Subfolders
$Folders = Get-ChildItem C:\PNB\TRACE\ -Directory -Name -Recurse
##defining Destination Path to copy all files into one location
$DestPath="C:\PNB\TRACE\CopyContent\"
 foreach($Folder in $Folders)
 {
        Write-Host $Folder
                $p = 1
                $AbsPath="C:\PNB\TRACE\" + $Folder + "\*.trc" 
                $CopyPath="C:\PNB\TRACE\" + $Folder + "\"
                Write-Host $AbsPath
                Get-ChildItem $AbsPath -Recurse | % { Rename-Item $_.FullName -NewName ( $Folder +".xel" -f $p++)
                Copy-Item -Path $AbsPath -Destination $DestPath
                }
                  

 }