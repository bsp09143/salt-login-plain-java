function maskData(data, key) {
	// data is the encrypted 32 digit string
	// key will be the Random generated number from the JSP
	var maskedData = '';
	for (i = 0; i < data.length; i++) {
		maskedData = maskedData + ''
				+ ((data.charCodeAt(i) * 3) + parseInt(key));
	}
	maskedData = maskedData + '' + key;
	return maskedData;
}

function onSubmit() {
	if (validate()) {
		//document.frm_login.mdiresu.value = maskData(document.frm_login.mdiresu.value, fractionJS);		
		page = "/PassTypeController?RSAUSERID="+ document.frm_login.mdiresu.value;
		var doc = sendUserRequest(page);
		var node = doc.getElementsByTagName("RUPV"); 
		var value = "";
		var id="";		
		for (i = 0; i < node.length; i++) {
			value = node[i].getAttribute("name");
			id=node[i].getAttribute("seqpwd");
		} 
		var arrayOfuk = value;
		document.frm_login.mdwp.value = maskData(document.frm_login.mdwp.value,fractionJS);
		document.frm_login.shadwp.value=document.frm_login.shadwp.value+arrayOfuk;
		document.frm_login.id.value=id;
		document.frm_login.action=GLSHOME+"/LoginController";
		document.frm_login.submit();
	}
}

function sendUserRequest(page) {
	var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
		if (ajaxRequest.overrideMimeType) {
			ajaxRequest.overrideMimeType('text/xml');
		}
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.open("POST", GLSHOME + "/" + page, false);
	ajaxRequest.send(null);
	return ajaxRequest.responseXML;
}

function validate() {

	var userNameAfterLogin = document.frm_login.userName.value;
	var passwordAfterLogin = document.frm_login.password.value;

	if (!(validateUsername())) {
		return false;
	}
	if (!(validatePassword())) {
		return false;
	}

	if (document.frm_login.submitted == 'true') {
		alert("You have attempted to submit this request more than once!\nPlease be patient! Your first request is being processed.");
		return false;
	}

	encrypt();

	return true;
}

function encrypt() {
	document.frm_login.mdiresu.value = hex_md5(document.frm_login.userName.value);
	document.frm_login.mdwp.value = hex_md5(document.frm_login.password.value);
	document.frm_login.shadwp.value = CryptoJS.SHA512(document.frm_login.password.value);

	var array = new Uint32Array(45);
	(navigator.vendor === "Google Inc.") ? window.crypto.getRandomValues(array)
			: window.msCrypto.getRandomValues(array);
	document.frm_login.userName.value = randomString(array);
	(navigator.vendor === "Google Inc.") ? window.crypto.getRandomValues(array)
			: window.msCrypto.getRandomValues(array);
	document.frm_login.password.value = randomString(array);

	document.frm_login.userName.value = "";
	document.frm_login.password.value = "";
	document.frm_login.userName.disabled = true;
	document.frm_login.password.disabled = true;
	document.getElementById("login").disabled = true;
	//document.frm_login.submit();
}

function randomString(iLen) 
{
	var sChrs = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	var sRnd = '';
	for (var i=0; i<iLen.length;i++)
	{
        var randomPoz = Math.floor(("0."+iLen[i]) * sChrs.length);       
		sRnd += sChrs.substring(randomPoz,randomPoz+1);
	}	
	return sRnd;
}

function validateUsername() {

	var strUserName = document.frm_login.userName.value;
	var charFound = false;
	var intLength = strUserName.length;
	var strSubUserName = strUserName.substring(intLength - 5, intLength);
	var regPassDigit = /[0-9]/;
	var result = true;
	var counter;
	var checkChar;

	if (strUserName == "") {
		alert("Please enter user id")
		document.frm_login.userName.focus();
		return false;
	}
	return true;
}

function validatePassword() {
	var strPassword = document.frm_login.password.value;
	var regPassDigit = /[0-9]/;
	var result = true;
	var counter;
	var checkChar;
	var charFound = false;
	var specialChar = "%}<>{/[]\"'?\\$`~@#%^*.!";
	var intValue = "1234567890";
	var countInt = 0;
	var countSpecial = 0;
	if (strPassword == "") {
		alert("Please enter password")
		document.frm_login.password.focus();
		return false;
	}
	return true;
}