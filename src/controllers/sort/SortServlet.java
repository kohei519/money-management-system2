package controllers.sort;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Report;
import utils.DBUtil;

/**
 * Servlet implementation class SortServlet
 */
@WebServlet("/SortServlet")
public class SortServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Date sd = null;
        if(request.getParameter("start_date") != null &&  !request.getParameter("start_date").equals("")) {
          sd = Date.valueOf(request.getParameter("start_date"));
        } else {
            sd = Date.valueOf("2000-01-01");
        }

        Date ed = null;
        if(request.getParameter("end_date") != null &&  !request.getParameter("end_date").equals("")) {
          ed = Date.valueOf(request.getParameter("end_date"));
        } else {
            ed = Date.valueOf("2030-01-01");
        }

        List<Integer> a = new ArrayList<>();
        if(request.getParameter("account") != null &&  request.getParameter("account").equals("0")) {
          a.add(0);
        } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("1")) {
          a.add(1);
        } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("2")) {
            a.add(2);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("3")) {
              a.add(3);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("4")) {
              a.add(4);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("5")) {
              a.add(5);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("6")) {
              a.add(6);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("7")){
            a.add(0);
            a.add(1);
            a.add(2);
            a.add(3);
            a.add(4);
            a.add(5);
            a.add(6);
        }

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }

        List<Report> reports = em.createNamedQuery("getSortReports", Report.class)
                .setParameter("start_date", sd)
                .setParameter("end_date", ed)
                .setParameter("account", a)
                .setFirstResult(15 * (page - 1))
                .setMaxResults(15)
                .getResultList();

        long reports_count = (long)em.createNamedQuery("getSortReportsCount", Long.class)
                .setParameter("start_date", sd)
                .setParameter("end_date", ed)
                .setParameter("account", a)
                .getSingleResult();

        em.close();

        request.setAttribute("reports", reports);
        request.setAttribute("reports_count", reports_count);
        request.setAttribute("page", page);
        request.setAttribute("start_date", sd);
        request.setAttribute("end_date", ed);
        if(request.getParameter("account") != null &&  request.getParameter("account").equals("0")) {
            request.setAttribute("account", 0);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("1")) {
              request.setAttribute("account", 1);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("2")){
              request.setAttribute("account", 2);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("3")){
              request.setAttribute("account", 3);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("4")){
              request.setAttribute("account", 4);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("5")){
              request.setAttribute("account", 5);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("6")){
              request.setAttribute("account", 6);
          } else if(request.getParameter("account") != null &&  request.getParameter("account").equals("7")){
              request.setAttribute("account", 7);
          }


        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reports/index.jsp");
        rd.forward(request, response);

    }

}
