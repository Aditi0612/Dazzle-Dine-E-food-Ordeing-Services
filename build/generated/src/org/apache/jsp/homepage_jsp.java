package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class homepage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Online Food Delivery Services | Dazzle 'n Dine.com</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("    <link rel=\"stylesheet\" media=\"screen and (max-width:900px)\" href=\"css/phone.css\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Baloo+Tamma+2&display=swap\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap\" rel=\"stylesheet\">\n");
      out.write("    <script src=\"https://kit.fontawesome.com/a2d8927283.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <nav id=\"navbar\">\n");
      out.write("        <div id=\"logo\">\n");
      out.write("            <img src=\"Dazzle 'n Dine.png\" alt=\"Dazzle 'n Dine.com\">\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"#home\">Home</a></li>\n");
      out.write("            <li><a href=\"#about-us\">About Us</a></li>\n");
      out.write("            <li><a href=\"#services-cont\">Specialities</a></li>\n");
      out.write("            <li><a href=\"#client-section\">Reviews</a></li>\n");
      out.write("            <li><a href=\"#contact\">Contact Us</a></li>\n");
      out.write("            <li><a href=\"dummyMenu.jsp\">Menu</a></li>\n");
      out.write("            <li><a href=\"\">Login\n");
      out.write("                    <span class=\"arrow\">&#x25BC;</span>\n");
      out.write("                </a>\n");
      out.write("                <ul class=\"submenu\">\n");
      out.write("                    <li><a href=\"login_admin.jsp\">Admin</a></li>\n");
      out.write("                    <li><a href=\"login_employee.jsp\">Employee</a></li>\n");
      out.write("                    <li><a href=\"Login_customer.jsp\">Customer</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <li><a href=\"#\">Register\n");
      out.write("                    <span class=\"arrow\">&#x25BC;</span>\n");
      out.write("                </a>\n");
      out.write("                <ul class=\"submenu\">\n");
      out.write("                    <li><a href=\"register_admin.jsp\">Admin</a></li>\n");
      out.write("                    <li><a href=\"register_customer.jsp\">Customer</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <section id=\"home\">\n");
      out.write("        <h1 class=\"h-primary\">\n");
      out.write("            Welcome to Dazzle 'n Dine\n");
      out.write("        </h1>\n");
      out.write("        <p>To all the food lovers out there we are here to give you an amazing food experience</p>\n");
      out.write("        <p>Nothing is more magical and healing than a scumptious meal</p>\n");
      out.write("        <p>So what are you waiting for?</p>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <section id=\"about-us\">\n");
      out.write("        <h1 class=\"h-primary\">About Us</h1>\n");
      out.write("        <div id=\"about-box\">\n");
      out.write("            <p>Delicious and fresh food is something we as Indians always look forward to.</p>\n");
      out.write("            <p>With this vision Dazzle 'n Dine, a fine dining restaurant was opened in Delhi 2009.</p>\n");
      out.write("            <p>It has won various awards in hospitality sector in various categories over the years.</p>\n");
      out.write("            <p>Amidst the pandemic, in order to ensure the health of our customers & employees,</p>\n");
      out.write("            <p>Dazzle 'n Dine has intrduced its e-food ordering services through a easy process.</p>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <section id=\"services-cont\">\n");
      out.write("        <h1 class=\"h-primary\">Specialities</h1>\n");
      out.write("        <div id=\"services\">\n");
      out.write("            <div class=\"box\">\n");
      out.write("                <img src=\"speciality1.jpg\" alt=\"\">\n");
      out.write("                <h2 class=\"h-secondary \">Cheese Burst Pizza</h2>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"box\">\n");
      out.write("                <img src=\"speciality5.jpg\" alt=\"\">\n");
      out.write("                <h2 class=\"h-secondary \">Masala Dosa</h2>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"box\">\n");
      out.write("                <img src=\"speciality3.jpg\" alt=\"\">\n");
      out.write("                <h2 class=\"h-secondary \">Kesar Jalebi</h2>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"box\">\n");
      out.write("                <img src=\"speciality4.jpg\" alt=\"\">\n");
      out.write("                <h2 class=\"h-secondary \">Malai Kofta</h2>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <section id=\"client-section\">\n");
      out.write("        <h1 class=\"h-primary\">Reviews</h1>\n");
      out.write("        <div id=\"clients\">\n");
      out.write("            <div class=\"box1\">\n");
      out.write("                <img src=\"4_star.jpg\" alt=\"\">\n");
      out.write("                <p>A very good place to order food from for any occasions. Delicious food, quick service & easy process\n");
      out.write("                    <b><i>~ Dinesh Kumar</i></b></p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"box1\">\n");
      out.write("                <img src=\"4_star.jpg\" alt=\"\">\n");
      out.write("                <p>Delicious food served at your doorstep within minutes. A must try place for all the foodies out\n");
      out.write("                    there. <b><i> ~ Supriya Malik</i></b></p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"box1\">\n");
      out.write("                <img src=\"4_star.jpg\" alt=\"\">\n");
      out.write("                <p>Huge discounts, delicious food and quick delivery. Nothing could beat the services of Dazzle 'n\n");
      out.write("                    Dine.<b><i> ~ Rahul Upadhyay</i></b> </p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"box1\">\n");
      out.write("                <img src=\"4_star.jpg\" alt=\"\">\n");
      out.write("                <p>Huge discounts, delicious food and quick delivery. Nothing could beat the services of Dazzle 'n Dine.\n");
      out.write("                    <b><i> ~ Aviral Mehra</i></b></p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <section id=\"contact\">\n");
      out.write("        <h1 class=\"h-primary\">Contact Us</h1>\n");
      out.write("        <div id=\"contact-box\">\n");
      out.write("            <p><i class=\"fa-solid fa-phone\"></i>&nbsp&nbspPhone number : +91 00 0000 0000</p>\n");
      out.write("            <p><i class=\"fa-solid fa-envelope\"></i>&nbsp&nbspEmail : dazzlendine@gmail.com</p>\n");
      out.write("            <p><i class=\"fa-solid fa-location-dot\"></i>&nbsp&nbspLocation : Cannaught Place, New Delhi, India</p>\n");
      out.write("            <p><i class=\"fa-solid fa-clock\"></i>&nbsp&nbspTimings : 10.00 am-10.00 pm</p>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <footer>\n");
      out.write("        <div class=\"center\">\n");
      out.write("            copyright &copy; www.Dazzle 'n Dine.com. All rights reserved.\n");
      out.write("        </div>\n");
      out.write("    </footer>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
