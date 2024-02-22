/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Uils;

import Model.Account;
import java.io.PrintWriter;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

    public static void SendMail(String to, String sub,
              String msg, final String user, final String pass) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private Session getSession() {
        //Gmail Host
        String host = "smtp.gmail.com";
        String username = "techdeveloper.aj@gmail.com";
        //Enter your Gmail password
        String password = "";

        Properties prop = new Properties();
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", host);
        prop.put("mail.smtp.port", 587);
        prop.put("mail.smtp.ssl.trust", host);

        return Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
    }

    public static void sendMailFunction(String den, String tieuDe, String noiDung) {
        String noiDungF = ""
                  + "<!DOCTYPE html>\n"
                  + "<html lang=\"en\">\n"
                  + "<head>\n"
                  + "    <meta charset=\"UTF-8\">\n"
                  + "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
                  + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                  + "    <title>Tks</title>\n"
                  + "</head>\n"
                  + "<body>\n"
                  + "    \n" + noiDung
                  + "</body>\n"
                  + "</html>";
        SendMail(den, tieuDe, noiDungF, Constants.SEENDMAIL_ACCOUNT, Constants.SEENDMAIL_PASS);
    }

    public static void main(String[] args) {
        sendMailFunction("abc@fpt.edu.vn", "ts", "");
    }

    public static void sendMailChangProfileByAdmin(Account account) {
        sendMailFunction(account.getEmail(), "[Notice] Modification of your account information by the administrator",
                  "<!DOCTYPE html>\n"
                  + "<html lang=\"en\">\n"
                  + "\n"
                  + "<head>\n"
                  + "    <meta charset=\"UTF-8\">\n"
                  + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                  + "    <title>Document</title>\n"
                  + "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                  + "</head>\n"
                  + "\n"
                  + "<body>\n"
                  + "    <div id=\"m_2683353888907259317:ml\">\n"
                  + "        <div>\n"
                  + "            <div>\n"
                  + "            </div>\n"
                  + "            <table bgcolor=\"#f2f2f2\" width=\"100%\">\n"
                  + "                <tbody>\n"
                  + "                    <tr>\n"
                  + "                        <td>\n"
                  + "                            <table align=\"center\">\n"
                  + "                                <tbody>\n"
                  + "                                    <tr>\n"
                  + "                                        <td>\n"
                  + "                                            <table>\n"
                  + "                                                <tbody>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            <img height=\"55\"\n"
                  + "                                                                src=\"https://ci3.googleusercontent.com/meips/ADKq_NZn7YtgE9poZU7EfStELW1WVexgFrotq7Z73f_1BX4ukOm1xJm29byTfoG0chRJKYVnIXlwngOFvZQtTxb6UvA7KIx4edAfz-zQ5P0bcePXrPW3l5RkuT64e94vkhJHfjXz5xo7KnKxqzOTpvUdLRzymRzoxa_E1knqFkbC00A=s0-d-e1-ft#https://itviec.com/assets/mails/logo-5f3371a704b475a80f27523e1bcfc4853c03bd7e32b8893971074a64d48bdd6c.png\"\n"
                  + "                                                                class=\"CToWUd\" data-bit=\"iit\">\n"
                  + "                                                        </td>\n"
                  + "                                                        <td>\n"
                  + "                                                            <img height=\"80\"\n"
                  + "                                                                src=\"https://ci3.googleusercontent.com/meips/ADKq_NZuL5FfPzyV-Xbi7bGIXVXSvMc2Ssv2eJaJWpsLGq7aGzFyxe4SFe5zrtbJ4gGzF19USWSwQ2J3HerpTHefnPAocBazPnqwF4_pmb_-KWyb8OTn77zYTBRu2mVrzovqdtPVsvREniqqMN7xS11j9ajoaZJfl8kkmlXrlyXWLfXxvg09nIIMT1g3QpsuTQ=s0-d-e1-ft#https://itviec.com/assets/mails/robby-subscription-a000c03aa20a8f2397802b9b2addb7974f6352bf61491e0a0fc9c18f08a56b9d.png\"\n"
                  + "                                                                class=\"CToWUd\" data-bit=\"iit\">\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                </tbody>\n"
                  + "                                            </table>\n"
                  + "                                            <div>\n"
                  + "                                                <div>\n"
                  + "                                                </div>\n"
                  + "                                            </div>\n"
                  + "                                            <table>\n"
                  + "                                                <tbody>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            Hi, " + account.getFullName() + ",\n"
                  + "                                                            <p>\n"
                  + "                                                                The administrator has modified your account information\n"
                  + "                                                            </p>\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            <a href=\"http://localhost:9999/Phone_Shop/ProfileUser\"\n"
                  + "                                                                target=\"_blank\"\n"
                  + "                                                                data-saferedirecturl=\"https://www.google.com/url?q=https://links.itviec.com/ls/click?upn%3D33gCGi3aF2hTsjxJvRKdMHTgw20-2FRBQQjr8n2wWTOlb-2FOUlSWOArpipeeLLD32dWv-2BjOiPcCnFdqlZJ0-2BLmy1dSDdIpC0VLUriRV-2BHZ08MT5UZG6AUrolkPoSb-2FTH6-2F8CkOQOnjvj60CLCjf1c8QNMwTL6j19IL8EoiB3IA3ju55T9-2BccfxBcsg2R2nZ1ZG-2FMm0tyCLXrbbFoZQptweanvqBuWveiQZhCI2rDgRVjOA16zi-2BU0gx0eVrE1Cx-2BiBH0L0eJJRvIQJZFZPHkdglrj8-2FmK4HMFFI6M2KgIl7hhLfr7HjWfoi9q-2BnVilbSVCdSl6Ia4g4xuxIojTQS1ODoQ-3D-3D-uhm_ieXTpLI-2F37wz6sCmU-2Bc7VNwXjXX3JVjgw-2BuidcHUPiNI-2BHHBe9AAswKTzeMT9fo9q9uJeMusg3kg9QsQHf4BFHLCC21nF4x-2Fr5ITIBwEyY9rmMpi0nQ4AXK7ssA9wV-2BDRb42Ek6a8QNPVVNNP43Eei2MAwhvFWCKdKiF1oRppwBW1uWqyk8cDrs0Qbl7c0-2BmDCdB3mfOFugOMcxpFjRP6i-2BANZHzmMXLKCVM7wuoB5KCRW1549ECBaONtTof3Tsnf5iVFYi5JadZq1f7hNwmbW29osmROYg-2BPPIaortYreDnNUcHqrlEbKMY4rQ4sFbB&amp;source=gmail&amp;ust=1708318719849000&amp;usg=AOvVaw3rN7OETBI68WS9sd37rRBO\">\n"
                  + "                                                                <span>\n"
                  + "                                                                    Click Here. Check Infomation</span>\n"
                  + "                                                            </a>\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                </tbody>\n"
                  + "                                            </table>\n"
                  + "                                            <div class=\"row\">\n"
                  + "                                                <div class=\"col-xl-8\">\n"
                  + "                                                    <!-- Account details card-->\n"
                  + "                                                    <div class=\"card mb-4\">\n"
                  + "                                                        <div class=\"card-body\">\n"
                  + "                                                            <div class=\"panel\">\n"
                  + "                                                                <div class=\"bio-graph-heading\">\n"
                  + "                                                                </div>\n"
                  + "                                                                <div class=\"panel-body bio-graph-info\">\n"
                  + "                                                                    <div class=\"row\">\n"
                  + "                                                                        <div class=\"col-md-6\">\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>Email </span>: " + account.getEmail() + " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>User Name </span>: " + account.getUser_name() + " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>Phone </span>:  " + account.getPhone() + " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>Adderss </span>:  " + account.getAddress() + " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                        </div>\n"
                  + "                                                                    </div>\n"
                  + "                                                                </div>\n"
                  + "                                                            </div>\n"
                  + "                                                        </div>\n"
                  + "                                                    </div>\n"
                  + "                                                </div>\n"
                  + "                                            </div>\n"
                  + "                                        </td>\n"
                  + "                                    </tr>\n"
                  + "                                </tbody>\n"
                  + "                            </table>\n"
                  + "                        </td>\n"
                  + "                    </tr>\n"
                  + "                </tbody>\n"
                  + "            </table>\n"
                  + "\n"
                  + "        </div>\n"
                  + "    </div>\n"
                  + "</body>\n"
                  + "\n"
                  + "</html>");
    }

    public static void sendMailChangPass(Account account) {
        sendMailFunction(account.getEmail(), "[Notice] Modification of your account information",
                  "<!DOCTYPE html>\n"
                  + "<html lang=\"en\">\n"
                  + "\n"
                  + "<head>\n"
                  + "    <meta charset=\"UTF-8\">\n"
                  + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                  + "    <title>Document</title>\n"
                  + "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                  + "</head>\n"
                  + "\n"
                  + "<body>\n"
                  + "    <div id=\"m_2683353888907259317:ml\">\n"
                  + "        <div>\n"
                  + "            <div>\n"
                  + "            </div>\n"
                  + "            <table bgcolor=\"#f2f2f2\" width=\"100%\">\n"
                  + "                <tbody>\n"
                  + "                    <tr>\n"
                  + "                        <td>\n"
                  + "                            <table align=\"center\">\n"
                  + "                                <tbody>\n"
                  + "                                    <tr>\n"
                  + "                                        <td>\n"
                  + "                                            <table>\n"
                  + "                                                <tbody>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            <img height=\"55\"\n"
                  + "                                                                src=\"https://ci3.googleusercontent.com/meips/ADKq_NZn7YtgE9poZU7EfStELW1WVexgFrotq7Z73f_1BX4ukOm1xJm29byTfoG0chRJKYVnIXlwngOFvZQtTxb6UvA7KIx4edAfz-zQ5P0bcePXrPW3l5RkuT64e94vkhJHfjXz5xo7KnKxqzOTpvUdLRzymRzoxa_E1knqFkbC00A=s0-d-e1-ft#https://itviec.com/assets/mails/logo-5f3371a704b475a80f27523e1bcfc4853c03bd7e32b8893971074a64d48bdd6c.png\"\n"
                  + "                                                                class=\"CToWUd\" data-bit=\"iit\">\n"
                  + "                                                        </td>\n"
                  + "                                                        <td>\n"
                  + "                                                            <img height=\"80\"\n"
                  + "                                                                src=\"https://ci3.googleusercontent.com/meips/ADKq_NZuL5FfPzyV-Xbi7bGIXVXSvMc2Ssv2eJaJWpsLGq7aGzFyxe4SFe5zrtbJ4gGzF19USWSwQ2J3HerpTHefnPAocBazPnqwF4_pmb_-KWyb8OTn77zYTBRu2mVrzovqdtPVsvREniqqMN7xS11j9ajoaZJfl8kkmlXrlyXWLfXxvg09nIIMT1g3QpsuTQ=s0-d-e1-ft#https://itviec.com/assets/mails/robby-subscription-a000c03aa20a8f2397802b9b2addb7974f6352bf61491e0a0fc9c18f08a56b9d.png\"\n"
                  + "                                                                class=\"CToWUd\" data-bit=\"iit\">\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                </tbody>\n"
                  + "                                            </table>\n"
                  + "                                            <div>\n"
                  + "                                                <div>\n"
                  + "                                                </div>\n"
                  + "                                            </div>\n"
                  + "                                            <table>\n"
                  + "                                                <tbody>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            Hi, " + account.getFullName() + ",\n"
                  + "                                                            <p>\n"
                  + "                                                                The system notices a change to your password\n"
                  + "                                                            </p>\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            <a href=\"http://localhost:9999/Phone_Shop/ProfileUser\"\n"
                  + "                                                                target=\"_blank\"\n"
                  + "                                                                data-saferedirecturl=\"https://www.google.com/url?q=https://links.itviec.com/ls/click?upn%3D33gCGi3aF2hTsjxJvRKdMHTgw20-2FRBQQjr8n2wWTOlb-2FOUlSWOArpipeeLLD32dWv-2BjOiPcCnFdqlZJ0-2BLmy1dSDdIpC0VLUriRV-2BHZ08MT5UZG6AUrolkPoSb-2FTH6-2F8CkOQOnjvj60CLCjf1c8QNMwTL6j19IL8EoiB3IA3ju55T9-2BccfxBcsg2R2nZ1ZG-2FMm0tyCLXrbbFoZQptweanvqBuWveiQZhCI2rDgRVjOA16zi-2BU0gx0eVrE1Cx-2BiBH0L0eJJRvIQJZFZPHkdglrj8-2FmK4HMFFI6M2KgIl7hhLfr7HjWfoi9q-2BnVilbSVCdSl6Ia4g4xuxIojTQS1ODoQ-3D-3D-uhm_ieXTpLI-2F37wz6sCmU-2Bc7VNwXjXX3JVjgw-2BuidcHUPiNI-2BHHBe9AAswKTzeMT9fo9q9uJeMusg3kg9QsQHf4BFHLCC21nF4x-2Fr5ITIBwEyY9rmMpi0nQ4AXK7ssA9wV-2BDRb42Ek6a8QNPVVNNP43Eei2MAwhvFWCKdKiF1oRppwBW1uWqyk8cDrs0Qbl7c0-2BmDCdB3mfOFugOMcxpFjRP6i-2BANZHzmMXLKCVM7wuoB5KCRW1549ECBaONtTof3Tsnf5iVFYi5JadZq1f7hNwmbW29osmROYg-2BPPIaortYreDnNUcHqrlEbKMY4rQ4sFbB&amp;source=gmail&amp;ust=1708318719849000&amp;usg=AOvVaw3rN7OETBI68WS9sd37rRBO\">\n"
                  + "                                                                <span>\n"
                  + "                                                                    Click Here. Check Infomation</span>\n"
                  + "                                                            </a>\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                </tbody>\n"
                  + "                                            </table>\n"
                  + "                                        </td>\n"
                  + "                                    </tr>\n"
                  + "                                </tbody>\n"
                  + "                            </table>\n"
                  + "                        </td>\n"
                  + "                    </tr>\n"
                  + "                </tbody>\n"
                  + "            </table>\n"
                  + "\n"
                  + "        </div>\n"
                  + "    </div>\n"
                  + "</body>\n"
                  + "\n"
                  + "</html>");
    }

    public static void sendMailAfterAddAccount(Account account) {
        sendMailFunction(account.getEmail(), "[Notice] Modification of your account information by the administrator",
                  "<!DOCTYPE html>\n"
                  + "<html lang=\"en\">\n"
                  + "\n"
                  + "<head>\n"
                  + "    <meta charset=\"UTF-8\">\n"
                  + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                  + "    <title>Document</title>\n"
                  + "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                  + "</head>\n"
                  + "\n"
                  + "<body>\n"
                  + "    <div id=\"m_2683353888907259317:ml\">\n"
                  + "        <div>\n"
                  + "            <div>\n"
                  + "            </div>\n"
                  + "            <table bgcolor=\"#f2f2f2\" width=\"100%\">\n"
                  + "                <tbody>\n"
                  + "                    <tr>\n"
                  + "                        <td>\n"
                  + "                            <table align=\"center\">\n"
                  + "                                <tbody>\n"
                  + "                                    <tr>\n"
                  + "                                        <td>\n"
                  + "                                            <table>\n"
                  + "                                                <tbody>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            <img height=\"55\"\n"
                  + "                                                                src=\"https://ci3.googleusercontent.com/meips/ADKq_NZn7YtgE9poZU7EfStELW1WVexgFrotq7Z73f_1BX4ukOm1xJm29byTfoG0chRJKYVnIXlwngOFvZQtTxb6UvA7KIx4edAfz-zQ5P0bcePXrPW3l5RkuT64e94vkhJHfjXz5xo7KnKxqzOTpvUdLRzymRzoxa_E1knqFkbC00A=s0-d-e1-ft#https://itviec.com/assets/mails/logo-5f3371a704b475a80f27523e1bcfc4853c03bd7e32b8893971074a64d48bdd6c.png\"\n"
                  + "                                                                class=\"CToWUd\" data-bit=\"iit\">\n"
                  + "                                                        </td>\n"
                  + "                                                        <td>\n"
                  + "                                                            <img height=\"80\"\n"
                  + "                                                                src=\"https://ci3.googleusercontent.com/meips/ADKq_NZuL5FfPzyV-Xbi7bGIXVXSvMc2Ssv2eJaJWpsLGq7aGzFyxe4SFe5zrtbJ4gGzF19USWSwQ2J3HerpTHefnPAocBazPnqwF4_pmb_-KWyb8OTn77zYTBRu2mVrzovqdtPVsvREniqqMN7xS11j9ajoaZJfl8kkmlXrlyXWLfXxvg09nIIMT1g3QpsuTQ=s0-d-e1-ft#https://itviec.com/assets/mails/robby-subscription-a000c03aa20a8f2397802b9b2addb7974f6352bf61491e0a0fc9c18f08a56b9d.png\"\n"
                  + "                                                                class=\"CToWUd\" data-bit=\"iit\">\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                </tbody>\n"
                  + "                                            </table>\n"
                  + "                                            <div>\n"
                  + "                                                <div>\n"
                  + "                                                </div>\n"
                  + "                                            </div>\n"
                  + "                                            <table>\n"
                  + "                                                <tbody>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            Hi, " + account.getFullName() + ",\n"
                  + "                                                            <p>\n"
                  + "                                                                An administrator has created your account information\n"
                  + "                                                            </p>\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                    <tr>\n"
                  + "                                                        <td>\n"
                  + "                                                            <a href=\"http://localhost:9999/Phone_Shop/ProfileUser\"\n"
                  + "                                                                target=\"_blank\"\n"
                  + "                                                                data-saferedirecturl=\"https://www.google.com/url?q=https://links.itviec.com/ls/click?upn%3D33gCGi3aF2hTsjxJvRKdMHTgw20-2FRBQQjr8n2wWTOlb-2FOUlSWOArpipeeLLD32dWv-2BjOiPcCnFdqlZJ0-2BLmy1dSDdIpC0VLUriRV-2BHZ08MT5UZG6AUrolkPoSb-2FTH6-2F8CkOQOnjvj60CLCjf1c8QNMwTL6j19IL8EoiB3IA3ju55T9-2BccfxBcsg2R2nZ1ZG-2FMm0tyCLXrbbFoZQptweanvqBuWveiQZhCI2rDgRVjOA16zi-2BU0gx0eVrE1Cx-2BiBH0L0eJJRvIQJZFZPHkdglrj8-2FmK4HMFFI6M2KgIl7hhLfr7HjWfoi9q-2BnVilbSVCdSl6Ia4g4xuxIojTQS1ODoQ-3D-3D-uhm_ieXTpLI-2F37wz6sCmU-2Bc7VNwXjXX3JVjgw-2BuidcHUPiNI-2BHHBe9AAswKTzeMT9fo9q9uJeMusg3kg9QsQHf4BFHLCC21nF4x-2Fr5ITIBwEyY9rmMpi0nQ4AXK7ssA9wV-2BDRb42Ek6a8QNPVVNNP43Eei2MAwhvFWCKdKiF1oRppwBW1uWqyk8cDrs0Qbl7c0-2BmDCdB3mfOFugOMcxpFjRP6i-2BANZHzmMXLKCVM7wuoB5KCRW1549ECBaONtTof3Tsnf5iVFYi5JadZq1f7hNwmbW29osmROYg-2BPPIaortYreDnNUcHqrlEbKMY4rQ4sFbB&amp;source=gmail&amp;ust=1708318719849000&amp;usg=AOvVaw3rN7OETBI68WS9sd37rRBO\">\n"
                  + "                                                                <span>\n"
                  + "                                                                    Click Here. Check Infomation</span>\n"
                  + "                                                            </a>\n"
                  + "                                                        </td>\n"
                  + "                                                    </tr>\n"
                  + "                                                </tbody>\n"
                  + "                                            </table>\n"
                  + "                                            <div class=\"row\">\n"
                  + "                                                <div class=\"col-xl-8\">\n"
                  + "                                                    <!-- Account details card-->\n"
                  + "                                                    <div class=\"card mb-4\">\n"
                  + "                                                        <div class=\"card-body\">\n"
                  + "                                                            <div class=\"panel\">\n"
                  + "                                                                <div class=\"bio-graph-heading\">\n"
                  + "                                                                </div>\n"
                  + "                                                                <div class=\"panel-body bio-graph-info\">\n"
                  + "                                                                    <div class=\"row\">\n"
                  + "                                                                        <div class=\"col-md-6\">\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>Email </span>: " + account.getEmail() + " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>User Name </span>: " + account.getUser_name() + " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>Phone </span>:  " + account.getPhone() + " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>Adderss </span>:  " + account.getAddress() + " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                            <div class=\"bio-row\">\n"
                  + "                                                                                <p><span>Password </span>:  " + account.getPassword()+ " </p>\n"
                  + "                                                                            </div>\n"
                  + "                                                                        </div>\n"
                  + "                                                                    </div>\n"
                  + "                                                                </div>\n"
                  + "                                                            </div>\n"
                  + "                                                        </div>\n"
                  + "                                                    </div>\n"
                  + "                                                </div>\n"
                  + "                                            </div>\n"
                  + "                                        </td>\n"
                  + "                                    </tr>\n"
                  + "                                </tbody>\n"
                  + "                            </table>\n"
                  + "                        </td>\n"
                  + "                    </tr>\n"
                  + "                </tbody>\n"
                  + "            </table>\n"
                  + "\n"
                  + "        </div>\n"
                  + "    </div>\n"
                  + "</body>\n"
                  + "\n"
                  + "</html>");
    }

}
