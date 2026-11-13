namespace BookNook.Application.DTOs;

public record BookDto(Guid Id, string Title, string Author, string Category, string Isbn, int TotalCopies, int AvailableCopies);
