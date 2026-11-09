using PulseFitness.Domain.Entities;

namespace PulseFitness.Application.DTOs;

public record ClassScheduleDto(Guid Id, string ClassName, string TrainerName, DateTime StartTime, DateTime EndTime);