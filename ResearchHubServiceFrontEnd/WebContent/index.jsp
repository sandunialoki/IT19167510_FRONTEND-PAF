<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
				 <input type="text" id="researcherID" name="researcherID">
				 </div>
			 
	<!--PROJECT NAME-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Project Name : </span>
				 </div>
				 <input type="text" id="projectName" name="projectName">
				 </div>
				 
	<!--PROJECT DESCRIPTION-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Project Description : </span>
				 </div>
				 <input type="text" id="projectDescription" name="projectDescription">
				 </div>
		 
	<!-- CATEGORY ID -->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
	 		<span class="input-group-text" id="lblName">
	 			<label for="categoryid"> Category ID :</label></span>
				 </div>
				<select name="categoryid" id="categoryid">
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
				 <input type="text" id="projectStartDate" name="projectStartDate">
				 </div>
				 
	<!--PROJECT END DATE-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Project End date : </span>
				 </div>
				 <input type="text" id="projectEndDate" name="projectEndDate">
				 </div>
				 
	<!--EXPECTED TOTAL BUDGET-->
	<div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
				<span class="input-group-text" id="lblName">Expected Total Budget : </span>
				 </div>
				 <input type="text" id="expectedTotalBudget" name="expectedTotalBudget">
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