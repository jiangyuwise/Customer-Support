<%@ page import="java.util.List" %>
<%
    int sessionNumber = (Integer) request.getAttribute("sessionNumber");
    @SuppressWarnings("unchecked")
    List<HttpSession> sessions =
            (List<HttpSession>) request.getAttribute("sessionList");
%>
<!doctype html>
<html lang="en">
<head>
    <title>Customer Support</title>
</head>
<body>
    <a href="<c:url value="/login?logout" />">Logout</a>
    <h2>Sessions</h2>
    There are <%= sessionNumber %> sessions.<br/><br/>
    <%
        long timestamp = System.currentTimeMillis();
        for (HttpSession tmpSession : sessions) {
            out.print(tmpSession.getId() + " - " +
                    tmpSession.getAttribute("username"));
            if (tmpSession.getId().equals(session.getId())) {
                out.print(" (you)");
            }
            out.print(" - last active " +
                (timestamp - tmpSession.getLastAccessedTime()) / 1000);
            out.print(" ago <br/>");
        }
    %>
</body>
</html>