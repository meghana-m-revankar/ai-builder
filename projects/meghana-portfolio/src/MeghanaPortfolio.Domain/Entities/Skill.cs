namespace MeghanaPortfolio.Domain.Entities;

public sealed class Skill
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = default!;
    public string Category { get; private set; } = default!;
    public int ProficiencyLevel { get; private set; }

    public static Skill Create(string name, string category, int proficiency)
    {
        // TODO: Add guard clauses for range 1-5
        return new Skill { Id = Guid.NewGuid(), Name = name, Category = category, ProficiencyLevel = proficiency };
    }
}
