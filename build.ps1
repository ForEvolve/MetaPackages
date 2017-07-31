param(
    [Alias('v')]
    [string]$PackageVersion,
    [string]$ConfigFile = '../../NuGet.config',
    [Alias('c')]
    [string]$Configuration = 'Debug',
    [string]$MetaPackagePackageReferenceVersion = '1.0.0-upsilon-*'
) 

$TraceColor = 'DarkCyan'

Write-Host 'dotnet clean starting' -foregroundcolor $TraceColor
dotnet clean
Write-Host 'dotnet clean completed' -foregroundcolor $TraceColor

Write-Host 'dotnet restore starting' -foregroundcolor $TraceColor
dotnet restore --configfile $ConfigFile /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
Write-Host 'dotnet restore completed' -foregroundcolor $TraceColor

Write-Host 'dotnet build starting' -foregroundcolor $TraceColor
dotnet build src/ForEvolve/ForEvolve.csproj -c $Configuration /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
Write-Host 'dotnet build completed' -foregroundcolor $TraceColor

Write-Host 'dotnet test starting' -foregroundcolor $TraceColor
dotnet test test/ForEvolve.Tests/ForEvolve.Tests.csproj /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
Write-Host 'dotnet test completed' -foregroundcolor $TraceColor

# dotnet pack --no-build /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion -c $Configuration