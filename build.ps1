param(
    [Alias('v')]
    [string]$PackageVersion,
    [string]$MetaPackagePackageReferenceVersion,
    [string]$ConfigFile = '../../NuGet.config',
    [Alias('c')]
    [string]$Configuration = 'Debug',
    [string]$PackageOutput = '.'
) 

$TraceColor = 'DarkCyan'

Write-Host 'dotnet clean starting' -foregroundcolor $TraceColor
dotnet clean
Write-Host 'dotnet clean completed' -foregroundcolor $TraceColor

Write-Host 'dotnet build starting' -foregroundcolor $TraceColor
dotnet build src/ForEvolve.App/ForEvolve.App.csproj -c $Configuration /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
Write-Host 'dotnet build completed' -foregroundcolor $TraceColor

Write-Host 'dotnet test starting' -foregroundcolor $TraceColor
dotnet test test/ForEvolve.App.Tests/ForEvolve.App.Tests.csproj /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
Write-Host 'dotnet test completed' -foregroundcolor $TraceColor

Write-Host 'dotnet pack starting' -foregroundcolor $TraceColor
dotnet pack --no-build /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion -c $Configuration -o $PackageOutput
Write-Host 'dotnet pack completed' -foregroundcolor $TraceColor
