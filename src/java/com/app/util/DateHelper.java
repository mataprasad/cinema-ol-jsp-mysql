package com.app.util;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class DateHelper {

    public static String ToDD_MMM_YYYY(String dateString) {
        try {
            DateTimeFormatter formatter = DateTimeFormat.forPattern(Constant.DB_DATE_FORMAT);
            DateTime dt = formatter.parseDateTime(dateString);
            return dt.toString(DateTimeFormat.forPattern(Constant.TICKET_UI_DATE_FORMAT));
        } catch (Exception e) {

        }
        return dateString;
    }

    public static String FromDD_MM_YYYY(String dateString) {

        try {
            DateTimeFormatter formatter = DateTimeFormat.forPattern(Constant.SHOW_UI_DATE_FORMAT);
            DateTime dt = formatter.parseDateTime(dateString);
            return dt.toString(DateTimeFormat.forPattern(Constant.DB_DATE_FORMAT));
        } catch (Exception e) {

        }
        return dateString;
    }

    public static String DbNow() {
        return DateTime.now().toString(DateTimeFormat.forPattern(Constant.DB_DATE_FORMAT));
    }
}
