package com.eighth.controller;

import com.eighth.pojo.Books;
import com.eighth.pojo.Sort;
import com.eighth.pojo.User;
import com.eighth.service.impl.BooksServiceImpl;
import com.eighth.service.impl.SortServiceImpl;
import com.eighth.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

/**
 * Created by zkyq on 19-5-20.
 */
@Controller
public class BookManageController {

    @Autowired
    BooksServiceImpl booksServiceImpl;

    @Autowired
    SortServiceImpl sortServiceImpl;

    // ��ҳ����
    @RequestMapping("/bookCommon")
    public String common(HttpServletRequest request, Page page) {

        HttpSession session = request.getSession();

        // ���б�����ִ��sql���֮ǰ
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Books> booksList = null;
        if ("showBookSort".equals(session.getAttribute("operation"))) {
            String sortname = (String) session.getAttribute("sortname");
            int sortId = sortServiceImpl.showSortId(sortname);
            // ��ʾָ��������鼮
            booksList = booksServiceImpl.showSortBook(sortId);
            session.removeAttribute("operation");
        } else {
            // ��ѯ�����鼮
            booksList = booksServiceImpl.showBooks();
        }

        int total = (int) new PageInfo<>(booksList).getTotal();
        //System.out.println("total:" + total);

        page.setTotal(total);
        page.caculateLast(total);
        page.setCurrentPage(page.getStart()/page.getCount()+1);
        page.setLastPage(page.getLast()/page.getCount()+1);

        request.setAttribute("booksList", booksList);

        return "admin/Book_Manage";
    }

    // �����鼮�Ƿ�ɽ���
    @RequestMapping("setBorrowStatus")
    public String setBorrowStatus(HttpServletRequest request, Books book) {

        if (book.getBorrow() == 0) {
            book.setBorrow(1);
        } else {
            book.setBorrow(0);
        }
        // �����Ƿ�ɽ��ĵ�״̬
        booksServiceImpl.updateByPrimaryKey(book);

        return "forward:/bookCommon?start=0";
    }

    // �鿴�鼮����
    @RequestMapping("showBookDetail")
    public ModelAndView showBookDetail(HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView();

        int bookId = Integer.valueOf(request.getParameter("bookId"));

        Books book = booksServiceImpl.selectByPrimaryKey(bookId);   // ��ѯָ��id����
        HttpSession session = request.getSession();
        session.setAttribute("book", book);
        modelAndView.setViewName("admin/bookDetail");

        return modelAndView;
    }

    // ɾ��
    @RequestMapping("/deleteBook")
    public String deleteBook(HttpServletRequest request) {

        List<Integer> bookId = new ArrayList<>();
        int id;
        String[] value = request.getParameterValues("delid");
        for (String str : value) {
            id = Integer.valueOf(str);
            bookId.add(id);
        }
        int count = booksServiceImpl.deleteBook(bookId);
        if (count!=0) {
            request.setAttribute("hint", "ɾ���ɹ�");
        }else {
            request.setAttribute("hint", "ɾ��ʧ��");
        }

        return "forward:/bookCommon?start=0";
    }

    // ����
    @RequestMapping("/searchBook")
    public ModelAndView searchBook(HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        String information = request.getParameter("information");
        int condition = Integer.valueOf(request.getParameter("condition"));
        List<Books> booksList;
        if (1==condition) { // ��������ѯ
            booksList = booksServiceImpl.searchByBookName(information);
        } else { // ����������ѯ
            booksList = booksServiceImpl.searchByAuthor(information);
        }
        session.setAttribute("booksList", booksList);
        session.setAttribute("info", information);  // ���û��������Ϣ
        session.setAttribute("flag", condition);    // ���û�ѡ�����������
        modelAndView.setViewName("admin/Book_Manage");

        return modelAndView;
    }

    // ��ʾָ��������鼮
    @RequestMapping("showSortBook")
    public String showBookSort(HttpServletRequest request, Sort sort) {

        // ����Book_Manage.jsp�д��ݹ�����sortname��������󶨵�session��
        String sortname = request.getParameter("sortname");
        //System.out.println("��������:" + sortname);
        HttpSession session = request.getSession();
        session.setAttribute("sortname", sortname);

        // ��Ǳ�����
        request.getSession().setAttribute("operation", "showBookSort");

        return "forward:/bookCommon?start=0";
    }

    // ��ʾ�����鼮���ࡢ�Ҳ�������鼮��Ϣ
    @RequestMapping("/Book_Manage")
    public String showBookSort(HttpServletRequest request) {

        HttpSession session = request.getSession();

        List<Sort> sortList = sortServiceImpl.showSort(); // ����
        session.setAttribute("sortList", sortList);
        // ��������źͷ������Ƶ�ӳ��
        Map<Integer, String> map = new HashMap<>();
        for (int i=1; i<=22; i++) {
            map.put(i, sortList.get(i-1).getName());
        }
        session.setAttribute("map", map);

        return "forward:/bookCommon?start=0";
    }

    // ��ת����鼮ҳ��
    @RequestMapping("/addBookUI")
    public String addUser() {
        return "admin/addBookUI";
    }

    // ���ͼ��������Ϣ+ͼ��ͼƬ
    @RequestMapping("/addBook")
    public String addBook(@RequestParam("bookImage") MultipartFile bookImage, HttpServletRequest request, Books book) throws Exception {

        HttpSession session = request.getSession();
        String username = ((User)session.getAttribute("user")).getUsername();
        System.out.println(username);
        book.setUsername(username); // ������
        book.setCreatetime(new Date()); // ���ʱ��
        // book.setCreatetime(new TimeStamp(new Date().getTime()));
        book.setVisit(0);   // ������

        // �ļ���
        String name = String.valueOf(book.getCreatetime().getTime());
        // ��ȡ�ļ���չ��
        String ext = FilenameUtils.getExtension(bookImage.getOriginalFilename());
        // ����ͼƬ�ϴ�·��
        String url = request.getSession().getServletContext().getRealPath("/images/book");
        System.out.println(url);
        bookImage.transferTo(new File(url + "/" + name + "." + ext));
        // ��ͼƬ�洢·�����浽���ݿ�
        book.setImage("images/book/" + name + "." + ext);

        System.out.println(book.toString());

        int count = booksServiceImpl.addBook(book);  // ����鼮
        if (count==1) {
            request.setAttribute("hint", "��ӳɹ�");
        }else {
            request.setAttribute("hint", "���ʧ��");
        }

        return "admin/addBookUI";
    }
}