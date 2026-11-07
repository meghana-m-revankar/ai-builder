namespace FleetTracker.Application.DTOs;

public record VanDto(Guid Id, string Plate, string Status, DateTime LastMaintenanceDate);
