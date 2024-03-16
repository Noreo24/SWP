package helper;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatData {

    public static void main(String[] args) {
        String ngayThangNamGoc = "2024-03-10";
        String ngayThangNamDaFormat = formatDate(ngayThangNamGoc);
        System.out.println(ngayThangNamDaFormat); // Kết quả: "14/03/2024"
        int number = 1234142132;
        String formattedNumber = formatNumber(number);
        System.out.println(formattedNumber); // Output: 123,456,789
    }

    public static String formatDate(String ngayThangNam) {
        try {
            DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = inputFormat.parse(ngayThangNam);

            DateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
            String formattedDate = outputFormat.format(date);

            return formattedDate;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String formatNumber(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###,###.###");
        return decimalFormat.format(number);
    }
}
