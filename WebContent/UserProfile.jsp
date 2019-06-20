<%@ page import="com.mysql.cj.Session"%>
<%@ 
	page
	import="
		com.rent.car.controller.UserController, 
		com.rent.car.controller.BookingController, 
		com.rent.car.controller.UserLogController,
		com.rent.car.controller.CarController,
		javax.servlet.http.HttpSession
	"%>

<!DOCTYPE html>
<html>
   <head>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!-- Compiled and minified CSS -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
      <title>RentoCar: Rent a car</title>
      <style media="screen">
         .card-style{
         	height: 56.25%;
         	width: 99.5%;
         }
      </style>

   </head>
   <body class="indigo lighten-5">
      <!-- Navigation -->
      
      <%
		String id = (String) request.getSession().getAttribute("session_id");
		String carId = (String) request.getParameter("carid");
		UserController user = (UserController) request.getSession().getAttribute("user_controller");

		if (id != null && !user.getFirstName(id).equals("")) {

			// Getting the necessary objects from session
			UserLogController userLog = (UserLogController) request.getSession().getAttribute("user_log_controller");
			BookingController booking = (BookingController) request.getSession().getAttribute("booking_controller");
			CarController car = (CarController) request.getSession().getAttribute("car_controller");

			// Getting user information
			String userFirstName = user.getFirstName(id);
			String userLastName=user.getLastName(id);
			String userEmail = user.getEmail(id);
			String userMobile=user.getMobileNumber(id);
			String userWallet=user.getWallet(id);
			String userName=user.getUsername(id);
	%>
      
      
      
      
      <div class="navbar-fixed">
         <nav class="nav-wrapper indigo darken-3">
            <div class="container">
               <a class="sidenav-trigger" href="#" data-target="menu-link">
               <i class="material-icons">menu</i>
               </a>
               <div class="brand-logo">
                  <a href="#">
                  RentoCar
                  </a>
               </div>
               <ul class="right hide-on-med-and-down">
                  <li>
                     <a href="#logout" class="waves-effect waves-dark modal-trigger">Logout</a>
                  </li>

               </ul>
            </div>
         </nav>
      </div>
      <!-- Side Navigation for mobile devices -->
      <ul class="sidenav" id="menu-link">
         <li>
            <a href="#logout" class="waves-effect waves-dark modal-trigger">Logout</a>
         </li>

      </ul><!---Side navigation ends here---->
      <div class="row">

        <div class="col s12 m6">

             <div class="card">
              <span class="card-title">My Account</span>
              <div class="row">

                <div class="col s6 m6 l6">
              <img src="images/profile.jpg">
              </div>
              <div class="col s6 m6 l6">
                <h5><%=userFirstName%> <%=userLastName%></h5>
                <p>Mobile No:   <span><%=userMobile %></span></p>
                <p class="usernameuser">Username:   <span><%=userName%></span></p>
                <p>Email Id :   <span><%=userEmail %></span></p>
                <p>UID Number:  <span><%=id %></span></p>
                <p>Wallet Amount:  <span><%=userWallet %></span></p>
                

              </div>
              </div>
             </div>
             <div class="card"><!--change user name and password -->
              <span class="card-title brown-text">Customize Credentials</span>
                
                <div class="row">
                <div class="col s8 l10">
                <div class="input-field">
                  <i class="material-icons indigo-text prefix">contacts</i>
                   <input   type="text" name="changeprofilename" class="updatedusername">
                   <label for="changeprofilename">Change User Name</label>
                   
                 </div>
                </div>
                <div class="col s4 m6 l2">
                 <a class="waves-effect waves-light btn indigo changeusername"   style="margin-top:10%;">Change</a>
                </div>
                </div>
                
                 <div class="row">
                <div class="col s8 m6 l10">
                <div class="input-field">
                  <i class="material-icons indigo-text prefix">security</i>
                   <input   type="text" name="ChangeUserPassword">
                   <label for="ChangeUserName">Change Password</label>
                   
                 </div>
                </div>
                <div class="col s4 l2">
                 <a class="waves-effect waves-light btn indigo " id="changepassword" style="margin-top:10%;">Change</a>
                </div>
                </div>
                
<div class="status" style="color:green;"></div>                
                
                
                
                
                
                
                
  
              
              <br>

                

             </div>




        </div>

        <div class="col s12 m6">
          <div class="card">
            <div class="card-content">

              <span class="card-title">Update Account Details</span>
              <form id="updateform" action="" method="post">
              <div class="row">
                <div class="input-field">
                 <i class="material-icons indigo-text prefix">contact_mail</i>
                   <input  id="email" type="text" name="">
                   <label for="updateEmail">Update Email</label>
                 </div>
              </div>
              <div class="row">
                <div class="input-field">
                 <i class="material-icons indigo-text prefix">call</i>
                   <input  id="updateMobile" type="text" name="">
                   <label for="updateMobile">Update Telephone</label>
                 </div>
              </div>
              <div class="row">
                <div class="input-field">
                 <i class="material-icons indigo-text prefix">create</i>
                   <input  id="" type="text" name="">
                   <label for="changeUidno">Change Uid No</label>
                 </div>
              </div>
              <div class="row">
                  <div class="input-field col s4">
                     <select class="input-field" name="idtype">
                        <option value="" selected disabled>Verify with</option>
                        <option value="aadhar">Aadhar</option>
                        <option value="pan">PAN</option>
                        <option value="passport">Passport</option>
                     </select>
                  </div>
                  <div class="input-field col s8">
                     <input type="text" name="verification_id" id="verification_id" class="validate">
                     <label for="verification_id">UID number</label>
                  </div>
               </div>
              <div class="row">
               <center> <a class="waves-effect waves-light btn indigo ">Submit</a></center>
              </div>
            </form>
             </div>
              <div class="card-action">
            <div class="btn indigo lighten-5 ">

                 <i class="material-icons red-text prefix">delete</i>
                <a href="#" class="right black-text">Delete Account</a>

              </div>
           </div>
           </div>

         </div>
        </div>

      <footer>
         <div class="footer-copyright indigo lighten-4" style="padding-top: 20px; padding-bottom: 1px;">
            <div class="container">
               <div class="row">
                  <div class="col">
                     &copy RentoCar 2018-2019
                  </div>
                  <div class="col right">
                     <a href="#!" class="">Contact Us</a>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- JQuery -->
      <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      <!-- Compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


      <!-- Initializing all the materialize elements -->
      <script type="text/javascript">
         $(document).ready(
         	()=>	{
         		// Sidenav initialization
            				$('.sidenav').sidenav();
         		// Slider initialization and params setting
         		$('.slider').slider(
         			{
         				indicators: false,
         				height: 450,
         				interval: 3000
         			
         			});
         		// Modal initialization
         		$('.modal').modal();
         		// Form initialization
         		$('select').formSelect();
         		// $('.datepicker').datepicker();
         		// $('.timepicker').timepicker();
          			
         	
         	
         	
//Update User Credentials

        		
        	                 	    
        		 $(".changeusername").on("click", function(e) {
        			    e.preventDefault();
        			    $.ajax({type: "POST",
        			        url: "updateuserprofile",
        			        
        			        data: { "username":$('.updatedusername').val() },
        			        success:function(result) {
        			         $(".status")[0].innerHTML="status changed!";
        			        $(".usernameuser")[0].innerHTML="Username:"+$('.updatedusername').val();
        			         M.toast({html: 'Username Changed!'});
        			        },
        			        error:function(result){
        			        
        			        	
        			        }
        			       
        			    });
        			});
        		
       		 
       		
         	
         	
         	
         	}
         );
      </script>
	  <script type="text/javascript">
     
    </script>
    <%
		} else {
			response.sendRedirect("Index.jsp");
		}
	%>
   </body>
</html>