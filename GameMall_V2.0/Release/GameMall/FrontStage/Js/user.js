function UserCheck() {
    var username = document.getElementById("UserName").value;
    if (username == "") {
        document.getElementById("tip_userName").innerHTML = "<img src='/Images/User/错误.png' />";
    }
    else {
        document.getElementById("tip_userName").innerHTML = "";
        document.getElementById("tip_userName").innerHTML = "<img src='/Images/User/正确.png' />";
    }
}
function PasswordCheck() {
    var Password = document.getElementById("Password").value;
    if (Password == "") {
        document.getElementById("tip_password").innerHTML = "<img src='/Images/User/错误.png' />";
    }
    else {
        document.getElementById("tip_password").innerHTML = "";
        document.getElementById("tip_password").innerHTML = "<img src='/Images/User/正确.png' />";
    }
}