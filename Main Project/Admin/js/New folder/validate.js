/////////////////////////////
/////////////delete action //////////////
function delete_action(table,page,pagenow,id)
{

var ch;
ch=window.confirm("Do you want to delete ?");
if(ch==true)
{
 location.href="delete_action.php?table="+table+"&page="+page+"&pagenow="+pagenow+"&deleteid="+id;
}

}
/////ends delete action////////////////////
/////////////////////////////user login/////////////////////////////////////////////////////

function validate_login()
{
submitOK="true";
var user=document.getElementById("user_name").value;
var pwd=document.getElementById("user_pwd").value;
	if(user=="")
	{
	alert("Fill User Name");
	submitOK="false";
	}
	else if(pwd=="")
		{
		alert("Fill Password");
		submitOK="false";
		}
	
	
if (submitOK=="false")
 {
 return false;
 }	
 
}
//////////////////////////////////////////////////////////////

function validate_check()
{
submitOK="true";
var v_code=document.getElementById("v_code").value;
	if(v_code=="")
	{
	alert("Fill Varification ID");
	submitOK="false";
	}
	
if (submitOK=="false")
 {
 return false;
 }	
 
}
///////////////////////////


/////////////////////////////////////
function validate_reg()
{
	var submitOK="true";
	var msg="";
	var headermsg="Please fill the requiring field!......\n";


var name=document.getElementById("name").value;
var v_code=document.getElementById("v_code").value;
var mail_exsit=document.getElementById("mail_exsit").value; 
var email=document.getElementById("email").value; 
var address=document.getElementById("textarea").value; 
var training=document.getElementById("training1").value; 
var t_date=document.getElementById("t_date").value; 
var training_from=document.getElementById("training_from").value; 
var training_to=document.getElementById("training_to").value;
var training_at=document.getElementById("training_at").value; 
var image=document.getElementById("image").value; 

 		if(name=="")
		{
		msg+="...Fill Name\n";
		}
		if(v_code=="")
		{
		msg+="...Fill Code\n";
		}
		if(mail_exsit==1)
		{
		msg+="...Check Verfication Code\n";
		}
		if(email=="")
		{
		msg+="...Fill Email\n";
		}
		if(email!="")
		{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(email))
		{
		msg+="...Please input a valid Email address\n";
		}	
		}
		if(address=="")
		{
		msg+="...Fill Address\n";
		}
		if(training==0)
		{
		msg+="...Select Trainings\n";
		}
		if(t_date=="")
		{
		msg+="...Fill Training Duration\n";
		}
		if(training_from=="")
		{
		msg+="...Fill Training From\n";
		}
		if(training_to=="")
		{
		msg+="...Fill Training completed in \n";
		}
		if(training_at=="")
		{
		msg+="...Fill Training At\n";
		}
		
		if(image=="")
		{
			if(image==0)
			{
			msg+="...Select Image\n";
			}
		}
		if(image!="")
	 	{
			var convertfilename=image.toLowerCase(); 
			var file =convertfilename;
			var mime = file.substr(file.lastIndexOf('.'));
			if (mime!= '.gif' && mime!= '.jpg' && mime!= '.bmp' && mime!= '.png' && mime!= '.jpeg')
			{
			msg+="...is a wrong file extension,Select image file\n";
			}
		
		}	
		
		
			
	if(msg!="")
		{
		alert(headermsg+msg);
		submitOK="false";
		}
	
	
	if (submitOK=="false")
 		{
 		return false;
 		}		
	
}	
///////////////////////////////////////////////
////////////
function validate_edit_reg()
{
	var submitOK="true";
	var msg="";
	var headermsg="Please fill the requiring field!......\n";


var name=document.getElementById("name").value;
var v_code=document.getElementById("v_code").value; 
var email=document.getElementById("email").value; 
var address=document.getElementById("textarea").value; 
var training=document.getElementById("training1").value; 
var t_date=document.getElementById("t_date").value; 
var training_from=document.getElementById("from").value; 
var training_to=document.getElementById("training_to").value;
var training_at=document.getElementById("training_at").value; 
var image=document.getElementById("image").value; 

 		if(name=="")
		{
		msg+="...Fill Name\n";
		}
		if(v_code=="")
		{
		msg+="...Fill Code\n";
		}
		if(email=="")
		{
		msg+="...Fill Email\n";
		}
		if(email!="")
		{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(email))
		{
		msg+="...Please input a valid Email address\n";
		}	
		}
		if(address=="")
		{
		msg+="...Fill Address\n";
		}
		if(training==0)
		{
		msg+="...Select Trainings\n";
		}
		if(t_date=="")
		{
		msg+="...Fill Training Completed In\n";
		}
		if(training_from=="")
		{
		msg+="...Fill Training From\n";
		}
		if(training_to=="")
		{
		msg+="...Fill Training To\n";
		}
		if(training_at=="")
		{
		msg+="...Fill Training At\n";
		}
		
		if(image!="")
		{
		if(image=="")
		{
			if(image==0)
			{
			msg+="...Select Image\n";
			}
		}
		
		if(image!="")
	 	{
			var convertfilename=image.toLowerCase(); 
			var file =convertfilename;
			var mime = file.substr(file.lastIndexOf('.'));
			if (mime!= '.gif' && mime!= '.jpg' && mime!= '.bmp' && mime!= '.png' && mime!= '.jpeg')
			{
			msg+="...is a wrong file extension,Select image file\n";
			}
		}	
		
		}
		
		
			
	if(msg!="")
		{
		alert(headermsg+msg);
		submitOK="false";
		}
	
	
	if (submitOK=="false")
 		{
 		return false;
 		}		
	
	
}
/////////////////////////////////////////////

