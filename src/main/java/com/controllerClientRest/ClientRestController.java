package com.controllerClientRest;

import com.dto.BookWarehouseDto;
import com.dto.CustomerDto;
import com.service.CustomerService;
import com.serviceClientRest.ClientRestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import javax.validation.Valid;
import java.io.IOException;
import java.net.URISyntaxException;
import java.security.Principal;
import java.util.List;

@SessionAttributes("bookWarehouse")
@Controller
public class ClientRestController {

    @Autowired
    @Qualifier("clientRestService")
    private ClientRestService clientRestService;

    @RequestMapping(value = "/addBookInClientSideSave", method = RequestMethod.POST)
    public String addBookInClientSideSave(@Valid @ModelAttribute BookWarehouseDto bookWarehouseDto, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {

            return "addBookInClientSidePage";
        } else {
            clientRestService.addBookInClientSide(bookWarehouseDto);

            return "redirect:/getbookWarehouseDtoBySellerName";
        }

    }

    @RequestMapping(value = "/getbookWarehouseDtoById/{bookId}", method = RequestMethod.GET)
    public String getbookWarehouseDtoById(@PathVariable int bookId, Model model) {
        BookWarehouseDto bookWarehouseDto = clientRestService.getbookWarehouseDtoById(bookId);
        model.addAttribute("bookWarehouse", bookWarehouseDto);

        return "getbookWarehouseDtoByIdPage";
    }

    @RequestMapping(value = "/getbookWarehouseDtoBySellerName", method = RequestMethod.GET)
    public String getbookWarehouseDtoBySellerName(Principal principal, Model model) {
        String sellerName = principal.getName();

        List<BookWarehouseDto> bookWarehouseDto = clientRestService.getbookWarehouseDtoBySellerName(sellerName);
        model.addAttribute("bookWarehouseDto", bookWarehouseDto);

        return "getbookWarehouseDtoBySellerNamePage";
    }

    @RequestMapping(value = "/updateBookInClientSide", method = RequestMethod.POST)
    public String updateBookInClientSide(@Valid @ModelAttribute BookWarehouseDto bookWarehouseDto, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "editBookPage";
        } else {
            clientRestService.updateBookInClientSide(bookWarehouseDto);

            return "redirect:/getbookWarehouseDtoBySellerName";
        }
    }

    @RequestMapping(value = "/getbookWarehouseDtoByBookName/{bookName}", method = RequestMethod.GET)
    public String getbookWarehouseDtoByBookName(@PathVariable String bookName, Model model) {
        BookWarehouseDto bookWarehouseDto = clientRestService.getbookWarehouseDtoByBookName(bookName);
        model.addAttribute("bookWarehouseDto", bookWarehouseDto);

        return "getbookWarehouseDtoByBookNamePage";
    }

    @RequestMapping(value = "/deleteBookInClientSide/{bookId}", method = RequestMethod.GET)
    public String deleteBookInClientSideSave(@PathVariable int bookId) {
        clientRestService.deleteBookInClientSide(bookId);

        return "redirect:/getbookWarehouseDtoBySellerName";
    }

}
