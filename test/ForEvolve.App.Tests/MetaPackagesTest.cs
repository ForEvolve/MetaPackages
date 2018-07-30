using System.Diagnostics;
using ForEvolve.Azure;
using ForEvolve.Markdown;
using Moq;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;
using Microsoft.Extensions.DependencyInjection;

namespace ForEvolve.Tests
{
    public class MetaPackagesTest
    {
        [Fact]
        public void ForEvolve_Contracts_should_be_loaded()
        {
            // Arrange, Act & Assert
            var error = new ForEvolve.Contracts.Errors.Error();
        }

        [Fact]
        public void ForEvolve_AspNetCore_should_be_loaded()
        {
            // Arrange
            var someObject = new { some = "value" };

            // Act & Assert
            var json = someObject.ToJson();
            Assert.NotNull(json);
        }

        [Fact]
        public void ForEvolve_Azure_should_be_loaded()
        {
            // Arrange, Act & Assert
            var exception = new AzureException();
        }

        [Fact]
        public void ForEvolve_Core_should_be_loaded()
        {
            // Arrange, Act & Assert
            var exception = new ForEvolveException();
        }

#if NETCORE2
        [Fact]
        public void ForEvolve_AspNetCore_Localization_should_be_loaded()
        {
            // Arrange, Act & Assert
            var options = new ForEvolve.AspNetCore.Localization.ForEvolveLocalizationOptions();
        }
#endif

        [Fact]
        public void ForEvolve_Markdown_should_be_loaded(){
            var options = new MarkdigOptions();
        }
    }
}