///////////////////////////////user////change pswd//////////////////////
function validate_changepwd()
{
	var submitok="true";	

	var old_pwd=document.getElementById("old_pwd").value;
	var new_pwd=document.getElementById("new_pwd").value;
	var con_pwd=document.getElementById("con_pwd").value;
	
	
	if(old_pwd =="")
	{
		alert("Fill Current password");
		document.getElementById("old_pwd").focus();
		submitok="false";
	}
	
	
	else if(new_pwd=="")
	{
		alert("Fill New password");
		document.getElementById("new_pwd").focus();
		submitok="false";
	}
	else if(con_pwd=="")
	{
		alert("Fill Confirm password");
		document.getElementById("con_pwd").focus();
		submitok="false";
	}
	
	
	
	else if(new_pwd!=con_pwd)
	{
		alert("Password did not match");
		document.getElementById("new_pwd").focus();
		submitok="false";
	}
	
	
	if(submitok=="false")
	{
	return false;
	}
	
	
}

///////////////////////////////////

////////USER SIDEE
/////////////////////////////////////
function validate_contact()
{
	var submitOK="true";
	var msg="";
	var headermsg="Please fill the requiring field!......\n";


var name=document.getElementById("name").value;
var phone=document.getElementById("phone").value;
var email=document.getElementById("mail").value;
var company=document.getElementById("company").value; 
var intrested=document.getElementById("intrested").value; 
var details=document.getElementById("details").value; 


 		if(name=="")
		{
		msg+="...Fill First Name\n";
		}
		
		if(phone=="")
		{
		submitOK="false";
		msg+="...Fill Telephone \n";
		}
		if(phone!="")
		{
	 	if(isNaN(phone))
		{
		submitOK="false";
		msg+="...Fill Valid Telephone \n";
		}
		}
		if(email=="")
		{
		msg+="...Fill Email\n";
		}
		if(email!="")
		{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(email))
		{
		msg+="...Fill valid Email address\n";
		}	
		}
		
		if(company=="")
		{
		msg+="...Fill Company\n";
		}
		if(intrested=="0")
		{
		msg+="...Fill Intrested In\n";
		}
		if(details=="0")
		{
		msg+="...Fill Need Details On\n";
		}
			
	if(msg!="")
		{
		alert(headermsg+msg);
		submitOK="false";
		}
	
	
	if (submitOK=="false")
 		{
 		return false;
 		}		
	
}	
///////////////////////////////////////////////
////
function validate_online_reg()
{
	var submitOK="true";
	var msg="";
	var headermsg="Please fill the requiring field!......\n";


var fname=document.getElementById("fname").value;
var lname=document.getElementById("lname").value;
var organization=document.getElementById("organization").value;
var contact=document.getElementById("contact").value; 
var email=document.getElementById("mail").value;
var address=document.getElementById("address1").value;
var comments=document.getElementById("comments1").value; 
var training=document.getElementById("training1").value; 


 		if(fname=="")
		{
		msg+="...Fill First Name\n";
		}
		if(lname=="")
		{
		msg+="...Fill Last Name\n";
		}
		if(organization=="")
		{
		submitOK="false";
		msg+="...Fill Organization \n";
		}
		if(contact=="")
		{
		submitOK="false";
		msg+="...Fill Contact \n";
		}
		if(contact!="")
		{
	 	if(isNaN(contact))
		{
		submitOK="false";
		msg+="...Fill Valid Contact \n";
		}
		}
		if(email=="")
		{
		msg+="...Fill Email\n";
		}
		if(email!="")
		{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(email))
		{
		msg+="...Fill valid Email address\n";
		}	
		}
		if(address=="")
		{
		msg+="...Fill Address\n";
		}
		
		if(comments=="")
		{
		msg+="...Fill Comments\n";
		}
		if(training=="0")
		{
		msg+="...Select Training\n";
		}
			
	if(msg!="")
		{
		alert(headermsg+msg);
		submitOK="false";
		}
	
	
	if (submitOK=="false")
 		{
 		return false;
 		}		
	
}	
///////////////////////////////////////////////
///////////////////////////////////////////////
////
function validate_online_support()
{
	var submitOK="true";
	var msg="";
	var headermsg="Please fill the requiring field!......\n";


var fname=document.getElementById("fname").value;
var lname=document.getElementById("lname").value;
var organization=document.getElementById("organization").value;
var contact=document.getElementById("contact").value; 
var email=document.getElementById("mail").value;
var address=document.getElementById("address1").value;
var comments=document.getElementById("comments1").value; 
var details=document.getElementById("details").value; 


 		if(fname=="")
		{
		msg+="...Fill First Name\n";
		}
		if(lname=="")
		{
		msg+="...Fill Last Name\n";
		}
		if(organization=="")
		{
		submitOK="false";
		msg+="...Fill Organization \n";
		}
		if(contact=="")
		{
		submitOK="false";
		msg+="...Fill Contact \n";
		}
		if(contact!="")
		{
	 	if(isNaN(contact))
		{
		submitOK="false";
		msg+="...Fill Valid Contact \n";
		}
		}
		if(email=="")
		{
		msg+="...Fill Email\n";
		}
		if(email!="")
		{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(email))
		{
		msg+="...Fill valid Email address\n";
		}	
		}
		if(address=="")
		{
		msg+="...Fill Address\n";
		}
		
		if(comments=="")
		{
		msg+="...Fill Comments\n";
		}
		if(details=="0")
		{
		msg+="...Select Need Details On\n";
		}
			
	if(msg!="")
		{
		alert(headermsg+msg);
		submitOK="false";
		}
	
	
	if (submitOK=="false")
 		{
 		return false;
 		}		
	
}	
///////////////////////////////////////////////
////////////////////////////////////////////////////

