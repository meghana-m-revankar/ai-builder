namespace FleetTracker.Application.DTOs;

public record VanDto(Guid Id, string PlateNumber, string Model, string Status, DateTime? LastMaintenanceDate);
