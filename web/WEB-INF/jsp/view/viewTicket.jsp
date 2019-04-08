<%--@elvariable id="ticketId" type="java.lang.String"--%>
<%--@elvariable id="ticket" type="com.codve.Ticket"--%>
<%
    Ticket ticket = (Ticket) request.getAttribute("ticket");
%>

<!doctype html>
<html lang="en">
<head>
    <title>Customer Support</title>
</head>
<body>
    <a href="<c:url value="/login?logout" />">Logout</a>
    <h2>Ticket #${ticketId} : ${ticket.subject} </h2>
    <b>Customer Name - ${ticket.customerName}</b><br/><br/>
    ${ticket.body} <br/><br/>
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
                    <c:param name="ticketId" value="${ticketId}" />
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