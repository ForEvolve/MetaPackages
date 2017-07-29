param(
    [Alias('v')]
    [string]$PackageVersion,
    [string]$ConfigFile = '../../NuGet.config',
    [Alias('c')]
    [string]$Configuration = 'Debug',
    [string]$MetaPackagePackageReferenceVersion = '1.0.0-upsilon-*'
) 

Write-Output 'dotnet clean starting'
dotnet clean
Write-Output 'dotnet clean completed'

Write-Output 'dotnet restore starting'
dotnet restore --configfile $ConfigFile /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
Write-Output 'dotnet restore completed'

Write-Output 'dotnet build starting'
dotnet build src/ForEvolve/ForEvolve.csproj --no-restore -c $Configuration /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
Write-Output 'dotnet build completed'

# Write-Output 'dotnet test starting'
# dotnet test test/ForEvolve.Tests/ForEvolve.Tests.csproj /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
# Write-Output 'dotnet test completed'

# dotnet pack --no-build /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion -c $Configuration