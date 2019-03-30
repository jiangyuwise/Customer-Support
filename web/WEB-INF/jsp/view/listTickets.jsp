<%@ page session="false" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.codve.Ticket" %>
<%
    @SuppressWarnings("unchecked")
    Map<Integer, Ticket> ticketDatabase =
            (Map<Integer, Ticket>) request.getAttribute("ticketDatabase");
%>
<!doctype html>
<html lang="en">
<head>
    <title>Customer Support</title>
</head>
<body>
    <h2>Tickets</h2>
    <a href="<c:url value="/tickets">
            <c:param name="action" value="create"/>
    </c:url>">Create Ticket</a><br/><br/>
    <%
        if (ticketDatabase.size() == 0) {
    %><b>There are no tickets in the system.</b>
    <%
        } else {
            for (int id : ticketDatabase.keySet()) {
                String idString = Integer.toString(id);
                Ticket ticket = ticketDatabase.get(id);
    %>
                Ticket #<%= idString %>: <a href="<c:url value="/tickets">
                    <c:param name="action" value="view" />
                    <c:param name="ticketId" value="<%= idString %>" />
                    </c:url><%= ticket.getSubject() %> </a>
                    (Customer: <%= ticket.getCustomerName() %>)<br/>
    <%
            }
        }
    %>
</body>
</html>