<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="mybbAdminManagementPortal.index"  %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>MybbAdmin Management Portal</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>MyBBAdmin -- Management Portal</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">Deployment Settings</a></li>
    <li><a data-toggle="tab" href="#menu2">Infrastructure Details</a></li>
    <li><a data-toggle="tab" href="#menu3">Fire MyBBAdmin</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Dashboard graph for the instance metrics comes here</p>
    </div>
<div id="menu1" class="tab-pane fade">
     
<div class="form-group">
<form class="form-horizontal"  method="POST"  role="form"  runat="server" >
<fieldset>

<!-- Form Name -->
<legend>Deployment Settings</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textDeploymentName">Deployment Name</label>  
  <div class="col-md-4">
    <asp:TextBox ID="textDeploymentName" runat="server" CssClass="form-control input-md" 
    TabIndex="1" placeholder="mybbadmin"></asp:TextBox>
  
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Retreive"></label>
  <div class="col-md-4">
	<asp:LinkButton ID="RetreiveBtn" 
                runat="server" 
                CssClass="btn btn-primary"    
                OnClick="RetreiveBtn_Click">
		Retreive
</asp:LinkButton>
 </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="EmailAddress">Email Address</label>  
  <div class="col-md-4">
  <asp:TextBox ID="EmailAddress" runat="server" CssClass="form-control input-md" 
    TabIndex="2" placeholder="aaa@gmail.com"></asp:TextBox>

	</asp:TextBox>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="InstanceType">Select Instance Type</label>
  <div class="col-md-4">
	<asp:DropDownList id="InstanceType" name="InstanceType" class="form-control" AutoPostBack="True"
	 runat="server">
      <asp:ListItem selected="True" value="t2.nano">t2.nano</asp:ListItem>
	  <asp:ListItem value="t2.micro">t2.micro</asp:ListItem>
      <asp:ListItem value="t2.small">t2.small</asp:ListItem>
      <asp:ListItem value="t2.medium">t2.medium</asp:ListItem>
      <asp:ListItem value="t2.large">t2.large</asp:ListItem>
      <asp:ListItem value="m4.large">m4.large</asp:ListItem>
      <asp:ListItem value="m4.xlarge">m4.xlarge</asp:ListItem>
      <asp:ListItem value="m4.2xlarge">m4.2xlarge</asp:ListItem>
      <asp:ListItem value="m4.4xlarge">m4.4xlarge</asp:ListItem>
      <asp:ListItem value="m4.10xlarge">m4.10xlarge</asp:ListItem>
      <asp:ListItem value="m3.medium">m3.medium</asp:ListItem>
      <asp:ListItem value="m3.large">m3.large</asp:ListItem>
      <asp:ListItem value="m3.xlarge">m3.xlarge</asp:ListItem>
      <asp:ListItem value="m3.2xlarge">m3.2xlarge</asp:ListItem>
      <asp:ListItem value="c4.large">c4.large</asp:ListItem>
      <asp:ListItem value="c4.xlarge">c4.xlarge</asp:ListItem>
      <asp:ListItem value="c4.2xlarge">c4.2xlarge</asp:ListItem>
      <asp:ListItem value="c4.4xlarge">c4.4xlarge</asp:ListItem>
      <asp:ListItem value="c4.8xlarge">c4.8xlarge</asp:ListItem>
      <asp:ListItem value="c3.large">c3.large</asp:ListItem>
      <asp:ListItem value="c3.xlarge">c3.xlarge</asp:ListItem>
      <asp:ListItem value="c3.2xlarge">c3.2xlarge</asp:ListItem>
      <asp:ListItem value="c3.4xlarge">c3.4xlarge</asp:ListItem>
      <asp:ListItem value="c3.8xlarge">c3.8xlarge</asp:ListItem>
      <asp:ListItem value="g2.2xlarge">g2.2xlarge</asp:ListItem>
      <asp:ListItem value="g2.8xlarge">g2.8xlarge</asp:ListItem>
      <asp:ListItem value="r3.large">r3.large</asp:ListItem>
      <asp:ListItem value="r3.xlarge">r3.xlarge</asp:ListItem>
      <asp:ListItem value="r3.2xlarge">r3.2xlarge</asp:ListItem>
      <asp:ListItem value="r3.4xlarge">r3.4xlarge</asp:ListItem>
      <asp:ListItem value="r3.8xlarge">r3.8xlarge</asp:ListItem>
      <asp:ListItem value="i2.xlarge">i2.xlarge</asp:ListItem>
      <asp:ListItem value="i2.2xlarge">i2.2xlarge</asp:ListItem>
      <asp:ListItem value="i2.4xlarge">i2.4xlarge</asp:ListItem>
      <asp:ListItem value="i2.8xlarge">i2.8xlarge</asp:ListItem>
      <asp:ListItem value="d2.xlarge">d2.xlarge</asp:ListItem>
      <asp:ListItem value="d2.2xlarge">d2.2xlarge</asp:ListItem>
      <asp:ListItem value="d2.4xlarge">d2.4xlarge</asp:ListItem>
      <asp:ListItem value="d2.8xlarge">d2.8xlarge</asp:ListItem>
    </asp:DropDownList>
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="InstanceCount">Instance Count</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="InstanceCount-0">
      <input type="radio" name="InstanceCount" id="InstanceCount-0" value="1" checked="checked">
      1
    </label> 
    <label class="radio-inline" for="InstanceCount-1">
      <input type="radio" name="InstanceCount" id="InstanceCount-1" value="2">
      2
    </label> 
    <label class="radio-inline" for="InstanceCount-2">
      <input type="radio" name="InstanceCount" id="InstanceCount-2" value="3">
      3
    </label> 
    <label class="radio-inline" for="InstanceCount-3">
      <input type="radio" name="InstanceCount" id="InstanceCount-3" value="4">
      4
    </label>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBInstanceType">DB Instance Type</label>
  <div class="col-md-4">
  <asp:DropDownList id="DBInstanceType" name="DBInstanceType" class="form-control" AutoPostBack="True" runat="server">
      <asp:ListItem  selected="True"  value="db.r3.large">db.r3.large</asp:ListItem>
      <asp:ListItem  value="db.r3.xlarge">db.r3.xlarge</asp:ListItem>
      <asp:ListItem  value="db.r3.2xlarge">db.r3.2xlarge</asp:ListItem>
      <asp:ListItem  value="db.r3.4xlarge">db.r3.4xlarge</asp:ListItem>
      <asp:ListItem  value="db.r3.8xlarge">db.r3.8xlarge</asp:ListItem>
    </asp:DropDownList>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBName">DB Name</label>  
  <div class="col-md-4">
   <asp:TextBox ID="DBName" runat="server" CssClass="form-control input-md" 
    Width="250px" TabIndex="4" placeholder="myBBAdmin"></asp:TextBox>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBPort">DB Port</label>  
  <div class="col-md-4">
  <asp:TextBox ID="DBPort" runat="server" CssClass="form-control input-md" 
    Width="250px" TabIndex="5">3304</asp:TextBox>
   
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="BillinThreshold">Billing Threshold</label>  
  <div class="col-md-4">
   <asp:TextBox ID="BillinThreshold" runat="server" CssClass="form-control input-md" 
    Width="250px" TabIndex="6" placeholder="40" ></asp:TextBox>
   
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="SSHKeyName">SSH KeyName</label>  
  <div class="col-md-4">
  <asp:TextBox ID="SSHKeyName" runat="server" CssClass="form-control input-md" 
    Width="250px" TabIndex="7" placeholder="xyz" ></asp:TextBox>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBUsername">DB Username</label>  
  <div class="col-md-4">
  <asp:TextBox ID="DBUsername" runat="server" CssClass="form-control input-md" 
    Width="250px" TabIndex="7" placeholder="mybbadmin" ></asp:TextBox>
 
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBPassword">DB Password</label>  
  <div class="col-md-4">
    <asp:TextBox ID="DBPassword" runat="server" CssClass="form-control input-md" 
    Width="250px" TabIndex="8" placeholder="abcd@1234" ></asp:TextBox>

    
  </div>
