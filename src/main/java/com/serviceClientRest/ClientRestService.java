package com.serviceClientRest;

import com.dto.BookWarehouseDto;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface ClientRestService {

    /**
     * To add book in server database by rest
     * @param bookWarehouseDto
     * @return
     */
    ResponseEntity<Integer> addBookInClientSide(BookWarehouseDto bookWarehouseDto);

    /**
     * To update book in server database by rest
     * @param bookWarehouseDto
     * @return
     */
    ResponseEntity<Integer> updateBookInClientSide(BookWarehouseDto bookWarehouseDto);

    /**
     * To get book bu seller name from server database by rest
     * @param sellerName
     * @return
     */
    List<BookWarehouseDto> getbookWarehouseDtoBySellerName(String sellerName);

    /**
     * To get all book from server database by rest
     * @return
     */
    List<BookWarehouseDto> getAllbookWarehouseDto();

    /**
     * To get book by id book from server database by rest
     * @param bookId
     * @return
     */
    BookWarehouseDto getbookWarehouseDtoById(int bookId);

    /**
     * To get book by name from server database by rest
     * @param bookName
     * @return
     */
    BookWarehouseDto getbookWarehouseDtoByBookName(String bookName);

    /**
     * To delete book by id in server database by rest
     * @param bookId
     * @return
     */
    ResponseEntity<Integer> deleteBookInClientSide(int bookId);

}
