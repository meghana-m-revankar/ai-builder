namespace FleetTracker.Domain.Entities;

public sealed class Van
{
    public Guid Id { get; private init; }
    public string Plate { get; private set; }
    public string Status { get; private set; }
    public DateTime LastMaintenanceDate { get; private set; }

    private Van() { }

    public Van(string plate, string status, DateTime lastMaintenanceDate)
    {
        Id = Guid.NewGuid();
        Plate = plate;
        Status = status;
        LastMaintenanceDate = lastMaintenanceDate;
    }

    public void UpdateMaintenance(DateTime date)
    {
        LastMaintenanceDate = date;
    }
}
