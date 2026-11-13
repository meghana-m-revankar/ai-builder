using System;

namespace BookNook.Domain.Entities;

public sealed class Book
{
    public Guid Id { get; private set; }
    public string Title { get; private set; }
    public string Author { get; private set; }
    public string Category { get; private set; }
    public string Isbn { get; private set; }
    public int TotalCopies { get; private set; }
    public int AvailableCopies { get; private set; }
    public DateTime CreatedAt { get; private set; }
    public DateTime UpdatedAt { get; private set; }

    public Book(string title, string author, string category, string isbn, int totalCopies)
    {
        Id = Guid.NewGuid();
        Title = title;
        Author = author;
        Category = category;
        Isbn = isbn;
        TotalCopies = totalCopies;
        AvailableCopies = totalCopies;
        CreatedAt = DateTime.UtcNow;
        UpdatedAt = DateTime.UtcNow;
    }
}
