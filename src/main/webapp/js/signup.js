function validate()
	{
		
		//validation for first names
				
		var fname=document.getElementById("Fname").value;
		
		if(fname=="" ||fname=="null")
		{
			document.getElementById("fNmError").innerHTML="*Name Can Not Be Empty";
			return false;
		}
		
		if(fname.length<2 || fname.length>=15)
			{
				document.getElementById("fNmError").innerHTML="**Please Enter Valid Name";
				return false;
			}
		if(!isNaN(fname))
		{
			document.getElementById("fNmError").innerHTML="**Please Enter Character Only";
			return false;
		}
		
		//validatiion for Last name
		
		var lname=document.getElementById("Lname").value;
		
		if(lname=="null"|| lname=="")
			{
				document.getElementById("lNmError").innerHTML="**Please Enter Last Name";
				return false;
			}
		if(!isNaN(lname))
		{
			document.getElementById("lNmError").innerHTML="**Please Enter Character Only";
			return false;
		}
		if(lname.length<4 || lname.length>=20)
		{
			document.getElementById("lNmError").innerHTML="**Please Enter Valid Last Name";
			return false;
		}
		
		//valiation for email address
		
		//var Mail=document.myForm.email.value;
		var Mail=document.getElementById("Email").value;
		
		if(Mail=="" || Mail=="null")
		{
			document.getElementById("emailError").innerHTML="*Please Enter Email";
			return false;
		}
		
		var atposition=Mail.indexOf("@");  
		var dotposition=Mail.lastIndexOf(".");  
			if (atposition<=1 || dotposition+2>=Mail.length)
			{  
			  document.getElementById("emailError").innerHTML="**Please Enter Valid Email";  
			  return false;  
			}
			
			
		//VAlidation for mobile Number
		
		var mbNumber=document.getElementById("mobileNumber").value;
		
		if(mbNumber=="")
		{
			document.getElementById("mobNmError").innerHTML="**Please Enter Mobile Number";
			return false;
		}
		if(mbNumber.length!==10 )
		{
			document.getElementById("mobNmError").innerHTML="**Please Enter 10 digit mobile Number";
			return false;
		}
		if(isNaN(mbNumber))
		{
			document.getElementById("mobNmError").innerHTML="**Enter Numbers Only";
			return false;
		}
		
		//validation for password
		
		var Pass=document.getElementById("pass").value;
		
		if(Pass=="null" || Pass=="")
		{
			document.getElementById("passError").innerHTML="**Please Enter Password";
			return false;
		}
		if(Pass.length<6)
		{
			document.getElementById("passError").innerHTML="**Please Enter 6 digit Password";
			return false;
		}
		
		//validation for confirm password
		
		var Conpass=document.getElementById("cpass").value;
		
		if(Conpass=="null" || Conpass=="")
		{
			document.getElementById("cPassError").innerHTML="**Please Enter Password";
			return false;
		}
		if(Pass!==Conpass)
		{
			document.getElementById("cPassError").innerHTML="**Password Not Matched";
			return false;
		}
		
	}