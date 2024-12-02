

<!--Navigation bar start-->
<nav class="navbar fixed-top navbar-expand-sm navbar-dark" style="background-color:rgba(0,0,0,0.5)">
            <div class="container">
                    <a href="index.php" class="navbar-brand" style="font-family: 'Delius Swash Caps'">Planet Shopify</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                <div class="collapse navbar-collapse" id="mynavbar">
                    <ul class="nav navbar-nav">
                       <li class="nav-item dropdown">
                           <a href="" class="nav-link dropdown-toggle" id="navbar-drop" data-toggle="dropdown">
                               Products
                            </a>
                               <div class="dropdown-menu">
                                   <a href="products.php#watch" class="dropdown-item">Watches</a>
                                   <a href="products.php#shirt" class="dropdown-item">T-Shirts</a>
                                   <a href="products.php#shoes" class="dropdown-item">Shoes</a>
                                   <a href="products.php#headphones" class="dropdown-item">Headphones/Speakers</a>
                               </div>
                           
                       </li>
                       <li class="nav-item"><a href="index.php" class="nav-link">Offers</a></li>
                       <li class="nav-item"><a href="about.php" class="nav-link">About Us</a></li>
                       <?php
                       if (isset($_SESSION['email'])) {
                        ?>
                       <li class="nav-item"><a href="cart.php" class="nav-link">Cart</a></li>
                       <?php
                          } 
                    ?>
                    </ul>
                    
                    <?php
                if (isset($_SESSION['email'])) {
                    ?>
                    <ul class="nav navbar-nav ml-auto">
                       <li class="nav-item"><a href="logout_script.php" class="nav-link"><i class="fa fa-sign-out"></i>Logout</a></li>
                       <li class="nav-item"><a  class="nav-link " data-placement="bottom" data-toggle="popover" data-trigger="hover" data-content="<?php echo $_SESSION['email'] ?>"><i class="fa fa-user-circle "></i></a></li>
                    </ul>
                    <?php
                } else {
                    ?>
                    <ul class="nav navbar-nav ml-auto">
                       <li class="nav-item "><a href="#signup" class="nav-link"data-toggle="modal" ><i class="fa fa-user"></i> sign In</a></li>
                       <li class="nav-item "><a href="#login" class="nav-link" data-toggle="modal"><i class="fa fa-sign-in"></i> Login</a></li>
                    </ul>
                    <?php 
                }
                    ?>
                    </div>
                </div>
            </div>
        </nav>
        
    <div class="modal fade" id="login" >
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content"style="background-color:rgba(255,255,255,0.95)">

            <div class="modal-header">
              <h5 class="modal-title">Login</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>

            <div class="modal-body">
              <form action="login_script.php" method="post">
                 <div class="form-group">
                     <label for="email">Email address:</label>
                     <input type="email" class="form-control"  name="lemail" placeholder="Enter email" required>
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd"  name="lpassword" placeholder="Password" required>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input">
                    <label for="checkbox" class="form-check-label">Check me out</label>
                </div>
                <button type="submit" class="btn btn-secondary btn-block" name="Submit">Login</button>
              </form>
              <a href="http://">forgot password ?</a>
            </div>
            <div class="modal-footer">
              <p class="mr-auto">New User? <a href="#signup" data-toggle="modal" data-dismiss="modal" >signup</a></p>
              <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
            </div>
          </div>
        </div>
      </div>
    <!--Login trigger Model ends-->
    <!--Signup model start-->
    <div class="modal fade" id="signup">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content" style="background-color:rgba(255,255,255,0.95)">

            <div class="modal-header">
              <h5 class="modal-title">Sign Up</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>

            <div class="modal-body">
              <form action="signup_script.php" method="post">
                <div class="form-group">
                  <label for="email">Email address:</label>
                <input type="email" class="form-control" name="eMail" placeholder="Enter email" required>
        <?php if(isset($_GET['error'])) { echo "<span class='text-danger'>".$_GET['error']."</span>"; } ?>
    </div>
    
    <div class="form-group">
        <label for="pwd">Password:</label>
        <input type="password" class="form-control" id="pwd" name="password" placeholder="Password" required>
    </div>
    
    <div class="form-group">
        <label for="confirm_pwd">Confirm Password:</label>
        <input type="password" class="form-control" id="confirm_pwd" name="confirm_password" placeholder="Confirm Password" required>
    </div>
    
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="validation1">First Name</label>
            <input type="text" class="form-control" id="validation1" name="firstName" placeholder="First Name" required>
        </div>
        <div class="form-group col-md-6">
            <label for="validation2">Last Name</label>
            <input type="text" class="form-control" id="validation2" name="lastName" placeholder="Last Name" required>
        </div>
    </div>
    
    <div class="form-group">
        <label for="dob">Date of Birth:</label>
        <input type="date" class="form-control" id="dob" name="dateOfBirth" required>
    </div>
    
    <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number" required>
    </div>
    <div class="form-group">
      <label for="city">City:</label>
      <select name="city" id="city" required>
        <option value="Dhaka">Dhaka</option>
        <option value="Khulna">Khulna</option>
        <option value="Mymensingh">Mymensingh</option>
        <option value="Rajshahi">Rajshahi</option>
        <option value="Rangpur">Rangpur</option>
        <option value="Sylhet">Sylhet</option>
        <option value="Barishal">Barishal</option>
        <option value="Chattogram">Chattogram</option>
      </select>
    </div>
    <div class="form-check">
        <input type="checkbox" class="form-check-input" id="terms" required>
        <label for="terms" class="form-check-label">Agree to terms and conditions</label>
    </div>
    <button type="submit" class="btn btn-primary btn-block" name="Submit">Sign Up</button>
</form>

            </div>
            <div class="modal-footer">
              <p class="mr-auto">Already Registered?<a href="#login"  data-toggle="modal" data-dismiss="modal">Login</a></p>
              <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
            </div>
          </div>
        </div>
      </div>
      <!--Signup trigger model ends-->