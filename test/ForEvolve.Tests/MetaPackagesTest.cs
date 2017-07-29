using ForEvolve.ApplicationInsights;
using ForEvolve.Azure;
using Moq;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace ForEvolve.Tests
{
    public class MetaPackagesTest
    {
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
    }
}