</div>


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Save"></label>
  <div class="col-md-4">
	<asp:LinkButton ID="SubmitBtn" 
                runat="server" 
                CssClass="btn btn-primary"    
                OnClick="SubmitBtn_Click">
    <span aria-hidden="true" class="glyphicon glyphicon-ok"></span>Submit
</asp:LinkButton>


  </div>
</div>

</fieldset>
</form>

	 
    </div>
  </div>
    <div id="menu2" class="tab-pane fade">
      <h3>myBBAdmin Infrastructure Details</h3>
	  <div class="container-fluid">
		<div id="dvTable">
		</div>
       <script src="/Scripts/jquery-1.9.1.min.js"
        type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () 
			{	
				var Resources = [[]];
				Resources.push("ResourceType","Name","Id","Status");
				
                 $.getJSON("/api/awsinstance",
                function (Data) {
 
                    $.each(Data, function (key, val)
					{
					Resources.push("Instance",val.Id, val.Type, val.Status);
					});
                });
				
				$.getJSON("/api/AWSDBInstance",
                function (Data) {
 
                    $.each(Data, function (key, val)
					{
					Resources.push("Database",val.DBName, val.Endpoint, val.StatusInfos);
                    });
					show(Resources);
                });
            });
 
            function show(Resources) {
				//Create a HTML Table element.
				var table = document.createElement("TABLE");
				table.class  = "table-striped";
				table.border = "1";
			 
				//Get the count of columns.
				var columnCount = 4;
			 
				//Add the header row.
				var row = table.insertRow(-1);
				for (var i = 1; i <= columnCount; i++) {
					var headerCell = document.createElement("TH");
					headerCell.innerHTML = Resources[i];
					row.appendChild(headerCell);
				}
				 //Add the data rows.
				 
				for (var i = columnCount; i < Resources.length-1; i++) {
					row = table.insertRow(-1);
					for (var j = 1; j <= columnCount; j++) {
						var cell = row.insertCell(-1);
						cell.innerHTML = Resources[i + j]
					}
					i = i + columnCount-1;
				}
				var dvTable = document.getElementById("dvTable");
				dvTable.innerHTML = "";
				dvTable.appendChild(table);
            }

			
        </script>
		</div>
    </div>
    <div id="menu3" class="tab-pane fade">
	<!--form  method="post"> -->`
	<p> Based on the database setting the mybbadmin cloudformation script will be executed.
	</p>
	<br> <br> <br>
	<div>
     <div class="container">
	<div class="span10"><button class="btn">Fire MyBBAdmin Stack</button></div>
	<div class="span4 pull-right">
    <div class="alert alert-danger fade">
      <button type="button" class="close" data-dismiss="alert">×</button>
      <strong>Alert!</strong> Fired cloudformation template
    </div>
  </div>
</div>
	<!--</form>-->
    </div>
  </div>
</div>
<script>
$(".btn").on("click", function() {
	$.getJSON("http://localhost:54368/api/awsinstance",
                function (Data) {
 
                    $.each(Data, function (key, val)
					{
						$(".alert").removeClass("in").show(val.stackId);
						$(".alert").delay(200).addClass("in").fadeOut(2000);
					});
                });
   
});

function activaTab(tab){
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
};
</script>
</body>
</html>

