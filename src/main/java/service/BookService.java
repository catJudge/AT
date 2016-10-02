package service;

import controller.responses.BookResponse;
import dao.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import persistence.Book;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BookService {

    @Autowired
    BookDao bookDao;

    @Autowired
    UserService userService;

    public boolean insertBook(Book book) {
        return bookDao.insertBook(book);
    }

    public boolean updateBook(Book book) {
        return bookDao.updateBook(book);
    }

    public boolean deleteBook(Long isn) {
        return bookDao.deleteBook(isn);
    }

    public List<BookResponse> getBooks(Long offset, Long count) {
        List<Book> books = bookDao.getBooks(offset, count);
        return books.stream().map(
                book -> new BookResponse(book, book.ownerId != 0 ? userService.getLoginById(book.ownerId) : null)
        ).collect(Collectors.toList());
    }

    public void takeBook(Long isn) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = user.getUsername();
        persistence.User idByLogin = userService.getIdByLogin(name);
        bookDao.takeBook(idByLogin.getId(), isn);
    }

    public void returnBook(Long isn) {
        bookDao.returnBook(isn);
    }
}
