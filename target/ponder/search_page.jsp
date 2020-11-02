<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="wlcmcss.css">
   <!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<!-- jQuery and JS bundle w/ Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<title>Search-Ponder</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	int timeout = session.getMaxInactiveInterval();
	response.setHeader("Refresh", timeout + "; URL = expire.jsp");
%>

</head>
<body>

	<%
	if((String) request.getSession().getAttribute("username")==null)
	{
		response.sendRedirect("login.jsp");
	}
	%>
	
	<%
	 	String searchthis = (String) request.getParameter("topicsrc");
	   	session = request.getSession();
	    session.setAttribute("srchthis", searchthis);
	%>


	    <header class="nav">
        <div class=" container menu">  
            <h1 class="logo"> 
                <svg width="1em" height="2em" viewBox="0 0 16 16" class="bi bi-chat-quote" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                    <path d="M7.468 7.667c0 .92-.776 1.666-1.734 1.666S4 8.587 4 7.667C4 6.747 4.776 6 5.734 6s1.734.746 1.734 1.667z"/>
                    <path fill-rule="evenodd" d="M6.157 6.936a.438.438 0 0 1-.56.293.413.413 0 0 1-.274-.527c.08-.23.23-.44.477-.546a.891.891 0 0 1 .698.014c.387.16.72.545.923.997.428.948.393 2.377-.942 3.706a.446.446 0 0 1-.612.01.405.405 0 0 1-.011-.59c1.093-1.087 1.058-2.158.77-2.794-.152-.336-.354-.514-.47-.563zm-.035-.012h-.001.001z"/>
                    <path d="M11.803 7.667c0 .92-.776 1.666-1.734 1.666-.957 0-1.734-.746-1.734-1.666 0-.92.777-1.667 1.734-1.667.958 0 1.734.746 1.734 1.667z"/>
                    <path fill-rule="evenodd" d="M10.492 6.936a.438.438 0 0 1-.56.293.413.413 0 0 1-.274-.527c.08-.23.23-.44.477-.546a.891.891 0 0 1 .698.014c.387.16.72.545.924.997.428.948.392 2.377-.942 3.706a.446.446 0 0 1-.613.01.405.405 0 0 1-.011-.59c1.093-1.087 1.058-2.158.77-2.794-.152-.336-.354-.514-.469-.563zm-.034-.012h-.002.002z"/>
                </svg>
                Ponder
            </h1>
            
<!--             Search -->
				
              <!-- Menu -->
             <div class="dropdown">
                <button onclick="myFunction()" class="dropbtn">
                  <!-- icon -->
                  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-menu-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M15 13V4a1 1 0 0 0-1-1h-3.586A2 2 0 0 1 9 2.414l-1-1-1 1A2 2 0 0 1 5.586 3H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM2 2a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2h-3.586a1 1 0 0 1-.707-.293L8.354.354a.5.5 0 0 0-.708 0L6.293 1.707A1 1 0 0 1 5.586 2H2z"/>
                    <path fill-rule="evenodd" d="M15 11H1v-1h14v1zm0-4H1V6h14v1zM2 12.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5z"/>
                  </svg> 
                  Menu
                </button>
                <div id="myDropdown" class="dropdown-content">
                  <a href="welcome.jsp">Home</a>
                  <a href="about.jsp">About</a>
                  <a href="My Posts.jsp">My Profile</a>
                  <form action="Logout" method="get">
					<input type="submit" value="Logout" class="butn lgt">
				  </form> 
                </div>
              </div>
          

        </div>
    </header>
      
<div class="content">
	<form action="search_page.jsp" method="get" class="container cards">
		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
</svg>
	
         <input class="form-control post-topic src" name="topicsrc" type="text" placeholder="Search Topic" required>
         <input type="submit" value="Search" class="butn">
    </form>

    <div class="container flex cards">
        <div class="forpost flex">
            <h2>Search Results...</h2>
        </div>
    </div>

    <div class="container cards">
        <div class="postholder">
          <b>@imshivam</b> is pondering over<span class="topichighlight"> Endgame</span>
        </div>
        <div class="card-body">
          <!-- <h5 class="card-title">Special title treatment</h5>  -->
          <!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
          <h5>Destiny Still Arrives!!</h5>
        </div>
        <div class="postholder">
          2 days ago
        </div>
      </div>
</div>
	
	
	
<!-- 	<form action="Post" method="post"> -->
<!-- 	<input type="text" name="topic" placeholder="Topic" required> -->
<!-- 	<textarea name="posthis" rows="4" cols="14" style="width:100% ;overflow: hidden ;resize:none" placeholder="here"></textarea> -->
<!-- 	<input type="submit" value="Post"> -->
<!-- 	</form> -->
	
<!-- <div class="col-md-8"> -->
<!-- 	<div class=" container text-center" id="loader"> -->
<!-- 		  <div class="spinner-border" role="status"> -->
<!-- 		    <span class="sr-only">Loading...</span> -->
<!-- 		  </div> -->
<!-- 	   <h3 class="mt-2">Loading...</h3> -->
<!-- 	</div> -->
<!-- </div> -->

<div class="container-fluid" id="post-container">
</div>
	
	
	<!-- JavaScript -->
	<!-- Laoing posts -->
	<script>
 		$(document).ready(function (e){
			$.ajax({
				url: "search_data.jsp",
				success: function(data, textstatus, jqXHR){
					console.log(data);
					$("#loader").hide();
					$('#post-container').html(data);
				}
			})
 		})
	</script>
	
	<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
	
</body>
</html>