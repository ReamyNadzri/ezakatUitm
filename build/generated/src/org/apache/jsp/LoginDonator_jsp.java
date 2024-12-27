package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginDonator_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Login Form Donator</title>\r\n");
      out.write("    <style>\r\n");
      out.write("        /* Styling for the modal */\r\n");
      out.write("        .modal {\r\n");
      out.write("            display: none; /* Hidden by default */\r\n");
      out.write("            position: fixed;\r\n");
      out.write("            top: 0;\r\n");
      out.write("            left: 0;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            background-color: rgba(0, 0, 0, 0.5);\r\n");
      out.write("            z-index: 1;\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 50%;\r\n");
      out.write("            left: 50%;\r\n");
      out.write("            transform: translate(-50%, -50%); /* Center the modal */\r\n");
      out.write("            background-color: #111;\r\n");
      out.write("            padding: 20px;\r\n");
      out.write("            border-radius: 8px;\r\n");
      out.write("            width: 40%;\r\n");
      out.write("            color: white;\r\n");
      out.write("            transform: translate(-50%, -50%) scale(0.8);\r\n");
      out.write("            opacity: 0;\r\n");
      out.write("            transition: transform 0.3s ease-out, opacity 0.3s ease-out;\r\n");
      out.write("        }\r\n");
      out.write("        .modal.show .modal-content {\r\n");
      out.write("            transform: translate(-50%, -50%) scale(1); /* Pop up effect */\r\n");
      out.write("            opacity: 1; /* Fade-in effect */\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content input {\r\n");
      out.write("            display: block;\r\n");
      out.write("            width: 90%;\r\n");
      out.write("            margin: 10px auto;\r\n");
      out.write("            padding: 8px;\r\n");
      out.write("            border: none;\r\n");
      out.write("            border-radius: 4px;\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content .button-container {\r\n");
      out.write("            text-align: center; /* Center-align the buttons */\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content button {\r\n");
      out.write("            margin: 10px 5px;\r\n");
      out.write("            width: 100px; /* Smaller button size */\r\n");
      out.write("            padding: 8px;\r\n");
      out.write("            border: none;\r\n");
      out.write("            border-radius: 4px;\r\n");
      out.write("            font-size: 14px;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content .login-btn {\r\n");
      out.write("            background-color: purple;\r\n");
      out.write("            color: white;\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content .close-btn {\r\n");
      out.write("            background-color: gray;\r\n");
      out.write("            color: white;\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content .register-link {\r\n");
      out.write("            display: block;\r\n");
      out.write("            margin-top: 15px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            font-size: 14px;\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content .register-link a {\r\n");
      out.write("            color: purple;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("        }\r\n");
      out.write("        .modal-content .register-link a:hover {\r\n");
      out.write("            text-decoration: underline;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <!-- Button to Open Modal -->\r\n");
      out.write("    <button id=\"openLoginModal\">Login as Donator</button>\r\n");
      out.write("\r\n");
      out.write("    <!-- Login Modal -->\r\n");
      out.write("    <div id=\"loginModal\" class=\"modal\">\r\n");
      out.write("        <div class=\"modal-content\">\r\n");
      out.write("            <h2 style=\"text-align:center;\">Login Donator</h2>\r\n");
      out.write("            <!-- Login Form -->\r\n");
      out.write("            <form action=\"loginDonatorServlet\" method=\"post\">\r\n");
      out.write("                <input type=\"email\" name=\"email\" placeholder=\"Email...\" required>\r\n");
      out.write("                <input type=\"password\" name=\"password\" placeholder=\"Password...\" required>\r\n");
      out.write("                <div class=\"button-container\">\r\n");
      out.write("                    <button type=\"button\" class=\"close-btn\" id=\"closeLoginModal\">Kembali</button>\r\n");
      out.write("                    <button type=\"submit\" class=\"login-btn\">Login</button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- Link to Register Form -->\r\n");
      out.write("                <div class=\"register-link\">\r\n");
      out.write("                    Anda Belum Mendaftar? <a href=\"RegisterDonator.jsp\" id=\"openRegisterForm\">Daftar Sekarang</a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script>\r\n");
      out.write("        const loginModal = document.getElementById('loginModal');\r\n");
      out.write("        const openLoginModalBtn = document.getElementById('openLoginModal');\r\n");
      out.write("        const closeLoginModalBtn = document.getElementById('closeLoginModal');\r\n");
      out.write("        const openRegisterFormLink = document.getElementById('openRegisterForm');\r\n");
      out.write("\r\n");
      out.write("        openLoginModalBtn.onclick = function () {\r\n");
      out.write("            loginModal.style.display = 'block';\r\n");
      out.write("            setTimeout(() => loginModal.classList.add('show'), 10); // Add the \"show\" class to trigger animation\r\n");
      out.write("        };\r\n");
      out.write("        closeLoginModalBtn.onclick = function () {\r\n");
      out.write("            loginModal.classList.remove('show'); // Remove the \"show\" class for reverse animation\r\n");
      out.write("            setTimeout(() => loginModal.style.display = 'none', 300); // Delay hiding the modal to match animation\r\n");
      out.write("        };\r\n");
      out.write("\r\n");
      out.write("        window.onclick = function (event) {\r\n");
      out.write("            if (event.target === loginModal) {\r\n");
      out.write("                loginModal.classList.remove('show');\r\n");
      out.write("                setTimeout(() => loginModal.style.display = 'none', 300);\r\n");
      out.write("            }\r\n");
      out.write("        };\r\n");
      out.write("\r\n");
      out.write("        // Redirect to Register Form JSP\r\n");
      out.write("        openRegisterFormLink.onclick = function () {\r\n");
      out.write("            loginModal.classList.remove('show');\r\n");
      out.write("            setTimeout(() => {\r\n");
      out.write("                loginModal.style.display = 'none';\r\n");
      out.write("                window.location.href = \"RegisterDonator.jsp\"; // Redirect to register form (use JSP page)\r\n");
      out.write("            }, 300);\r\n");
      out.write("        };\r\n");
      out.write("    </script>\r\n");
      out.write("</body>\r\n");
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
