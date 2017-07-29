param(
    [Alias('v')]
    [string]$PackageVersion,
    [string]$ConfigFile = '../../NuGet.config',
    [Alias('c')]
    [string]$Configuration = 'Debug'
)

dotnet clean
dotnet restore --configfile $ConfigFile /p:PackageVersion=$PackageVersion
dotnet build --no-restore -c $Configuration /p:PackageVersion=$PackageVersion
dotnet pack --no-build --no-restore /p:PackageVersion=$PackageVersion -c $Configuration
