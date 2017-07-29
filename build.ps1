param(
    [Alias('v')]
    [string]$PackageVersion,
    [string]$ConfigFile = '../../NuGet.config',
    [Alias('c')]
    [string]$Configuration = 'Debug',
    [string]$MetaPackagePackageReferenceVersion = '1.0.0-upsilon-*'
) 

dotnet clean
dotnet restore --configfile $ConfigFile /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
dotnet build --no-restore -c $Configuration /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
dotnet test test/ForEvolve.Tests/ForEvolve.Tests.csproj /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion
# dotnet pack --no-build /p:PackageVersion=$PackageVersion /p:MetaPackagePackageReferenceVersion=$MetaPackagePackageReferenceVersion -c $Configuration