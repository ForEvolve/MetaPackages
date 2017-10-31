using System.Diagnostics;
using ForEvolve.ApplicationInsights;
using ForEvolve.Azure;
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
        public void ForEvolve_ApiContracts_should_be_loaded()
        {
            // Arrange, Act & Assert
            var error = new ForEvolve.Api.Contracts.Errors.Error();
        }

        [Fact]
        public void ForEvolve_ApplicationInsights_should_be_loaded()
        {
            // Arrange
            var telemetryClientMock = new Mock<ITelemetryClient>();

            // Act & Assert
            var c = new TrackExceptionsFilterAttribute(telemetryClientMock.Object);
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
    }
}
