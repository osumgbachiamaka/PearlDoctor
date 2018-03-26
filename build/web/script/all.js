/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    var checkState = "unchecked";

function switchEmailView() {
    var theCheckBox = document.getElementById("should_subscribe_email");
    var theEmailRow = document.getElementById("email_row");


    if (checkState === "checked") {
        checkState = "unchecked";
        //$("#email_row").fadeToggle(3000);
        theEmailRow.style.display = "block";
        //theCheckBox.setAttribute("checked", "checked");

    }
    else {
        checkState = "checked";
        theEmailRow.style.display = "none";
        //theCheckBox.setAttribute("checked", null);
    }
    // $("#email_row").fadeToggle(3000);
}

function handleImageLoad() {
    var object = document.getElementById("passport_file");
    object.click();
}

function previewPassport() {
    alert("SHALL PREVIEW PASSPORT");
    var object = document.getElementById("preview_image_form");
    object.submit();
}
var err = "FIELD EMPTY";



