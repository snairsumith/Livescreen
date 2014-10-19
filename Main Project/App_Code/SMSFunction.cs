using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

/// <summary>
/// Summary description for SMSFunction
/// </summary>

public class SMSFunction
{
    private string toMobile;

    public string ToMobile
    {
        get { return toMobile; }
        set { toMobile = value; }
    }
    private string message;

    public string Message
    {
        get { return message; }
        set { message = value; }
    }

    public string SendSMS()
    {
        //string URL = "http://premium.moplet.com/web2sms.php?username=madonna&password=madonna123&to=" + toMobile + "&sender=Madonna&message=" + message;
        // string URL = "http://alerts.smsclogin.com/web2sms.php?username=madonna&password=silvester@2565&to=" + toMobile + "&sender=MADONA&message=" + message;
        string URL = "http://alerts.smsclogin.com/api/web2sms.php?workingkey=3277up8xz46kpg4r5xfb&sender=MADONA&to=" + toMobile + "&message=" + message;
        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(URL);
        HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
        System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
        string responseString = respStreamReader.ReadToEnd();
        respStreamReader.Close();
        myResp.Close();
        return responseString;
    }

   
   

}