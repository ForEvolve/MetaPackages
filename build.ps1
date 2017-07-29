param(
    [Alias('v')]
    [string]$PackageVersion,
    [string]$ConfigFile = '../../NuGet.config',
    [Alias('c')]
    [string]$Configuration = 'Debug',
    [string]$MetaPackagePackageReferenceVersion = '1.0.0-upsilon-*',
    [Alias('o')]
    [string]$OutputDirectory = '../../nuget-packages'
) 

dotnet clean
dotnet restore --configfile $ConfigFile /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
dotnet build src/ForEvolve/ForEvolve.csproj --no-restore -c $Configuration /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion --output $OutputDirectory
dotnet test test/ForEvolve.Tests/ForEvolve.Tests.csproj /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
# dotnet pack --no-build /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion -c $Configuration