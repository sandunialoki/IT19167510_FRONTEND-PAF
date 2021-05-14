package com.gadgetbadget.researchhub.model;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class ProjectAPI
 */
@WebServlet("/ProjectAPI")
public class ProjectAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Researchproject projectObj = new Researchproject();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonObject res = projectObj.readProjects(null);
		JsonObject table = getTable(res);
		System.out.println(table.toString());
		response.getWriter().append(table.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonObject res = null;
		
		try {
			String res_id = request.getParameter("researcherId").toString();
			String project_name = request.getParameter("projectName").toString();
			String project_desc = request.getParameter("projectDesc").toString();
			String cat_id = request.getParameter("catId").toString();
			String project_start_date = request.getParameter("project_start_date").toString();
			String project_end_date = request.getParameter("project_end_date").toString();
			String expected_total_budget = request.getParameter("expected_total_budget").toString();
			System.out.println(res_id+" "+project_name+" "+project_desc+" "+cat_id+" "+project_start_date+" "+project_end_date+ " " +expected_total_budget);

			JsonObject insertRes = projectObj.insertProject(res_id, project_name, project_desc, cat_id, project_start_date, project_end_date, expected_total_budget);
			System.out.println("res= " + insertRes.toString());

			if (! insertRes.get("STATUS").getAsString().equalsIgnoreCase("SUCCESSFUL")) {
				res = new JsonObject();
				res.addProperty("status", "error");
				res.addProperty("data", "error...");
				response.getWriter().append(res.toString());
				return;
			}

			JsonObject table = getTable(projectObj.readProjects(null));
			res = new JsonObject();
			res.addProperty("status", "success");
			res.addProperty("data", table.get("data").getAsString());

		} catch (Exception ex) {
			ex.printStackTrace();
			res = new JsonObject();
			res.addProperty("status", "error");
			res.addProperty("data", "error...");
		}
		response.getWriter().append(res.toString());
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonObject res = null;

		try {
			Map<String, String> map = getMap(request);
			String proj_id = map.get("hiddenProjectId").toString();
			String res_id = map.get("researcherId").toString();
			String project_name = map.get("projectName").toString();
			String project_desc = map.get("projectDesc").toString();
			String cat_id = map.get("catId").toString();
			String project_start_date = map.get("project_start_date").toString();
			String project_end_date = map.get("project_end_date").toString();
			String expected_total_budget = map.get("expected_total_budget").toString();
			System.out.println(res_id+" "+project_name+" "+project_desc+" "+cat_id+" "+project_start_date+" "+project_end_date+ " " +expected_total_budget);

			JsonObject updateRes = projectObj.updateProject(proj_id, res_id, project_name, project_desc, cat_id, project_start_date, project_end_date, expected_total_budget);
			System.out.println("res= " + updateRes.toString());

			if (! updateRes.get("STATUS").getAsString().equalsIgnoreCase("SUCCESSFUL")) {
				res = new JsonObject();
				res.addProperty("status", "error");
				res.addProperty("data", "error...");
				response.getWriter().append(res.toString());
				return;
			}

			JsonObject table = getTable(projectObj.readProjects(null));
			res = new JsonObject();
			res.addProperty("status", "success");
			res.addProperty("data", table.get("data").getAsString());

		} catch (Exception ex) {
			ex.printStackTrace();
			res = new JsonObject();
			res.addProperty("status", "error");
			res.addProperty("data", "error...");
		}
		response.getWriter().append(res.toString());
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonObject res = null;

		try {
			Map<String, String> map = getMap(request);
			String proj_id = map.get("projectId").toString();
			System.out.println(proj_id);

			JsonObject deleteRes = projectObj.deleteProject(null, proj_id);
			System.out.println("res= " + deleteRes.toString());

			if (! deleteRes.get("STATUS").getAsString().equalsIgnoreCase("SUCCESSFUL")) {
				res = new JsonObject();
				res.addProperty("status", "error");
				res.addProperty("data", "error...");
				response.getWriter().append(res.toString());
				return;
			}

			JsonObject table = getTable(projectObj.readProjects(null));
			res = new JsonObject();
			res.addProperty("status", "success");
			res.addProperty("data", table.get("data").getAsString());

		} catch (Exception ex) {
			ex.printStackTrace();
			res = new JsonObject();
			res.addProperty("status", "error");
			res.addProperty("data", "error...");
		}
		response.getWriter().append(res.toString());
	}

	private JsonObject getTable(JsonObject productList) {
		//generating research projects table
		JsonObject res;		
		String tableString = "<table class='table table-sm table-striped'>"
				+ "<thead><tr>"
				+ "<th>project ID</th>"
				+ "<th>Researcher ID</th>"
				+ "<th>Product Description</th>"
				+ "<th>Category ID</th>"
				+ "<th>project start date</th>"
				+ "<th>project end date</th>"
				+ "<th>expected total budget</th>"
				+ "<th>Date Added</th>"
				+ "<th>Update</th>"
				+ "<th>Delete</th>"
				+ "</tr><thead><tbody>";

		if(! projectList.has("projects")) {
			res = new JsonObject();
			res.addProperty("status", "error");
			res.addProperty("data", "error...");
			return res;
		}

		for(JsonElement elem : projectList.get("projects").getAsJsonArray()) {
			JsonObject project = elem.getAsJsonObject();
			tableString += "<tr><td>"+ project.get("project_id").getAsString() +"</td>"
					+ "<td>"+ project.get("researcher_id").getAsString() +"</td>"
					+ "<td>"+ project.get("project_name").getAsString() +"</td>"
					+ "<td>"+ project.get("project_description").getAsString() +"</td>"
					+ "<td>"+ project.get("category_id").getAsString() +"</td>"
					+ "<td>"+ project.get("project_start_date").getAsString() +"</td>"
					+ "<td>"+ project.get("project_end_date").getAsString() +"</td>"
					+ "<td>"+ project.get("expected_total_budget").getAsString() +"</td>"
					+ "<td>"+ project.get("date_added").getAsString() +"</td>"
					+ "<td><input type='button' class='btn btn-primary btnUpdate' id='btnUpdate' data-projectid='"+project.get("project_id").getAsString()+"' value='Update'></td>"
					+ "<td><input type='button' class='btn btn-primary btnDelete' id='btnDelete' data-projectid='"+project.get("project_id").getAsString()+"' value='Delete'</td></tr>";
		}

		tableString += "</tbody></table>";

		res = new JsonObject();
		res.addProperty("status", "success");
		res.addProperty("data", tableString);

		return res;
	}

	// Convert request parameters to a Map
		private static Map<String,String> getMap(HttpServletRequest request)
		{
			Map<String, String> map = new HashMap<String, String>();
			try
			{
				Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
				String queryString = scanner.hasNext() ?
						scanner.useDelimiter("\\A").next() : "";
				scanner.close();
				String[] params = queryString.split("&");
				for (String param : params)
				{
					String[] p = param.split("=");

					//decoding the string before putting into the map to avoid undesired strings
					map.put(p[0], java.net.URLDecoder.decode(p[1], StandardCharsets.UTF_8.name()));
				}
			}
			catch (Exception ex)
			{
				ex.printStackTrace();
			}
			return map;
		}

}
