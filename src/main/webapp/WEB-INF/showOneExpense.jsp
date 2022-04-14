<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
	<!-- Here we have to import the Date class. -->
	<!-- You will put the import in the first line of the jsp tag. Use the import attribute -->

	<!-- c:out ; c:forEach ; c:if -->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!-- Formatting (like dates) -->
		<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!-- form:form -->
			<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<!-- for rendering errors on PUT routes -->
				<%@ page isErrorPage="true" %>

					<!DOCTYPE html>

					<html>

					<head>
						<meta charset="UTF-8" />
						<title>Craig Burke - Save Travels - showOneExpense</title>
						<!-- Bootstrap -->
						<!-- CSS only -->
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
							crossorigin="anonymous" />
						<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
							integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
							crossorigin="anonymous"></script>
						<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
							integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
							crossorigin="anonymous"></script>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
						<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
					</head>

					<body>
						<!-- Beginning of Container -->
						<div class="container">

							<p class="w-100"></p>
							<a class="btn btn-danger float-end mb-3 me-3" href="/expenses/delete/${expense.id}">Delete
								Expense</a>
							<p class="w-100"></p>
							<p class="w-100 mt-5"></p>
							<p class="w-100"></p>

							<p class="w-100"></p>
							<a class="btn btn-warning float-end mb-3 me-3" href="/expenses/update/${expense.id}">Edit
								Expense</a>
							<p class="w-100"></p>
							<p class="w-100 mt-5"></p>
							<p class="w-100"></p>

							<p class="w-100"></p>
							<a class="btn btn-success float-end mb-3 me-3" href="/expenses">Home</a>
							<p class="w-100"></p>
							<p class="w-100 mt-5"></p>
							<p class="w-100"></p>

							<div class="container w-50">

								<h1 class="text-success">Save Travels - Show Expense</h1>
								<p class="w-100 mt-5"></p>

								<div class="container">

									<ul class="list-inline">
										<li class="list-inline-item">Expense:</li>
										<li class="list-inline-item h1 text-warning">
											<c:out value="${expense.name}"></c:out>
										</li>
									</ul>

									<ul class="list-inline">
										<li class="list-inline-item">Vendor:</li>
										<li class="list-inline-item fs-3 text-info">
											<c:out value="${expense.vendor}"></c:out>
										</li>
									</ul>

									<ul class="list-inline">
										<li class="list-inline-item">Amount:</li>
										<li class="list-inline-item fs-3 text-warning">
											<fmt:formatNumber value="${expense.amount}" type="currency" />
										</li>
									</ul>

									<ul class="list-inline">
										<li class="list-inline-item">Description:</li>
										<li class="list-inline-item fs-3 text-info">
											<c:out value="${expense.description}"></c:out>
										</li>

									</ul>
								</div>
							</div>

						</div>
						<p class="w-100"></p>
						<!-- End of Container -->
					</body>

					</html>