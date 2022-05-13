function resp(){
	document.getElementById("respEm").style.color = "#23D17F";
	document.getElementById("oldEm").style.color = "#FFF";
	document.getElementById("nrespEm").style.color = "#FFF";
	document.getElementById("addFunc").style.color = "#FFF";
	document.getElementById("edtFunc").style.color = "#FFF";
	document.getElementById("exFunc").style.color = "#FFF";
	document.getElementById('backSitu').src = "home/emailRep.jsp";
}
function notResp(){
	document.getElementById("nrespEm").style.color = "#23D17F";
	document.getElementById("oldEm").style.color = "#FFF";
	document.getElementById("addFunc").style.color = "#FFF";
	document.getElementById("edtFunc").style.color = "#FFF";
	document.getElementById("respEm").style.color = "#FFF";
	document.getElementById("exFunc").style.color = "#FFF";
	document.getElementById('backSitu').src = "home/emailnotRep.jsp";
}
function addFunc(){
	document.getElementById("addFunc").style.color = "#23D17F";
	document.getElementById("oldEm").style.color = "#FFF";
	document.getElementById("respEm").style.color = "#FFF";
	document.getElementById("nrespEm").style.color = "#FFF";
	document.getElementById("edtFunc").style.color = "#FFF";
	document.getElementById("exFunc").style.color = "#FFF";
	document.getElementById('backSitu').src = "home/allFunc.jsp?idFunc=0";
}

function edtFunc(){
	document.getElementById("edtFunc").style.color = "#23D17F";
	document.getElementById("oldEm").style.color = "#FFF";
	document.getElementById("respEm").style.color = "#FFF";
	document.getElementById("nrespEm").style.color = "#FFF";
	document.getElementById("addFunc").style.color = "#FFF";
	document.getElementById("exFunc").style.color = "#FFF";
	document.getElementById('backSitu').src = "home/allFunc.jsp?idFunc=1";
}

function oldEm(){
	document.getElementById("oldEm").style.color = "#23D17F";
	document.getElementById("edtFunc").style.color = "#FFF";
	document.getElementById("respEm").style.color = "#FFF";
	document.getElementById("nrespEm").style.color = "#FFF";
	document.getElementById("addFunc").style.color = "#FFF";
	document.getElementById("exFunc").style.color = "#FFF";
	document.getElementById('backSitu').src = "home/oldEmails.jsp";
}

function exit(){
	   window.location.href="../home/signOut.jsp";
   }