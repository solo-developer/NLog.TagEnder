
Get-ChildItem (Get-Item .).FullName   -Filter *.xml |
Foreach-Object {
    $content =Get-Content $_.FullName

    $nlogCount= (Select-String -Path $_.FullName -Pattern "</nlog>" -AllMatches).Matches.Count

    If(0 -eq $nlogCount){
        Add-Content $_.FullName "</nlog>"
    }

} 
Write-Output "All XML Documents in current directory has been formatted.Please proceed."
Read-Host -Prompt "Press Enter to exit"
