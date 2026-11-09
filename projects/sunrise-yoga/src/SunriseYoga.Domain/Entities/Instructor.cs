namespace SunriseYoga.Domain.Entities;

public sealed class Instructor
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public string? Bio { get; private set; }
    public string? Specialty { get; private set; }
    public DateTime CreatedAt { get; private set; }
    public DateTime UpdatedAt { get; private set; }
    public Guid? CreatedBy { get; private set; }
    public Guid? UpdatedBy { get; private set; }
    public DateTime? DeletedAt { get; private set; }

    private Instructor() { }
    
    public static Instructor Create(string name, string? bio, string? specialty)
    {
        return new Instructor
        {
            Id = Guid.NewGuid(),
            Name = name,
            Bio = bio,
            Specialty = specialty,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };
    }
}
