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
						<title>Craig Burke - Save Travels - home</title>
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
							<!-- == Home button == -->
							<!-- <p class="w-100"></p>
							<a class="btn btn-success float-end mb-3" href="/books/new">button1</a>
							<p class="w-100"></p> -->
							<!-- == Home button == -->
							<!-- <p class="w-100"></p>
							<a class="btn btn-info float-end mb-3" href="/books/newToo">button2</a>
							<p class="w-100"></p> -->
							<p class="w-100 mt-5"></p>


							<p class="w-100"></p>
							<!-- == table == -->
							<div class="container bg-primary text-dark w-50">
								<h1 class="text-success">Save Travels</h1>
								<table class="table table-striped p-5 border border-2" id="fruit_table">
									<thead>
										<tr>
											<th scope="col" class="h4 text-center">Expense</th>
											<th scope="col" class="h4 text-center">Vendor</th>
											<th scope="col" class="h4 text-center">Amount</th>
											<th scope="col" class="h4 text-center">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="expense" items="${expenses}">
											<tr>

												<td scope="row">
													<p class="text-center">
														<c:out value="${expense.name}"></c:out>
													</p>
												</td>

												<td scope="row">
													<p class="text-center">
														<c:out value="${expense.vendor}"></c:out>
													</p>
												</td>

												<td scope="row">
													<p class="text-center">
														<!-- <c:out value="${expense.amount}"></c:out> -->
														<fmt:formatNumber value="${expense.amount}" type="currency" />
													</p>
												</td>

												<td scope="row">
													<p class="text-center">
														<!-- <c:out value="${expense.amount}"></c:out> -->
														<a href="/expenses/update/${expense.id}">edit</a>
														<!-- <fmt:formatNumber value="${expense.amount}" type="currency" /> -->
													</p>
												</td>


											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
						<p class="w-100"></p>
						<!-- End of Container -->


						<p class="w-100"></p>
						<!-- == form == -->
						<div
							class="container bg-secondary text-light rounded-3 w-25 mt-5 border border-info border-5 pb-5">
							<form:form action="/expenses/process" method="post" modelAttribute="expense">

								<div class="mb-3">
									<p>
										<form:label path="name">Expense Name</form:label>
										<form:errors path="name" class="text-danger h5" />
										<form:input path="name" class="form-control text-dark"
											placeholder="expense name" />
									</p>
								</div>

								<div class="mb-3">
									<p>
										<form:label path="vendor">Vendor</form:label>
										<form:errors path="vendor" class="text-danger h5" />
										<form:input path="vendor" class="form-control" placeholder="vendor" />
									</p>
								</div>

								<div class="mb-3">
									<p>
										<form:label path="amount">Amount</form:label>
										<form:errors path="amount" class="text-danger h5" />
										<form:input type="number" step="0.01" path="amount" class="form-control w-25"
											placeholder="amount" />
									</p>
								</div>

								<div class="mb-3">
									<p>
										<form:label path="description">Description</form:label>
										<form:errors path="description" class="text-danger h5" />
										<form:textarea path="description" class="form-control"
											placeholder="description" />
									</p>
								</div>

								<input type="submit" value="Add New Expense" class="btn btn-warning float-start" />

							</form:form>

						</div>

						<p class="w-100"></p>



						</div>
						<p class="w-100"></p>
						<!-- End of Container -->
					</body>

					</html>