function validate_manpower()
{
	var submitOK="true";
	var msg="";
	var headermsg="Please fill the requiring field!......\n";


var company=document.getElementById("company").value;
var address=document.getElementById("address1").value;
var telno=document.getElementById("telno").value;
var name=document.getElementById("name").value; 
var dept=document.getElementById("dept").value;
var mobile=document.getElementById("mobile").value;
var email=document.getElementById("email").value; 
var quali=document.getElementById("quali").value;
var exp=document.getElementById("exp").value; 
var postplace=document.getElementById("postplace").value; 
var skillset=document.getElementById("skillset").value; 
var other=document.getElementById("other").value;  


 		if(company=="")
		{
		msg+="...Fill Company Name\n";
		}
		if(address=="")
		{
		msg+="...Fill Address\n";
		}
		if(contact!="")
		{
	 	if(isNaN(contact))
		{
		submitOK="false";
		msg+="...Fill Valid Contact \n";
		}
		}
		if(name=="")
		{
		msg+="...Fill Contact Person Name\n";
		}
		
		
		if(mobile!="")
		{
	 	if(isNaN(mobile))
		{
		submitOK="false";
		msg+="...Fill Valid Mobile No. \n";
		}
		}
		if(email=="")
		{
		msg+="...Fill Email\n";
		}
		if(email!="")
		{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(email))
		{
		msg+="...Fill valid Email address\n";
		}	
		}
		
			
	if(msg!="")
		{
		alert(headermsg+msg);
		submitOK="false";
		}
	
	
	if (submitOK=="false")
 		{
 		return false;
 		}		
	
}	
///////////////////////////////////////////////
////////////////////////////////////////////////////

function validate_careers()
{
	var submitOK="true";
	var msg="";
	var headermsg="Please fill the requiring field!......\n";


var name=document.getElementById("name").value;
var organization=document.getElementById("organization").value;
var country=document.getElementById("country").value;
var contact=document.getElementById("contact").value; 
var email=document.getElementById("mail").value;
var resume=document.getElementById("resume").value; 


 		if(name=="")
		{
		msg+="...Fill Name\n";
		}
		if(organization=="")
		{
		submitOK="false";
		msg+="...Fill Organization \n";
		}
		if(country=="")
		{
		submitOK="false";
		msg+="...Fill Country \n";
		}
		if(contact=="")
		{
		submitOK="false";
		msg+="...Fill Contact \n";
		}
		if(contact!="")
		{
	 	if(isNaN(contact))
		{
		submitOK="false";
		msg+="...Fill Valid Contact \n";
		}
		}
		if(email=="")
		{
		msg+="...Fill Email\n";
		}
		if(email!="")
		{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(email))
		{
		msg+="...Fill valid Email address\n";
		}	
		}
		if(resume=="")
		{
		msg+="...Select your Resume\n";
		}
		if(resume!="")
	 	{
			var convertfilename=resume.toLowerCase(); 
			var file =convertfilename;
			var mime = file.substr(file.lastIndexOf('.'));
			
				if (mime!= '.doc' && mime!= 'docx')
				{
				submitOK="false";
				msg+="...Select only .doc or .docx file \n";
				
				}
		
		}	
		
			
	if(msg!="")
		{
		alert(headermsg+msg);
		submitOK="false";
		}
	
	
	if (submitOK=="false")
 		{
 		return false;
 		}		
	
}	
///////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////