using System;

namespace PulseFitness.Domain.Entities;

public enum Intensity { Low, Medium, High }

public sealed class ClassType
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = default!;
    public Intensity Intensity { get; private set; }
    public int DurationMinutes { get; private set; }

    public ClassType(string name, Intensity intensity, int durationMinutes)
    {
        Id = Guid.NewGuid();
        Name = name;
        Intensity = intensity;
        DurationMinutes = durationMinutes;
    }
}