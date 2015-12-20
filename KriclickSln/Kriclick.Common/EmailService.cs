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
            

            mail.From = new MailAddress("kriclick.mailer@gmail.com");
            mail.To.Add(to);
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;
            /*SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("noreplyxws@gmail.com", "goldykhurmi.");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);*/
            
            //TODO : mail service on server to don't use google and have own domain
            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new System.Net.NetworkCredential("kriclick.mailer@gmail.com", "2wsx!QAZ"),
                EnableSsl = true
            };
            client.Send(mail);

            Send =true;
            return Send;
        }
        
    }
}