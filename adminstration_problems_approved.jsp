<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@ page import="java.util.Base64" %>
<%
Connection  connection = null;
            if("POST".equalsIgnoreCase(request.getMethod())){
                Class.forName("com.mysql.jdbc.Driver");
                                                
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
                
                String[] selectedIds = request.getParameterValues("selectedIds");
                if(selectedIds != null && selectedIds.length > 0){
                    
                    for(String id : selectedIds){
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            
                            PreparedStatement  pst =  connection.prepareStatement("Update problems set isApproved=1 WHERE id = ?");
                            pst.setInt(1, Integer.parseInt(id));
                            pst.executeUpdate();
                        } catch (ClassNotFoundException | SQLException e) {
                            e.printStackTrace();
                        }
                        
                    }
                    response.sendRedirect("administration_dashboard.jsp");
                }
            }

%>