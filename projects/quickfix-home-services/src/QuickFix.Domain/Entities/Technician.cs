namespace QuickFix.Domain.Entities;

public class Technician
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = default!;
    public string Specialty { get; private set; } = default!;
    public string Phone { get; private set; } = default!;
    public bool IsAvailable { get; private set; } = true;
}