package com.codve;

import org.apache.logging.log4j.ThreadContext;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;


@WebFilter(
        urlPatterns = "/*",
        dispatcherTypes = {
                DispatcherType.REQUEST, DispatcherType.ERROR,
                DispatcherType.FORWARD, DispatcherType.INCLUDE,
                DispatcherType.ASYNC
        }
)
public class LoggingFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        boolean clear = false;
        if (!ThreadContext.containsKey("id")) {
            clear = true;
            ThreadContext.put("id", UUID.randomUUID().toString());
            HttpSession session = ((HttpServletRequest) request).getSession(false);
            if (session != null) {
                ThreadContext.put("username",
                        (String) session.getAttribute("username"));
            }
        }
        try{
            chain.doFilter(request, response);
        } finally {
            if (clear) {
                ThreadContext.clearAll();
            }
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
