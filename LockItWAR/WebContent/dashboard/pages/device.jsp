<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.lockit.entity.HouseOwner,com.lockit.entity.LockEye,com.lockit.entity.LockSense,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Home | LOCKIT</title>

      <!-- Bootstrap Core CSS -->
        <link href="dashboard/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="dashboard/css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="dashboard/css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="dashboard/css/startmin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="dashboard/css/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="dashboard/css/font-awesome.min.css" rel="stylesheet" type="text/css">


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="homepage.jsp">LockIT!</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="index.jsp"><i class="fa fa-home fa-fw"></i> Go Website</a></li>
                </ul>

				
                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown navbar-inverse">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-comment fa-fw"></i> New Comment
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-tasks fa-fw"></i> New Task
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <% if(session.getAttribute("userName") != null) {HouseOwner user = (HouseOwner) session.getAttribute("userName"); out.print(user.getUserName());} %> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="logoutController"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                             <img src="../../images/favicon.ico" alt="">                       
                            </li>
                            <li>
                                <a href="dashboardController" ><i class="fa fa-dashboard fa-fw"></i> MyDashboard</a>
                            </li>
							<li>
                                <a href="registerController" ><i class="fa fa-edit fa-fw"></i> Register Device</a>
                            </li>
							<li>
                                <a href="DeviceStatusController" class="active"><i class="fa fa-bar-chart-o fa-fw"></i> Device Status</a>
                            </li>
                            <li>
                                <a href="CCTVController"><i class="fa fa-eye fa-fw"></i> CCTV Status</a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </nav>

			<!---------------------------navbar on lefttt------------------------------>
			
			
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Device Status</h1>
						<div class="row">
							
							<%
							for(LockSense lockSense : (List<LockSense>) request.getAttribute("normalLockSense")){
							%>
								<div class="col-lg-3 col-md-6">
									<div class="panel panel-green">
										<div class="panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-tasks fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div class="huge">LS<%out.print(lockSense.getLocksenseID()); %></div>
													<div>LOCK SENSE</div>
												</div>
											</div>
										</div>
										<a href="#">
											<div class="panel-footer">
												<form action="ActivityLogController" method="POST">
													<input name="id" value="<%out.print(lockSense.getLocksenseID()); %>" type="hidden">
													<input type="submit" class="pull-left" name="submit" value="View Details"></input>
												</form>
												<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	
												<div class="clearfix"></div>
											</div>
										</a>
									</div>
								</div>
							<%
							}
							
							%>
							
							
							<%
							for(LockSense lockSense : (List<LockSense>) request.getAttribute("dangerLockSense")){
							%>
							<div class="col-lg-3 col-md-6">
								<div class="panel panel-red">
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-3">
												<i class="fa fa-video-camera fa-5x"></i>
											</div>
											<div class="col-xs-9 text-right">
												<div class="huge">LS<%out.print(lockSense.getLocksenseID()); %></div>
												<div>LOCK SENSE</div>
											</div>
										</div>
									</div>
									<a href="#">
										<div class="panel-footer">
											<form action="ActivityLogController" method="POST">
													<input name="id" value="<%out.print(lockSense.getLocksenseID()); %>" type="hidden">
													<input type="submit" class="pull-left" name="submit" value="View Details"></input>
											</form>
											<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

											<div class="clearfix"></div>
										</div>
									</a>
								</div>
							</div>
							<%
							}
							
							%>
							
							
							<%
							for(LockEye lockEye : (List<LockEye>) request.getAttribute("normalLockEye")){
							%>
								<div class="col-lg-3 col-md-6">
									<div class="panel panel-green">
										<div class="panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-tasks fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div class="huge">LE<%out.print(lockEye.getLockEyeID()); %></div>
													<div>LOCK EYE</div>
												</div>
											</div>
										</div>
										<a href="#">
											<div class="panel-footer">
												<form action="LockEyeDetailsController" method="POST">
													<input name="id" value="<%out.print(lockEye.getLockEyeID()); %>" type="hidden">
													<input type="submit" class="pull-left" name="submit" value="View Details"></input>
												</form>
												<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	
												<div class="clearfix"></div>
											</div>
										</a>
									</div>
								</div>
							<%
							}
							
							%>
							
							
							<%
							for(LockEye lockEye : (List<LockEye>) request.getAttribute("dangerLockEye")){
							%>
							<div class="col-lg-3 col-md-6">
								<div class="panel panel-red">
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-3">
												<i class="fa fa-video-camera fa-5x"></i>
											</div>
											<div class="col-xs-9 text-right">
												<div class="huge">LE<%out.print(lockEye.getLockEyeID()); %></div>
												<div>LOCK EYE</div>
											</div>
										</div>
									</div>
									<a href="#">
										<div class="panel-footer">
											<form action="LockEyeDetailsController" method="POST">
													<input name="id" value="<%out.print(lockEye.getLockEyeID()); %>" type="hidden">
													<input type="submit" class="pull-left" name="submit" value="View Details"></input>
												</form>
											<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

											<div class="clearfix"></div>
										</div>
									</a>
								</div>
							</div>
							<%
							}
							
							%>
							
						</div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row ---------------4 gui dashboard---------->
                
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="dashboard/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="dashboard/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="dashboard/js/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="dashboard/js/raphael.min.js"></script>
        <script src="dashboard/js/morris.min.js"></script>
        <script src="dashboard/js/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="dashboard/js/startmin.js"></script>

    </body>
</html>
