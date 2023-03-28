<%-- 
    Document   : profilePage
    Created on : Mar 24, 2023, 2:44:15 PM
    Author     : LE ANH TUAN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="/includes/header.jsp"%>
    <head>
        <title>Profile</title>
    </head>

    <%@include file="/includes/navbar.jsp"%>

    <!-- Page Header Start -->
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>My Profile</h2>
                </div>
                <div class="col-12">
                    <a href="">Home</a>
                    <a href="">Profile</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1>${account.name}</h1></div>
        </div>
        <div class="row">
            <div class="col-sm-3"><!--left col-->


                <div class="text-center">
                    <img src="${account.avatar}" id="output" class="avatar img-circle img-thumbnail" alt="avatar">
                    <c:if test="${(account.accountId == sessionScope.user.accountId)}">
                        <h6>Upload a different photo... </h6>
                        <br>
                        <label class="button" name="avatar" for="upload">Upload Your Avatar</label>
                    </c:if>


                </div></hr><br>


                <ul class="list-group">
                    <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                    <li class="list-group-item text-left"><span class="pull-left"><strong>Program contributed: </strong></span> ${numberProgramContribute}</li>
                    <li class="list-group-item text-left"><span class="pull-left"><strong>Donate this month: </strong></span> ${totalDonateThisMonth}</li>
                    <li class="list-group-item text-left"><span class="pull-left"><strong>Donate total:</strong></span> ${totalDonate}</li>
                </ul> 



            </div><!--/col-3-->
            <div class="col-sm-9">
                <ul class="nav nav-tabs">
                    <li class=""><a data-toggle="tab" class="active" href="#home">Basic information</a></li>
                        <c:if test="${(account.accountId == sessionScope.user.accountId) || (sessionScope.user.role == 1)}">
                        <li><a data-toggle="tab" href="#messages">Donate history</a></li>
                        </c:if>
                        <c:if test="${(account.accountId == sessionScope.user.accountId)}">
                        <li><a data-toggle="tab" href="#privateInfo">Private infomation</a></li>
                        <li><a data-toggle="tab" href="#passwordChange">Password</a></li>
                        </c:if>

                    <!--<li><a data-toggle="tab" href="#settings">Menu 2</a></li>-->
                </ul>


                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <hr>
                        <form class="form" action="user?action=updateBasicInfo" method="post" id="registrationForm" enctype="multipart/form-data">


                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="name"><h4>Name</h4></label>
                                    <input type="text" class="form-control" name="name" value="${account.name}" id="name" placeholder="Your name" ${((account.accountId != sessionScope.user.accountId) && (sessionScope.user.role != 1)) ? 'disabled' : ''} title="enter your first name if any.">
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="phone"><h4>Phone</h4></label>
                                    <input type="text" class="form-control" name="phoneNumber" value="${account.phoneNumber}" id="phone" placeholder="enter phone" ${((account.accountId != sessionScope.user.accountId) && (sessionScope.user.role != 1)) ? 'disabled' : ''} title="enter your phone number if any.">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="dob"><h4>Date of birth</h4></label>
                                    <input type="date" class="form-control" name="dob" value="${account.dob}" id="dob" title="enter your mobile number if any." ${((account.accountId != sessionScope.user.accountId) && (sessionScope.user.role != 1)) ? 'disabled' : ''}>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="city"><h4>City</h4></label>
                                    <input type="text" class="form-control" name="city" value="${account.city}" id="city" placeholder="Your city" title="enter your City." ${((account.accountId != sessionScope.user.accountId) && (sessionScope.user.role != 1)) ? 'disabled' : ''}>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="province"><h4>Province</h4></label>
                                    <input type="text" class="form-control" id="province" value="${account.province}" name="province" placeholder="Province" title="enter a location" ${((account.accountId != sessionScope.user.accountId) && (sessionScope.user.role != 1)) ? 'disabled' : ''}>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="address"><h4>Address</h4></label>
                                    <input type="text" class="form-control" name="address" value="${account.address}" id="address" placeholder="address" title="enter your address." ${((account.accountId != sessionScope.user.accountId) && (sessionScope.user.role != 1)) ? 'disabled' : ''}>
                                </div>
                            </div>

                            <c:if test="${(account.accountId == sessionScope.user.accountId)}">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <br>
                                        <button class="btn btn-lg" style="background-color: #FDBE33" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>

                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${(account.accountId == sessionScope.user.accountId)}">
                                <input id="upload" name="avatar" type="file" accept="image/*" onchange="loadFile(event)" style="display: none">
                                <input id="accountId" name="accountId" type="hidden" value="${account.accountId}">
                            </c:if>

                        </form>

                        <hr>

                    </div><!--/tab-pane-->
                    <c:if test="${(account.accountId == sessionScope.user.accountId) || (sessionScope.user.role == 1)}">
                        <div class="tab-pane" id="messages">
                            <div class="table-responsive">
                                <table class="table table-hover" id="job-table">
                                    <thead>
                                        <tr class="text-center">
                                            <th scope="col">No.</th>
                                            <th scope="col" colspan="2">Program name</th>
                                            <th scope="col">Amount</th>
                                            <th scope="col-2" colspan="3">At</th>

                                            <th scope="col">Message</th>

                                        </tr>
                                    </thead>

                                    <c:set var = "donateNo" value="${1}" />
                                    <tbody class="text-center tableBody">
                                        <c:forEach var="item" items="${donateHistory}">
                                            <tr key={key}>
                                                <td class="font-weight-bold">${donateNo}</td>
                                                <td class="font-weight-bold" colspan="2"><a href="program?action=detail&programId=${item.program_id}&isClosed=${item.isProgramClosed}">${item.programName}</a></td>
                                                <td>${item.amount} $</td>
                                                <td class="font-weight-bold" colspan="3">${item.donate_date}</td>
                                                <td>${item.message}</td>
                                                <c:set var = "donateNo" value="${donateNo+1}" />
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>


                    <div onsubmit="return submitFormPrivate()" class="tab-pane" id="privateInfo">
                        <hr>
                        <form class="form" action="user?action=requestChangeEmail&userId=${param.userId}" method="post" id="registrationForm">

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="email"><h4>Email</h4></label>
                                    <input type="email" class="form-control" name="email" value="${account.email}"  id="email" placeholder="Your email" ${((account.accountId == sessionScope.user.accountId) || (sessionScope.user.role == 1)) ? '' : 'disabled'} title="enter your last name if any.">
                                </div>
                            </div>


                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="bankAcc"><h4>Bank Account</h4></label>
                                    <input type="text" class="form-control" name="bank_account" value="${account.bank_account}" id="bankAcc" placeholder="Your bank account" title="enter your bank account." ${((account.accountId == sessionScope.user.accountId) || (sessionScope.user.role == 1)) ? '' : 'disabled'}>
                                </div>
                            </div>
                            <c:if test="${(account.accountId == sessionScope.user.accountId) || (sessionScope.user.role == 1)}">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <br>
                                        <button id="privateSubmitBtn" class="btn btn-lg" style="background-color: #FDBE33" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>

                                    </div>
                                </div>
                            </c:if>


                        </form>

                        <hr>
                    </div>

                    <div class="tab-pane" id="passwordChange">
                        <hr>
                        <form onsubmit="return checkPassword()" class="form" action="user?action=changePassword&userId=${param.userId}" method="post" id="registrationForm">

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="email"><h4>Password</h4></label>
                                    <input type="password" id="password" name="password" onkeyup="check();" class="form-control" minlength="6" value="*********" placeholder="Password" required="required" />
                                </div>
                            </div>


                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="bankAcc"><h4>Password Confirm</h4></label>
                                    <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" value="*********" onkeyup="check();" minlength="6"  placeholder="Password confirmation" required="required" />
                                    <span id='message'></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <br>
                                    <button class="btn btn-lg" style="background-color: #FDBE33" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>

                                </div>
                            </div>

                        </form>

                        <hr>
                    </div>

                </div><!--/tab-pane-->
            </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->




    <!-- Footer Start -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="footer-contact">
                        <h2>Our Head Office</h2>
                        <p><i class="fa fa-map-marker-alt"></i>aaa Street, Da Nang, Viet Nam</p>
                        <p><i class="fa fa-phone-alt"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope"></i>FV@gmail.com</p>
                        <div class="footer-social">
                            <a class="btn btn-custom" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-custom" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-custom" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-custom" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-custom" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="footer-link">
                        <h2>Popular Links</h2>
                        <a href="">About Us</a>
                        <a href="">Contact Us</a>
                        <a href="">Popular Causes</a>
                        <a href="">Upcoming Events</a>
                        <a href="">Latest Blog</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="footer-link">
                        <h2>Useful Links</h2>
                        <a href="">Terms of use</a>
                        <a href="">Privacy policy</a>
                        <a href="">Cookies</a>
                        <a href="">Help</a>
                        <a href="">FQAs</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="footer-newsletter">
                        <h2>Newsletter</h2>
                        <form>
                            <input class="form-control" placeholder="Email goes here">
                            <button class="btn btn-custom">Submit</button>
                            <label>Don't worry, we don't spam!</label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container copyright">
            <div class="row">
                <div class="col-md-12">
                    <p>&copy; <a href="#">FantasticV</a>, All Right Reserved.</p>
                </div>
                
            </div>
        </div>
    </div>
    <!-- Footer End -->

    <!-- Back to top button -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

    <!-- Pre Loader -->
    <div id="loader" class="show">
        <div class="loader"></div>
    </div>

    <script>
        var loadFile = function (event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function () {
                URL.revokeObjectURL(output.src) // free memory
            }
        };

        function submitFormPrivate() {
            document.getElementById("privateSubmitBtn").disabled = true;
            document.getElementById("privateSubmitBtn").cursor = "none";
        }
        
        function checkPassword() {
            let password = document.getElementById("password");
            let passwordConfirm = document.getElementById("passwordConfirm");
            
            if(password.value !==passwordConfirm.value) {
                alert("The password confirm is incorrect!!");
                return false;
            } else {
                return true;
            }
        }

        var check = function () {
            console.log(document.getElementById('password').value);

            if (document.getElementById('password').value == document.getElementById('passwordConfirm').value) {
                document.getElementById('message').style.color = 'green';
                document.getElementById('message').innerHTML = 'matching';
            } else {
                document.getElementById('message').style.color = 'red';
                document.getElementById('message').innerHTML = 'not matching';
            }

            if (document.getElementById('password').value == "" || document.getElementById('passwordConfirm').value == "") {
                document.getElementById('message').innerHTML = "";
            }
        }
    </script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/parallax/parallax.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/program.js"></script>
</body>

</html>


