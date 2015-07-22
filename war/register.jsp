<%@include file="header.jsp"%>
    
	<div id="site_content">	

      <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="900" height="250" src="images/home_1.jpg" alt="&quot;Enter your caption here&quot;" /></li>
          <li><img width="900" height="250" src="images/home_2.jpg" alt="&quot;Enter your caption here&quot;" /></li>
        </ul> 
	  </div>	
	
	  <div id="content">
        <div class="content_item">
		  <h1>Welcome To RaddaTech e-Banking System<br>
		  </h1>
		  <form name="form1" method="post" action="">
		    <table width="361" border="0" align="center" cellpadding="1" cellspacing="0">
		      <tr>
		        <td width="159">Account No:</td>
		        <td width="198"><label for="accountno"></label>
	            <input type="text" name="accountno" id="accountno" value="<%= (10000+count("Users")+1) %>"></td>
	          </tr>
		      <tr>
		        <td>Password:</td>
		        <td><label for="password"></label>
	            <input type="password" name="password" id="password"></td>
	          </tr>
		      <tr>
		        <td>Fullname</td>
		        <td><label for="fullname"></label>
	            <input type="text" name="fullname" id="fullname"></td>
	          </tr>
		      <tr>
		        <td>Mobile No</td>
		        <td><label for="mobileno"></label>
	            <input type="text" name="mobileno" id="mobileno">		          <label for="gender"></label></td>
	          </tr>
		      <tr>
		        <td>Gender:</td>
		        <td><select name="gender" id="gender">
		          <option value="Male" selected>Male</option>
		          <option value="Female">Female</option>
	            </select></td>
	          </tr>
		      <tr>
		        <td>&nbsp;</td>
		        <td><input type="submit" name="register" id="register" value="Register"></td>
	          </tr>
	        </table>
	      </form>
		  <h1>&nbsp; </h1>
          <p>&nbsp;</p><!--close content_imagetext--><!--close content_container--><!--close content_container--><!--close content_container-->	
		  
		</div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content-->  	
  </div><!--close main-->
  
    <footer>
	  
	  System Design & Developed By Radda Tech
    </footer>

  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
