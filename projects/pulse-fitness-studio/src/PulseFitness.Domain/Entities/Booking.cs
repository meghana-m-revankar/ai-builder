using System;

namespace PulseFitness.Domain.Entities;

public sealed class Booking
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = default!;
    public string Phone { get; private set; } = default!;
    public string Email { get; private set; } = default!;
    public Guid ClassScheduleId { get; private set; }
    public string Status { get; private set; } = "Pending";

    public Booking(string name, string phone, string email, Guid classScheduleId)
    {
        Id = Guid.NewGuid();
        Name = name;
        Phone = phone;
        Email = email;
        ClassScheduleId = classScheduleId;
    }
}