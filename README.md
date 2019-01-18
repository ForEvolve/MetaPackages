# MetaPackages

This if the home of the ForEvolve Framework meta-packages.

_I may create more meta-packages in the future, hence the plural name of the repository. The next one may aim at unit/integration/end-to-end testing._

## ForEvolve.App

This NuGet package includes all the other ForEvolve application packages.

By referencing this meta-package, it should be easier to use the ForEvolve Framework.
If you prefer fine-grained packages referencing, you can still do it, but you will need to know the packages a little more.

-   VSTS Build: [![Build Status](https://forevolve.visualstudio.com/ForEvolve-Framework/_apis/build/status/ForEvolve.App)](https://forevolve.visualstudio.com/ForEvolve-Framework/_build/latest?definitionId=34)

For more information, see the [Table of content](https://github.com/ForEvolve/Toc) project.

### How to install

```powershell
Install-Package ForEvolve.App
```

or

```powershell
dotnet add package ForEvolve.App
```

### Patch notes:

#### 1.1.0
Update `ForEvolve.AspNetCore.Localization` to version `1.2.0` (adding Spanish).

#### 1.0.0
Initial package.
