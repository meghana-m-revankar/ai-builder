namespace Portfolio.Domain.Entities;

public sealed class Skill
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = string.Empty;
    public string Category { get; private set; } = string.Empty;
    public int ProficiencyLevel { get; private set; }

    public Skill(string name, string category, int proficiencyLevel)
    {
        Id = Guid.NewGuid();
        Name = name;
        Category = category;
        ProficiencyLevel = proficiencyLevel;
    }
}
