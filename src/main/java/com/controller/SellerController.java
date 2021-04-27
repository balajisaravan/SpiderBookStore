package com.controller;

import com.dto.BookWarehouseDto;
import com.dto.CustomerDto;
import com.service.CustomerService;
import com.serviceClientRest.ClientRestService;
import com.serviceClientRest.ClientRestServiceImpl;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

@Controller
public class SellerController extends AbstractController{

    @Autowired
    @Qualifier("clientRestService")
    private ClientRestService clientRestService;

    @Autowired
    @Qualifier("customerService")
    private CustomerService customerService;

    private static final Logger logger = LogManager.getLogger(ClientRestServiceImpl.class);

    @RequestMapping(value = "/seller", method = RequestMethod.GET)
    public String seller(Model model) {
        List<BookWarehouseDto> bookWarehouseDto = clientRestService.getAllbookWarehouseDto();
        model.addAttribute("bookWarehouseDto", bookWarehouseDto);

        return "sellerPage";
    }

    @RequestMapping(value = "/addBookInClientSide", method = RequestMethod.GET)
    public String addBookInClientSide(Model model) {
        model.addAttribute("bookWarehouseDto", new BookWarehouseDto());

        return "addBookInClientSidePage";
    }

    @RequestMapping(value = "/listOfBooks", method = RequestMethod.GET)
    public String listOfBooks(Model model) {
        List<BookWarehouseDto> bookWarehouseDto = clientRestService.getAllbookWarehouseDto();
        model.addAttribute("bookWarehouseDto", bookWarehouseDto);

        return "listOfBooksPage";
    }

    @RequestMapping(value = "/editBook/{bookId}", method = RequestMethod.GET)
    public String editBook(@PathVariable int bookId, Model model) {
        BookWarehouseDto bookWarehouseDto = clientRestService.getbookWarehouseDtoById(bookId);
        try {
                if(bookWarehouseDto!=null){
                    model.addAttribute("bookWarehouseDto", bookWarehouseDto);
                    return "editBookPage";
            }else{
                    return "errorPage";
                }
        } catch (NullPointerException e) {
            getLogger().error("Execption in editBook", e);
            return "errorPage";
        }
    }

    public static Logger getLogger() {
        return logger;
    }
}
