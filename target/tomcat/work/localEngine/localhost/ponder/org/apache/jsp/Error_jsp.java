package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Error_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    Throwable exception = org.apache.jasper.runtime.JspRuntimeLibrary.getThrowable(request);
    if (exception != null) {
      response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("      \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>ERROR 404</title>\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        body{\r\n");
      out.write("            background-color:rebeccapurple;\r\n");
      out.write("        }\r\n");
      out.write("        .container{\r\n");
      out.write("            display: flex;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            justify-content: center;\r\n");
      out.write("            height: 100vh;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("        }\r\n");
      out.write("        .block{\r\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\r\n");
      out.write("            font-weight: bolder;\r\n");
      out.write("            font-size: large;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            justify-content: center;\r\n");
      out.write("            background-color: blueviolet;\r\n");
      out.write("            color: white;\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            padding: 50px;\r\n");
      out.write("            width: 60%;\r\n");
      out.write("            box-shadow:  0 2.8px 2.2px rgba(0, 0, 0, 0.034),\r\n");
      out.write("                        0 6.7px 5.3px rgba(0, 0, 0, 0.048),\r\n");
      out.write("                        0 12.5px 10px rgba(0, 0, 0, 0.06),\r\n");
      out.write("                        0 22.3px 17.9px rgba(0, 0, 0, 0.072),\r\n");
      out.write("                        0 41.8px 33.4px rgba(0, 0, 0, 0.086),\r\n");
      out.write("                        0 100px 80px rgba(0, 0, 0, 0.12);\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"block\">\r\n");
      out.write("            <h1>Error 404 Page not Found !</h1>\r\n");
      out.write("            <h2>The page that you are looking for is not found just like your love life.</h2>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
