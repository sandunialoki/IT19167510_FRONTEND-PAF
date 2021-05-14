$(document).ready(function () {
    if ($("#alertSuccess").text().trim() == "") {
        $("#alertSuccess").hide();
    }
    $("#alertError").hide();
    $("#btncancel").addClass('invisible');
    showProjects();
});


function showProjects() {
	$.ajax(
        {
            url: "ProjectAPI",
            type: "GET",
            dataType: "text",
            complete: function (response, status) {
                onGetComplete(response.responseText, status);
            }
        });
}


function onGetComplete(response, status) {
	if (status == "success") {
        var res = JSON.parse(response);
        $("#projectsGrid").html(res.data);
    } else if (status == "error") {
        $("#alertError").text("error...");
        $("#alertError").show();
    } else {
        $("#alertError").text("error...");
        $("#alertError").show();
    }
}


$(document).on("click", "#btnSubmit", function (event) {
    // Clear alerts
    $("#alertSuccess").text("");
    $("#alertSuccess").hide();
    $("#alertError").text("");
    $("#alertError").hide();
    // Form validation
    var status = validateForm();
    if (status != true) {
        $("#alertError").text(status);
        $("#alertError").show();
        return;
    }
    // If valid
    //check if put or post
    var type = ($("#hiddenProjectId").val() == "") ? "POST" : "PUT";
    $.ajax(
        {
            url: "ProjectAPI",
            type: type,
            data: $("#projectsForm").serialize(),
            dataType: "text",
            complete: function (response, status) {
                onSaveComplete(response.responseText, status);
            }
        });
});


function onSaveComplete(response, status) {
    if (status == "success") {
        var res = JSON.parse(response);
        if (res.status.trim() == "success") {
            $("#alertSuccess").text("succeeded...");
            $("#alertSuccess").show();
            $("#projectsGrid").html(res.data);
        } else if (res.status.trim() == "error") {
            $("#alertError").text(res.data);
            $("#alertError").show();
        }
    } else if (status == "error") {
        $("#alertError").text("error...");
        $("#alertError").show();
    } else {
        $("#alertError").text("error...");
        $("#alertError").show();
    }
    $("#hiddenProjectId").val("");
    $("#btnSubmit").text("Add Project");
    $("#projectsForm")[0].reset();
}


$(document).on("click", "#btnUpdate", function (event) {
    $("#hiddenProjectId").val($(this).data("projectid"));
    $("#btnSubmit").text("Update Project");
    $("#researcherId").val($(this).closest("tr").find('td:eq(1)').text());
    $("#projectName").val($(this).closest("tr").find('td:eq(2)').text());
    $("#projectDesc").val($(this).closest("tr").find('td:eq(3)').text());
    $("#catId").val($(this).closest("tr").find('td:eq(4)').text());
    $("#project_start_date").val($(this).closest("tr").find('td:eq(5)').text());
	$("#project_end_date").val($(this).closest("tr").find('td:eq(6)').text());
    $("#expected_total_budget").val($(this).closest("tr").find('td:eq(7)').text());
});


$(document).on("click", "#btnDelete", function (event) {
    $.ajax(
        {
            url: "ProjectAPI",
            type: "DELETE",
            data: "projectId=" + $(this).data("projectid"),
            dataType: "text",
            complete: function (response, status) {
                onDeleteComplete(response.responseText, status);
            }
        });
});


function onDeleteComplete(response, status) {
    if (status == "success") {
        var res = JSON.parse(response);
        if (res.status.trim() == "success") {
            $("#alertSuccess").text("research project deleted...");
            $("#alertSuccess").show();
            $("#projectsGrid").html(res.data);
        } else if (res.status.trim() == "error") {
            $("#alertError").text(res.data);
            $("#alertError").show();
        }
    } else if (status == "error") {
        $("#alertError").text("error ...");
        $("#alertError").show();
    } else {
        $("#alertError").text("error ...");
        $("#alertError").show();
    }
}


//Validate Form for research project form
function validateForm() {
    //validations using form input ids
    if($("#researcherId").val().trim() == "") {
    	return "Researcher ID cannot be empty."
    }
    
    if($("#projectName").val().trim() == "") {
    	return "Project Name cannot be empty."
    }
    
    if($("#projectDesc").val().trim() == "") {
    	return "Project Description cannot be empty."
    }
    
    if($("#catId").val().trim() == "") {
    	return "Category ID cannot be empty."
    }
    
	if($("#project_start_date").val().trim() == "") {
    	return "Project start date cannot be empty."
    }
	
	if($("#project_end_date").val().trim() == "") {
    	return "Project start date cannot be empty."
    }
	
    var expected_total_budget = $("#expected_total_budget").val().trim();
    if(expected_total_budget == "") {
    	return "Expected Total Budget cannot be empty."
    }
    
    if(! $.isNumeric(expected_total_budget)) {
    	return "Invalid price."
    }
    
    return true;
}