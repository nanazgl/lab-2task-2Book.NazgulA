//
//  main.swift
//  lab#2task#2Book
//
//  Created by Nazgul Atykhan 
//
class Book {
    let title: String
    let author: String
    let year: Int
    let pageCount: Int
    
    init(title: String, author: String, year: Int, pageCount: Int) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }
    
    func displayBookInfo() {
        print("Title: \(title)")
        print("Author: \(author)")
        print("Year: \(year)")
        print("Page Count: \(pageCount)")
    }
}

class Library {
    var books: [Book]
    
    init() {
        self.books = []
    }
    
    func addBook(book: Book) {
        books.append(book)
        print("Book added to the library.")
    }
    
    func removeBook(at index: Int) {
        guard index >= 0 && index < books.count else {
            print("Invalid book index.")
            return
        }
        let removedBook = books.remove(at: index)
        print("Book '\(removedBook.title)' was removed from the library.")
    }
    
    func displayAllBooks() {
        if books.isEmpty {
            print("The library is empty.")
        } else {
            print("Books in the library:")
            for (index, book) in books.enumerated() {
                print("\(index + 1). \(book.title) by \(book.author) - \(book.pageCount) pages")
            }
        }
    }
}

let book1 = Book(title: "Will", author: "Will Smith", year: 2021, pageCount: 432)
let book2 = Book(title: "Little women", author: "Louisa May Alcott", year: 1868, pageCount: 528)
let book3 = Book(title: "The little prince", author: "Antoine de Saint-Exupéry", year: 1943, pageCount: 128)
let book4 = Book(title: "Pachinko", author: "Min Jin Lee", year: 2017, pageCount: 496)
let book5 = Book(title: "Love in the Big City", author: "Sang Young Park", year: 2021, pageCount: 240)
let book6 = Book(title: "Please Look After Mom", author: "Kyung-Sook Shin", year: 2008, pageCount: 272)

let library = Library()

library.addBook(book: book1)
library.addBook(book: book2)
library.addBook(book: book3)
library.addBook(book: book4)
library.addBook(book: book5)
library.addBook(book: book6)


library.displayAllBooks()

print("Do you want to remove a book? (y/n)")
if let removeChoice = readLine(), removeChoice.lowercased() == "y" {
    print("Enter the number of the book you want to remove:")
    if let input = readLine(), let index = Int(input) {
        library.removeBook(at: index - 1)
    } else {
        print("Invalid input.")
    }
} else {
    print("No book removed.")
}

library.displayAllBooks()
