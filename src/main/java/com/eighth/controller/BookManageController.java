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

    // 分页处理
    @RequestMapping("/bookCommon")
    public String common(HttpServletRequest request, Page page) {

        HttpSession session = request.getSession();

        // 本行必须在执行sql语句之前
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Books> booksList = null;
        if ("showBookSort".equals(session.getAttribute("operation"))) {
            String sortname = (String) session.getAttribute("sortname");
            int sortId = sortServiceImpl.showSortId(sortname);
            // 显示指定分类的书籍
            booksList = booksServiceImpl.showSortBook(sortId);
            session.removeAttribute("operation");
        } else {
            // 查询所有书籍
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

    // 设置书籍是否可借阅
    @RequestMapping("setBorrowStatus")
    public String setBorrowStatus(HttpServletRequest request, Books book) {

        if (book.getBorrow() == 0) {
            book.setBorrow(1);
        } else {
            book.setBorrow(0);
        }
        // 更新是否可借阅的状态
        booksServiceImpl.updateByPrimaryKey(book);

        return "forward:/bookCommon?start=0";
    }

    // 查看书籍详情
    @RequestMapping("showBookDetail")
    public ModelAndView showBookDetail(HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView();

        int bookId = Integer.valueOf(request.getParameter("bookId"));

        Books book = booksServiceImpl.selectByPrimaryKey(bookId);   // 查询指定id的书
        HttpSession session = request.getSession();
        session.setAttribute("book", book);
        modelAndView.setViewName("admin/bookDetail");

        return modelAndView;
    }

    // 删除
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
            request.setAttribute("hint", "删除成功");
        }else {
            request.setAttribute("hint", "删除失败");
        }

        return "forward:/bookCommon?start=0";
    }

    // 搜索
    @RequestMapping("/searchBook")
    public ModelAndView searchBook(HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        String information = request.getParameter("information");
        int condition = Integer.valueOf(request.getParameter("condition"));
        List<Books> booksList;
        if (1==condition) { // 按书名查询
            booksList = booksServiceImpl.searchByBookName(information);
        } else { // 按作者名查询
            booksList = booksServiceImpl.searchByAuthor(information);
        }
        session.setAttribute("booksList", booksList);
        session.setAttribute("info", information);  // 绑定用户输入的信息
        session.setAttribute("flag", condition);    // 绑定用户选择的搜索条件
        modelAndView.setViewName("admin/Book_Manage");

        return modelAndView;
    }

    // 显示指定分类的书籍
    @RequestMapping("showSortBook")
    public String showBookSort(HttpServletRequest request, Sort sort) {

        // 将从Book_Manage.jsp中传递过来的sortname请求参数绑定到session中
        String sortname = request.getParameter("sortname");
        //System.out.println("分类名称:" + sortname);
        HttpSession session = request.getSession();
        session.setAttribute("sortname", sortname);

        // 标记本方法
        request.getSession().setAttribute("operation", "showBookSort");

        return "forward:/bookCommon?start=0";
    }

    // 显示左侧的书籍分类、右侧的所有书籍信息
    @RequestMapping("/Book_Manage")
    public String showBookSort(HttpServletRequest request) {

        HttpSession session = request.getSession();

        List<Sort> sortList = sortServiceImpl.showSort(); // 分类
        session.setAttribute("sortList", sortList);
        // 建立分类号和分类名称的映射
        Map<Integer, String> map = new HashMap<>();
        for (int i=1; i<=22; i++) {
            map.put(i, sortList.get(i-1).getName());
        }
        session.setAttribute("map", map);

        return "forward:/bookCommon?start=0";
    }

    // 跳转添加书籍页面
    @RequestMapping("/addBookUI")
    public String addUser() {
        return "admin/addBookUI";
    }

    // 添加图书文字信息+图书图片
    @RequestMapping("/addBook")
    public String addBook(@RequestParam("bookImage") MultipartFile bookImage, HttpServletRequest request, Books book) throws Exception {

        HttpSession session = request.getSession();
        String username = ((User)session.getAttribute("user")).getUsername();
        System.out.println(username);
        book.setUsername(username); // 操作人
        book.setCreatetime(new Date()); // 添加时间
        // book.setCreatetime(new TimeStamp(new Date().getTime()));
        book.setVisit(0);   // 访问量

        // 文件名
        String name = String.valueOf(book.getCreatetime().getTime());
        // 获取文件扩展名
        String ext = FilenameUtils.getExtension(bookImage.getOriginalFilename());
        // 设置图片上传路径
        String url = request.getSession().getServletContext().getRealPath("/images/book");
        System.out.println(url);
        bookImage.transferTo(new File(url + "/" + name + "." + ext));
        // 将图片存储路径保存到数据库
        book.setImage("images/book/" + name + "." + ext);

        System.out.println(book.toString());

        int count = booksServiceImpl.addBook(book);  // 添加书籍
        if (count==1) {
            request.setAttribute("hint", "添加成功");
        }else {
            request.setAttribute("hint", "添加失败");
        }

        return "admin/addBookUI";
    }
}