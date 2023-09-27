#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Test-Command dotnet) -and (-not (Get-Variable -Name PWSHRC_FORCE_MODULES_EXPORT_UNSUPPORTED -Scope Global -ValueOnly -ErrorAction SilentlyContinue))) {
    return
}

function dotnet-new {
    dotnet new @args
}
Set-Alias -Value dn -Name dotnet-new
Export-ModuleMember -Function dotnet-new -Alias dn

function dotnet-run {
    dotnet run @args
}
Set-Alias -Value dr -Name dotnet-run
Export-ModuleMember -Function dotnet-run -Alias dr

function dotnet-test {
    dotnet test @args
}
Set-Alias -Value dt -Name dotnet-test
Export-ModuleMember -Function dotnet-test -Alias dt

function dotnet-watch {
    dotnet watch @args
}
Set-Alias -Value dw -Name dotnet-watch
Export-ModuleMember -Function dotnet-watch -Alias dw

function dotnet-watch-run {
    dotnet watch run @args

}
Set-Alias -Value dwr -Name dotnet-watch-run
Export-ModuleMember -Function dotnet-watch-run -Alias dwr

function dotnet-watch-test {
    dotnet watch test @args
}
Set-Alias -Value dwt -Name dotnet-watch-test
Export-ModuleMember -Function dotnet-watch-test -Alias dwt

function dotnet-sln {
    dotnet sln @args
}
Set-Alias -Value ds -Name dotnet-sln
Export-ModuleMember -Function dotnet-sln -Alias ds

function dotnet-add {
    dotnet add @args
}
Set-Alias -Value da -Name dotnet-add
Export-ModuleMember -Function dotnet-add -Alias da

function dotnet-pack {
    dotnet pack @args
}
Set-Alias -Value dp -Name dotnet-pack
Export-ModuleMember -Function dotnet-pack -Alias dp

function dotnet-nuget {
    dotnet nuget @args
}
Set-Alias -Value dng -Name dotnet-nuget
Export-ModuleMember -Function dotnet-nuget -Alias dng

function dotnet-build {
    dotnet build @args
}
Set-Alias -Value db -Name dotnet-build
Export-ModuleMember -Function dotnet-build -Alias db

function dotnet-tool-list-global {
    dotnet tool list --global `
    | Select-Object -Skip 2 `
    | ForEach-Object { $_.Trim() -replace "\s+","`t" } `
    | ConvertFrom-Csv -Delimiter "`t" -Header "PackageId","Version","Commands"
}
Set-Alias -Value dtlg -Name dotnet-tool-list-global
Export-ModuleMember -Function dotnet-tool-list-global -Alias dtlg

function dotnet-tool-list-local {
    dotnet tool list --local `
    | Select-Object -Skip 2 `
    | ForEach-Object { $_.Trim() -replace "\s+","`t" } `
    | ConvertFrom-Csv -Delimiter "`t" -Header "PackageId","Version","Commands"
}
Set-Alias -Value dtll -Name dotnet-tool-list-local
Export-ModuleMember -Function dotnet-tool-list-local -Alias dtll

function dotnet-tool-update-all-global {
    dotnet-tool-list-global `
    | ForEach-Object { dotnet tool update --global $_.PackageId }
}
Set-Alias -Value dtuag -Name dotnet-tool-update-all-global
Export-ModuleMember -Function dotnet-tool-update-all-global -Alias dtuag
