<%@page import="java.sql.Timestamp" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <% // Handle comment submission if (request.getMethod().equals("POST") && request.getParameter("commentSubmit")
            !=null) { String commentName=request.getParameter("commentName"); String
            commentEmail=request.getParameter("commentEmail"); String commentText=request.getParameter("commentText");
            if (commentName !=null && !commentName.trim().isEmpty() && commentText !=null &&
            !commentText.trim().isEmpty()) { try { Connection conn=DBConnection.getConnection(); String
            insertSql="INSERT INTO COMMENT (NAME, EMAIL, COMMENTTEXT) VALUES (?, ?, ?)" ; PreparedStatement
            pstmt=conn.prepareStatement(insertSql); pstmt.setString(1, commentName.trim()); pstmt.setString(2,
            commentEmail !=null ? commentEmail.trim() : null); pstmt.setString(3, commentText.trim());
            pstmt.executeUpdate(); pstmt.close(); conn.close(); // Redirect to avoid form resubmission
            response.sendRedirect("index.jsp#comments"); return; } catch (SQLException e) { e.printStackTrace(); } } }
            %>