  function toggle(){
	 const x = document.getElementById("password");
	  const icon=document.querySelector('.visibility');
		  
		  if (x.type === "password") {
			    x.setAttribute('type','text');
			    icon.innerHTML='visibility';
			  } else {
				  x.setAttribute('type','password');
				  icon.innerHTML='visibility_off';
			  }
		  password=!password;
		  
  }
