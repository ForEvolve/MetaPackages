# MetaPackages

This if the home of the ForEvolve Framework meta-packages.

_I should create more meta-packages in the future, hence the plural name of the repository. The next one will aim at unit/integration/end-to-end testing._

## ForEvolve.App

This NuGet package includes all the other ForEvolve application packages.

By referencing this meta-package, it should be easier to use the ForEvolve Framework.
If you prefer fine-grained packages referencing, you can still do it, but you will need to know the packages a little more.

-   VSTS Build: ![VSTS master build](https://forevolve.visualstudio.com/_apis/public/build/definitions/fdc5922a-3dc1-4827-97a6-0f622b2fd497/34/badge)

For more information, see the [Table of content](https://github.com/ForEvolve/Toc) project.

### How to install

```powershell
Install-Package ForEvolve.App
```

or

```powershell
dotnet add package ForEvolve.App
```
