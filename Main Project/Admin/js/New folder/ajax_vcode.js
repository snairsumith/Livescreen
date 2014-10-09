//////////////check_v code///////////////////////////////////
var xmlHttp2

function check_vcode(str,whichone)
{ 
i=new Array("txtHint",whichone);

i=i.join("_");
var yes=1;

xmlHttp2=GetXmlHttpObject2()
if (xmlHttp2==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
//////////////////////////////////////////////////// 

 if(whichone==1)
 {
var url="check_code.php"
 url=url+"?v_code="+str;
 url=url+"&sid="+Math.random()
 }
 

if(yes==1)
{
xmlHttp2.onreadystatechange=stateChanged2
xmlHttp2.open("GET",url,true)
xmlHttp2.send(null)
}

}

function stateChanged2()
{
if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete")
 { 
 var arrayOfStrings2=new Array();
 var data=xmlHttp2.responseText;
 //alert(data);
 var comma="," 
 arrayOfStrings2 = data.split(comma)
 document.getElementById("mail_exsit").value=arrayOfStrings2[0]; 
 document.getElementById("txtHint_1").innerHTML=arrayOfStrings2[1]; 
 } 
 else
 {
 document.getElementById(i).innerHTML="Checking..........."; 
 }
}


/////////////	
function GetXmlHttpObject2()
{
var xmlHttp2=null;
try
 {
 // Firefox, Opera 8.0+, Safari
 xmlHttp2=new XMLHttpRequest();
 }
catch (e)
 {
 //Internet Explorer
 try
  {
  xmlHttp2=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)
  {
  xmlHttp2=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp2;
}		
/////////////////end check_user/////////////////////////////////////////////////////
/////////////////end ajax ...//////////////////////////////////////////////////////////////////////


