<%@ page import = "com.gadgetbadget.researchhub.model.Researchproject" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
if (request.getParameter("action") != null)
{ 
	 Researchproject researchProjectObj = new Researchproject();
	 
	 //call insert function
	 if ( request.getParameter("action").equalsIgnoreCase("insert"))
	 {
		 String stsMsg = researchProjectObj.insertProject(request.getParameter("researcher_id"),
				 request.getParameter("project_name"), 
				 request.getParameter("project_description"), 
				 request.getParameter("category_id"), 
				 request.getParameter("project_start_date"), 
				 request.getParameter("project_end_date"), 
				 request.getParameter("expected_total_budget")).toString();
 		 session.setAttribute("statusMsg", stsMsg);
 	 }
	 
	 //call update function
	 else if (request.getParameter("action").equalsIgnoreCase("update"))
	 {
		System.out.println("newUpdate");
	    String stsMsg = researchProjectObj.updateProject(request.getParameter("project_id"),
	    		request.getParameter("researcher_id"),
				 request.getParameter("project_name"), 
				 request.getParameter("project_description"), 
				 request.getParameter("category_id"), 
				 request.getParameter("project_start_date"), 
				 request.getParameter("project_end_date"), 
				 request.getParameter("expected_total_budget")).toString();
	 	session.setAttribute("statusMsg", stsMsg);
	 }
	 
	 //call delete function
	 else if(request.getParameter("action").equalsIgnoreCase("delete"))
	 {
		System.out.println("newDelete");
	 	String stsMsg = researchProjectObj.deleteProject(request.getParameter("researcher_id"), request.getParameter("project_id")).toString();
	    session.setAttribute("statusMsg", stsMsg);
	 }
 

}	
 %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ResearchHub ResearchProjects</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-8">
 
 <h1 class="m-3">ResearchHub ResearchProjects</h1>
 
 <form id="formproject">
	<!--RESEARCHER ID -->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Researcher ID : </span>
				 </div>
				 <input type="text" id="researcher_id" name="researcher_id">
				 </div>
			 
	<!--PROJECT NAME-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Project Name : </span>
				 </div>
				 <input type="text" id="project_name" name="project_name">
				 </div>
				 
	<!--PROJECT DESCRIPTION-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Project Description : </span>
				 </div>
				 <input type="text" id="project_description" name="project_description">
				 </div>
		 
	<!-- CATEGORY ID -->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
	 		<span class="input-group-text" id="lblName">
	 			<label for="categoryid"> Category ID :</label></span>
				 </div>
				<select name="categoryid" id="categoryid">
					<option value="PC21000000">--- Select A Category ---</option>
				    <option value="PC21000001">PC21000001</option>
				    <option value="PC21000002">PC21000002</option>
				    <option value="PC21000003">PC21000003</option>
				    <option value="PC21000004">PC21000004</option>
				    <option value="PC21000005">PC21000005</option>
				    <option value="PC21000006">PC21000006</option>
				    <option value="PC21000007">PC21000007</option>
				    <option value="PC21000008">PC21000008</option>
				    <option value="PC21000009">PC21000009</option>
				    <option value="PC210000010">PC21000010</option>
				</select>
				 </div>
		 
    <!--PROJECT START DATE-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Project Start date : </span>
				 </div>
				 <input type="text" id="project_start_date" name="project_start_date">
				 </div>
				 
	<!--PROJECT END DATE-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Project End date : </span>
				 </div>
				 <input type="text" id="project_end_date" name="project_end_date">
				 </div>
				 
	<!--EXPECTED TOTAL BUDGET-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Expected Total Budget : </span>
				 </div>
				 <input type="text" id="expected_total_budget" name="expected_total_budget">
				 </div>
 <div id="alertSuccess" class="alert alert-success"></div>
 <div id="alertError" class="alert alert-danger"></div>
<input type="button" id="btnSave" value="ADD Product" class="btn btn-primary">
</form>
</div>
</div>
 
<br>
 
<div class="row">
<div class="col-12" id="colProjects">
 
</div>
</div>
</div>
</body>
</html>