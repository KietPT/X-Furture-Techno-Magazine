// JavaScript Document
function check_register() {
    var userName = document.getElementById("userName");
    var password = document.getElementById("password");
    var confirmPassword = document.getElementById("confirmPassword");
    var fullName = document.getElementById("fullName");
    var dob = document.getElementById("birthday");
    var email = document.getElementById("email");
    var phone = document.getElementById("phone");
    var address = document.getElementById("address");
    var error = false;

    var formFullName = /^[a-zA-Z\s]+$/;
    var formPass = /^[a-zA-Z0-9@!,]{6,12}$/;
    var formEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var formPhone = /^(09|01)\d{8,9}$/;
    //validate userID
    if (userName.value.length == 0) {
        userName.focus();
        var t = document.getElementById("errorUserName");
        t.innerHTML = " * UserName can't be blank!";
        error = true;
    } else {
        var t = document.getElementById("errorUserName");
        t.innerHTML = "";
    }
    //validate Form Password
    if (formPass.test(password.value) == false) {
        password.focus();
        var t = document.getElementById("errorPassword");
        t.innerHTML = " * Password must be include letters and numbers, length from 6 to 12";
        error = true;
    } else {
        var t = document.getElementById("errorPassword");
        t.innerHTML = "";
    }
    //validate confirm password
    if (password.value != confirmPassword.value) {
        confirmPassword.focus();
        var t = document.getElementById("errorConfirmPassword");
        t.innerHTML = " * Password incorrect";
        error = true;
    } else {
        var t = document.getElementById("errorConfirmPassword");
        t.innerHTML = "";
    }
    //validate Full Name
    if (formFullName.test(fullName.value) == false) {
        fullName.focus();
        var t = document.getElementById("errorFullName");
        t.innerHTML = " * Full Name just included lettes";
        error = true;
    } else {
        var t = document.getElementById("errorFullName");
        t.innerHTML = "";
    }
    //validate birthday
    if (dob.value.length == 0) {
        dob.focus();
        var t = document.getElementById("errorBirthday");
        t.innerHTML = " * Please select birthday";
        error = true;
    } else {
        var today = new Date();
        var nowyear = today.getFullYear();
        var nowmonth = today.getMonth();
        var nowday = today.getDate();

        var b = dob.value;

        var birth = new Date(b);

        var birthyear = birth.getFullYear();
        var birthmonth = birth.getMonth();
        var birthday = birth.getDate();

        var age = nowyear - birthyear;
        var age_month = nowmonth - birthmonth;
        var age_day = nowday - birthday;

        if (age > 100) {
            dob.focus();
            var t = document.getElementById("errorBirthday");
            t.innerHTML = "* Age cannot be more than 100 Years old";
            error = true;
        } else {
            if (age_month < 0 || (age_month == 0 && age_day < 0)) {
                age = parseInt(age) - 1;
            }
            if ((age == 18 && age_month <= 0 && age_day <= 0) || age < 18) {
                dob.focus();
                var t = document.getElementById("errorBirthday");
                t.innerHTML = "* Age should be more than 18 years old.";
                error = true;
            } else {
                var t = document.getElementById("errorBirthday");
                t.innerHTML = "";
            }
        }
    }
    //validate email
    if (formEmail.test(email.value) == false) {
        email.focus();
        var t = document.getElementById("errorEmail");
        t.innerHTML = " * Invalid Email";
        error = true;
    } else {
        var t = document.getElementById("errorEmail");
        t.innerHTML = "";
    }
    //validate phone number
    if (formPhone.test(phone.value) == false) {
        phone.focus();
        var t = document.getElementById("errorPhone");
        t.innerHTML = " * Invalid Phone Number";
        error = true;
    } else {
        var t = document.getElementById("errorPhone");
        t.innerHTML = "";
    }
    //validate address
    if (address.value.length == 0) {
        address.focus();
        var t = document.getElementById("errorAddress");
        t.innerHTML = " * Address can't br blank";
        error = true;
    } else {
        var t = document.getElementById("errorAddress");
        t.innerHTML = "";
    }
}

function check_login() {
    var userName = document.getElementById("userNameLogin");
    var password = document.getElementById("passwordLogin");
    var error = false;

    var formPass = /^[a-zA-Z0-9@!,]{6,12}$/;

    //validate user name
    if (userName.value.length == 0) {
        userName.focus();
        var t = document.getElementById("errorUserNameLogin");
        t.innerHTML = " * UserName can't be blank!";
        error = true;
    } else {
        var t = document.getElementById("errorUserNameLogin");
        t.innerHTML = "";
    }
    //validate password
    if (formPass.test(passwordLogin.value) == false) {
        passwordLogin.focus();
        var t = document.getElementById("errorPassLogin");
        t.innerHTML = " * Password must be include letters and numbers, length from 6 to 12";
        error = true;
    } else {
        var t = document.getElementById("errorPassLogin");
        t.innerHTML = "";
    }
}

