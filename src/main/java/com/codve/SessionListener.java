package com.codve;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionIdListener;
import javax.servlet.http.HttpSessionListener;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebListener
public class SessionListener implements HttpSessionListener,
        HttpSessionIdListener {
    private SimpleDateFormat formatter =
            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

    @Override
    public void sessionCreated(HttpSessionEvent e) {
        // 会话创建时调用
        String msg = this.date() + ": Session " + e.getSession().getId() + " created.";
        System.out.println(msg);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent e) {
        // 会话删除时调用
        String msg = this.date() + ": Session " + e.getSession().getId() + " destroyed.";
        System.out.println(msg);
    }

    @Override
    public void sessionIdChanged(HttpSessionEvent e, String oldSessionId) {
        String msg = this.date() + ": Session ID " + oldSessionId + " changed to " +
                e.getSession().getId();
        System.out.println(msg);
    }

    private String date() {
        return this.formatter.format(new Date());
    }

}
