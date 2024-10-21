// ignore_for_file: unused_local_variable

void main(List<String> args) {
  Book book1 = Book(
    title: "Objective C",
    author: "Belaguru Shami",
    isbn: "124561",
    isAvailable: true,
  );
  Book book2 = Book(
    title: "Structured Programming",
    author: "Belaguru Shami",
    isbn: "124590",
    isAvailable: true,
  );

  Member member1 = Member(name: "Mizan", memberID: "01");

  Library library = Library();
  library.addBooks(book1);
  library.addBooks(book2);

  library.loanBooks(book2, member1);
  library.bookLists();
  library.bookLoanLists();
}

// ======create book class ==

class Book {
  String title;
  String author;
  String isbn;
  bool isAvailable;

  Book({
    required this.title,
    required this.author,
    required this.isbn,
    required this.isAvailable,
  });
}

// ======create library class ==
class Library {
  List<Book> books = [];
  List<Loan> loans = [];

  // add books
  void addBooks(Book book) {
    books.add(book);
  }

  void loanBooks(Book book, Member member) {
    if (book.isAvailable) {
      book.isAvailable = false;
      loans.add(Loan(book, member, DateTime.now()));
    } else {
      print("${book.title} book is Not Available");
    }
  }

  // check book lists
  void bookLists() {
    print("====== List Of All Books In Library =====");
    books.forEach(
      (element) {
        String status = "";
        if (element.isAvailable == true) {
          status = "Available";
        } else {
          status = "Unavailable";
        }
        print("Book Name: ${element.title} \n" +
            "Author name: ${element.author} | " +
            "ISBN: ${element.isbn} | " +
            "Status: ${status}" +
            "\n");
      },
    );
  }

  // check loan book lists
  void bookLoanLists() {
    print("====== List Of All Loans Books In Library =====");

    loans.forEach(
      (element) {
        String status = "";
        if (element.book.isAvailable == true) {
          status = "Available";
        } else {
          status = "Unavailable";
        }
        print("Member name: ${element.member.name} | " +
            "Book Name: ${element.book.title} \n" +
            "Author name: ${element.book.author} |" +
            "ISBN: ${element.book.isbn}" +
            "\n");
      },
    );
  }
}

// ======create Member class ==
class Member {
  String name;
  String memberID;
  Member({required this.name, required this.memberID});
}

// ======create Loan class ==
class Loan {
  Book book;
  Member member;
  DateTime loanDate;
  DateTime? returnDate;
  Loan(this.book, this.member, this.loanDate, [this.returnDate]);

  void returnBook() {
    returnDate = DateTime.now();
    book.isAvailable = true;
  }
}
