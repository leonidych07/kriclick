using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Kriclick.Common
{
    public class EmailService
    {
        public static bool SendRegEmail(string subject,string body,string to)
        {
            bool Send=false;
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("noreplyxws@gmail.com");
            mail.To.Add(to);
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("noreplyxws@gmail.com", "goldykhurmi.");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
           
            Send=true;
            return Send;
        }
        
    }
}