function check_create_account() {
    var userName = document.getElementById("userName");
    var fullName = document.getElementById("fullName");
    var dob = document.getElementById("birthday");
    var phone = document.getElementById("phone");
    var email = document.getElementById("email");
    var address = document.getElementById("address");

    var error = false;

    var formEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var formUserName = /^(MO|CO)-[a-zA-Z]{1,10}-[0-9]{3}$/;
    var formFullName = /^[a-zA-Z\s]+$/;
    var formPhone = /^(09|01)\d{8,9}$/;

    //validate userName

    if (formUserName.test(userName.value) == false) {
        userName.focus();
        var t = document.getElementById("errorUserName");
        t.innerHTML = "*Please follow the form of User Name (Ex: CO-abc-123)";
        error = true;
    } else {
        var formMO = /^(MO)-[a-zA-Z]{1,10}-[0-9]{3}$/;
        var formCO = /^(CO)-[a-zA-Z]{1,10}-[0-9]{3}$/;
        var roleSelected = $("#role :selected").text();
        if (roleSelected == 'Moderator') {
            if (formMO.test(userName.value) == false) {
                userName.focus();
                var t = document.getElementById("errorUserName");
                t.innerHTML = "*Please select role Collaborator";
                error = true;
            } else {
                var t = document.getElementById("errorUserName");
                t.innerHTML = "";
            }
        }
        if (roleSelected == 'Collaborator') {
            if (formCO.test(userName.value) == false) {
                roleSelected.focus();
                var t = document.getElementById("errorUserName");
                t.innerHTML = "*Please select role Moderator";
                error = true;
            } else {
                var t = document.getElementById("errorUserName");
                t.innerHTML = "";
            }
        }
    }
    //validate Full Name
    if (formFullName.test(fullName.value) == false) {
        fullName.focus();
        var t = document.getElementById("errorFullName");
        t.innerHTML = "* Please enter Full Name";
        error = true;
    } else {
        var t = document.getElementById("errorFullName");
        t.innerHTML = "";
    }
    //validate birthday
    if (dob.value.length == 0) {
        dob.focus();
        var t = document.getElementById("errorBirthday");
        t.innerHTML = " * Please select birthday";
        error = true;
    } else {
        var today = new Date();
        var nowyear = today.getFullYear();
        var nowmonth = today.getMonth();
        var nowday = today.getDate();

        var b = dob.value;

        var birth = new Date(b);

        var birthyear = birth.getFullYear();
        var birthmonth = birth.getMonth();
        var birthday = birth.getDate();

        var age = nowyear - birthyear;
        var age_month = nowmonth - birthmonth;
        var age_day = nowday - birthday;

        if (age > 100) {
            dob.focus();
            var t = document.getElementById("errorBirthday");
            t.innerHTML = "* Age cannot be more than 100 Years old";
            error = true;
        } else {
            if (age_month < 0 || (age_month == 0 && age_day < 0)) {
                age = parseInt(age) - 1;
            }
            if ((age == 18 && age_month <= 0 && age_day <= 0) || age < 18) {
                dob.focus();
                var t = document.getElementById("errorBirthday");
                t.innerHTML = "* Age should be more than 18 years old.";
                error = true;
            } else {
                var t = document.getElementById("errorBirthday");
                t.innerHTML = "";
            }
        }
    }
    //validate phone
    if (formPhone.test(phone.value) == false) {
        phone.focus();
        var t = document.getElementById("errorPhone");
        t.innerHTML = "* Please enter Phone Number";
        error = true;
    } else {
        var t = document.getElementById("errorPhone");
        t.innerHTML = "";
    }
    //validate email
    if (formEmail.test(email.value) == false) {
        email.focus();
        var t = document.getElementById("errorEmail");
        t.innerHTML = "* Invalid Email";
        error = true;
    } else {
        var t = document.getElementById("errorEmail");
        t.innerHTML = "";
    }
    //validate address
    if (address.value.length == 0) {
        email.focus();
        var t = document.getElementById("errorAddress");
        t.innerHTML = "* Address can't be blank";
        error = true;
    } else {
        var t = document.getElementById("errorAddress");
        t.innerHTML = "";
    }
}
function goBack(){
    window.history.back();
}
