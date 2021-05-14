<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ReseachHub Research Project</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="Views/ResearchHub.css">
<!-- JQuery -->
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/ResearchHub.js"></script>
</head>
<body>
	<main>
		<div class="container py-5">
			<div class="row pb-3">
				<h3 class="col-12">Research Project Form</h3>
				<form id="productsForm" class="form col-12">
					<div class="row">
						<input type="text" id="researcherId" name="researcherId"
							placeholder="Researcher ID" class="form-control col-12 mb-2">
						<input type="text" id="projectName" name="projectName"
							placeholder="Research Project name" class="form-control col-12 mb-2">
						<input type="text" id="projectDesc" name="projectDesc"
							placeholder="Research Project Description" class="form-control col-12 mb-2">
						<select class="form-control col-12 mb-2" id="catId" name="catId">
							<option value="PC21000001">Network Devices</option>
							<option value="PC21000002">Books and Magazines</option>
							<option value="PC21000003">Clothes and Wearable </option>
							<option value="PC21000004">Research Publications</option>
							<option value="PC21000005">Software Products</option>
							<option value="PC21000006">Healthcare Devices and Tools</option>
							<option value="PC21000007">Vehicles</option>
						</select>
						<input type="text" id="project_start_date" name="project_start_date"
							placeholder="Project start date" class="form-control col-12 mb-2">
						<input type="text" id="project_end_date" name="project_end_date"
							placeholder="Project End Date" class="form-control col-12 mb-2">
						<input type="text" id="expected_budget" name="expected_budget"
							placeholder="Expected Budget" class="form-control col-12 mb-2">
						<input type="hidden" id="hiddenProductId" name="hiddenProductId" value="">
						<button type="button" id="btnSubmit"
							class="form-control btn btn-primary mb-2" value="" class="col-12">Add
							Product</button>
					</div>
				</form>
			</div>
			<div class="row pb-3">
				<br>
				<div id='alertSuccess'
					class='alert alert-success alertSuccess'></div>
				<div id='alertError' class='alert alert-danger alertError'></div>
				<br>
			</div>
			<div class="row pb-3">
				<h3 class="col-12">Projects Table</h3>
				<div class="" id="productsGrid">
					<!-- auto generated table on AJAX request -->
				</div>
			</div>
		</div>
	</main>
</body>
</html>