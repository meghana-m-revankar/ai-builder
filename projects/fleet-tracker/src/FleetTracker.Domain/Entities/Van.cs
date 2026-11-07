namespace FleetTracker.Domain.Entities;

public enum VanStatus
{
    Active,
    InMaintenance,
    Retired
}

public class Van
{
    public Guid Id { get; set; }
    public string PlateNumber { get; set; } = string.Empty;
    public string Model { get; set; } = string.Empty;
    public VanStatus Status { get; set; }
    public DateTime? LastMaintenanceDate { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}
