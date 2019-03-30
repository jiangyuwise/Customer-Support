<%@ page import="com.codve.Ticket" %>
<%@ page session="false" %>
<%
    String ticketId = (String) request.getAttribute("ticketId");
    Ticket ticket = (Ticket) request.getAttribute("ticket");
%>

<!doctype html>
<html lang="en">
<head>
    <title>Customer Support</title>
</head>
<body>
    <h2>Ticket #<%= ticketId %>: <%= ticket.getSubject()%> </h2>
    <b>Customer Name - <%= ticket.getCustomerName() %></b><br/><br/>
    <%= ticket.getBody()%><br/><br/>
    <%
        if (ticket.getNumberOfAttachments() > 0) {
    %>Attachments:
    <%
            int i = 0;
            for (Attachment attachment : ticket.getAttachments()) {
                if (i++ > 0) {
                    out.print(", ");
                }
    %>
                <a href="<c:url value="/tickets">
                    <c:param name="action" value="download" />
                    <c:param name="ticketId" value="<%= ticketId %>" />
                    <c:param name="attachment" value="<%= attachment.getName() %>" />
                    </c:url>"><%= attachment.getName() %></a>
    <%
            }
    %><br/><br/>
    <%
        }
    %>
    <a href="<c:url value="/tickets" />">Return to list tickets</a>
</body>
</html>