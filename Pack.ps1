Function Remove-Directory-Safe {
    Param (
        [Parameter(Mandatory=$true)][string] $Value
    )

    if (Test-Path $Value) {
        Remove-Item -Path $Value -Recurse -Force -Confirm:$false -ErrorAction Ignore
    }
}

Remove-Directory-Safe ./bin
Remove-Directory-Safe ./obj

dotnet pack -c Release -o ./Pack

Remove-Directory-Safe ./bin
Remove-Directory-Safe ./obj