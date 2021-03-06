<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="userhome.css">
<meta charset="UTF-8">
<title>User Home Page</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="index.do">Health Together</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
						<c:if test="${! empty sessionScope.user.firstName}">
					<li class="nav-item active"><a class="nav-link"
						href="userhome.do"> ${sessionScope.user.firstName}'s Profile<span class="sr-only"></span></a></li>
				</c:if>
					<li class="nav-item"><a class="nav-link"
						href="createupdateuser.do">Update Account</a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="createworkout.do"> Create Workout </a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="finishedworkout.do">Workout History</a></li>
				<c:if test="${! empty sessionScope.user.firstName}">
					<li class="nav-item dropdown"><a class="nav-link"
						href="logout.do"> Logout </a></li>
				</c:if>


				</ul>
				<form class="form-inline my-2 my-lg-0"
					action="workoutsearchresults.do">
					<!-- <input class="" type="search"
						aria-label="Search" name="searchterm"> -->
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
						name="searchterm">Show All Workouts</button>


				</form>
				<form class="form-inline my-2 my-lg-0"
					action="workoutsearchresults.do">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search Workout" aria-label="Search" name="searchterm">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

				</form>
				<!-- 
					<a href="workoutlistallresults.do"><input type="button" value="Show All Workouts"
					class="btn-success"></a> -->
			</div>
		</nav>
	</header>



	<main>
		<div class="card mb-3"
			style="max-width: 30rem; text-align: center; margin: auto;">
			<img class="card-img-top go-hard"
				src="https://i1.sndcdn.com/avatars-000369555311-i351q4-t500x500.jpg"
				alt="Card image cap" style="max-height: 150px;">
			<div class="card-body">
				<h5 class="card-title">
					<strong class="user">${sessionScope.user.firstName}
						${sessionScope.user.lastName} Workouts</strong>
				</h5>
				<p class="card-text"></p>
			</div>
		</div>

		<c:if test="${!empty sessionScope.user.workouts}">
		<div class="card-columns">
			<c:forEach var="myworkout" items="${sessionScope.user.workouts}">



				<c:if test="${not myworkout.active}">
					<c:if test="${myworkout.title ne 'D0NTEVER$HOW' }">
						<div class="card" style="width: 23rem;">
							<img class="card-img-top" src="${myworkout.activity.image}"
								alt="Card image cap" style="max-height: 205px">
							<div class="card-body">
								<h5 class="card-title">${myworkout.title}</h5>
								<p class="card-text"></p>
								<table>
									<tr>
										<td><strong>Host:</strong> ${myworkout.user.firstName}
											${myworkout.user.lastName}</td>
									</tr>
									<tr>
										<td><strong>Date:</strong> ${myworkout.workoutDate}</td>
									</tr>
									<tr>
										<td><strong>Workout Name:</strong>
											${myworkout.location.name}</td>
									</tr>
									<tr>
										<td><strong>Description:</strong>
											${myworkout.description}</td>
									</tr>
									<tr>
										<td class="text-success"><strong>Completed Workout! (Hosted)</strong>
											</td>
									</tr>
								</table>

							
								<form action="workoutbyid.do">
									<input type='hidden' value=${myworkout.id } name='id' />
									<button type='submit' class="btn btn-primary">Detail</button>
								</form>
								
							</div>
						</div>
					</c:if>
				</c:if>
			</c:forEach>
			</div>
		</c:if>

		<c:if test="${!empty sessionScope.user.guestWorkouts}">
		<div class="card-columns">
			<c:forEach var="myworkout" items="${sessionScope.user.guestWorkouts}">


				<c:if test="${not myworkout.active}">
					<c:if test="${myworkout.title ne 'D0NTEVER$HOW' }">

						<div class="card" style="width: 23rem;">
							<img class="card-img-top" src="${myworkout.activity.image}"
								alt="Card image cap" style="max-height: 205px">
							<div class="card-body">
								<h5 class="card-title">${myworkout.title}</h5>
								<p class="card-text"></p>
								<table>
									<tr>
										<td><strong>Host:</strong> ${myworkout.user.firstName}
											${myworkout.user.lastName}</td>
									<tr>
										<td><strong>Date:</strong> ${myworkout.workoutDate}</td>
									</tr>
									<tr>
										<td><strong>Workout Name:</strong>
											${myworkout.location.name}</td>
									</tr>
									<tr>
										<td><strong>Description:</strong>
											${myworkout.description}</td>
									</tr>
									<tr>
										<td class="text-success"><strong>Completed Workout! (Guest)</strong>
											</td>
									</tr>
								</table>

								<form action="workoutbyid.do">
									<input type='hidden' value=${myworkout.id } name='id' />
									<button type='submit' class="btn btn-primary">Detail</button>
								</form>

							</div>
						</div>
					</c:if>
				</c:if>
			</c:forEach>
			</div>
		</c:if>
	</main>
	<footer> </footer>

</body>
</html>