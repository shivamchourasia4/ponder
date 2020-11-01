<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="homecss.css">
    <title>Sign up-Ponder</title>
</head>
<body>
    <div class="container">
        <div class="cover grid">
            <div class="info">
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
                        <p>Hey there! We are happy to see you joining the Ponder family. Fill up some details quickly and carefully.</p>
            </div>
                <div class="card">
                   
                      
                    <h2>Sign up</h2>
                    
                    <!-- 	Error i/o handling -->
					<c:if test="${not empty check}">
					         <div class="alert alert-warning">
					  			<strong>Watch Out..! </strong>    ${check}
							 </div>
					
					</c:if> 
                    
                    <form class="card-form" action="Register" method="post">
                        <input name="firstname" type="text" class="form-control" placeholder="First Name" required autofocus>
                        <input name="lastname" type="text"  class="form-control" placeholder="Last Name" required autofocus>
                        <input name="username" type="text"  class="form-control" placeholder="Username (*must be unique)" required autofocus>
                        <input name="emailaddress" type="text" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                        <input name="passkey" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                        <input name="confirmedpswd" type="password" id="inputPassword" class="form-control" placeholder="Confirm Password" required>
                        <br>
                        <input type="submit" value="Sign up" class="btn btn-primary signin-btn">
                    </form>
                    <hr style="width: 50%;">
  <p class="mt-3 mb-3 text-muted">&copy; 2020</p>
                </div>
         </div>
</div>
    
<footer class="footer">
    <div class="details">
        <h1>Ponder</h1>
        <p>Copyright &copy; 2020</p>
    </div>
</footer>
</body>
</html>