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
				<form id="projectsForm" class="form col-12">
					<div class="row">
						<input type="text" id="researcherId" name="researcherId"
							placeholder="Researcher ID" class="form-control col-12 mb-2">
						<input type="text" id="projectName" name="projectName"
							placeholder="Research Project name" class="form-control col-12 mb-2">
						<input type="text" id="projectDesc" name="projectDesc"
							placeholder="Research Project Description" class="form-control col-12 mb-2">
						<select class="form-control col-12 mb-2" id="catId" name="catId">
							<option value="RC21000001">AI</option>
							<option value="RC21000002">Information and Intelligent Systems</option>
							<option value="RC21000003">Energy and Fuels </option>
							<option value="RC21000004">Robotics and Engineering</option>
							<option value="RC21000005">Telecommunications</option>
							<option value="RC21000006">Theoretical Physics</option>
							<option value="RC21000007">Mathematics</option>
							<option value="RC21000008">Computer Vision</option>
							<option value="RC21000009">NLP</option>
							<option value="RC21000010">Cyber security</option>
						</select>
						<input type="text" id="project_start_date" name="project_start_date"
							placeholder="Project start date" class="form-control col-12 mb-2">
						<input type="text" id="project_end_date" name="project_end_date"
							placeholder="Project End Date" class="form-control col-12 mb-2">	
						<input type="text" id="expected_total_budget" name="expected_total_budget"
							placeholder="Expected Total Budget" class="form-control col-12 mb-2">
						<input type="hidden" id="hiddenProjectId" name="hiddenProjectId" value="">
						<button type="button" id="btnSubmit"
							class="form-control btn btn-primary mb-2" value="" class="col-12">Add
							Project</button>
					</div>
				</form>
			</div>
			<div class="row pb-3">
				<br>
				<div id='alertSuccess'class='alert alert-success alertSuccess'></div>
				<div id='alertError' class='alert alert-danger alertError'></div>
				<br>
			</div>
			<div class="row pb-3">
				<h3 class="col-12">Projects Table</h3>
				<div class="" id="projectsGrid">
					<!-- auto generated table on AJAX request -->
				</div>
			</div>
		</div>
	</main>
</body>
</html>