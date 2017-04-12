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
    <li><a data-toggle="tab" href="#menu1">Storage Settings</a></li>
    <li><a data-toggle="tab" href="#menu2">Instances Specifics</a></li>
    <li><a data-toggle="tab" href="#menu3">Fire MyBBAdmin</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Dashboard graph for the instance metrics comes here</p>
    </div>
    <div id="menu1" class="tab-pane fade">
     
		

<!-- Select Basic -->
<div class="form-group">
<form class="form-horizontal"  method="POST"  role="form" runat="server">
<fieldset>

<!-- Form Name -->
<legend>Storage Settings</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textDeploymentName">Deployment Name</label>  
  <div class="col-md-4">
  <input id="textDeploymentName" name="textDeploymentName" type="text" placeholder="mybbadmin" class="form-control input-md">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="RetreiveDeployment"></label>
  <div class="col-md-4">
    <button id="RetreiveDeployment" name="RetreiveDeployment" class="btn btn-primary">Retreive</button>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="EmailAddress">Email Address</label>  
  <div class="col-md-4">
  <input id="EmailAddress" name="EmailAddress" type="text" placeholder="ajay.solanki@gmail.com" class="form-control input-md">
    
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="InstanceType">Select Instance Type</label>
  <div class="col-md-4">
    <select id="InstanceType" name="InstanceType" class="form-control">
      <option value="t2.nano">t2.nano</option>
      <option value="t2.micro">t2.micro</option>
      <option value="t2.small">t2.small</option>
      <option value="t2.medium">t2.medium</option>
      <option value="t2.large">t2.large</option>
      <option value="m4.large">m4.large</option>
      <option value="m4.xlarge">m4.xlarge</option>
      <option value="m4.2xlarge">m4.2xlarge</option>
      <option value="m4.4xlarge">m4.4xlarge</option>
      <option value="m4.10xlarge">m4.10xlarge</option>
      <option value="m3.medium">m3.medium</option>
      <option value="m3.large">m3.large</option>
      <option value="m3.xlarge">m3.xlarge</option>
      <option value="m3.2xlarge">m3.2xlarge</option>
      <option value="c4.large">c4.large</option>
      <option value="c4.xlarge">c4.xlarge</option>
      <option value="c4.2xlarge">c4.2xlarge</option>
      <option value="c4.4xlarge">c4.4xlarge</option>
      <option value="c4.8xlarge">c4.8xlarge</option>
      <option value="c3.large">c3.large</option>
      <option value="c3.xlarge">c3.xlarge</option>
      <option value="c3.2xlarge">c3.2xlarge</option>
      <option value="c3.4xlarge">c3.4xlarge</option>
      <option value="c3.8xlarge">c3.8xlarge</option>
      <option value="g2.2xlarge">g2.2xlarge</option>
      <option value="g2.8xlarge">g2.8xlarge</option>
      <option value="r3.large">r3.large</option>
      <option value="r3.xlarge">r3.xlarge</option>
      <option value="r3.2xlarge">r3.2xlarge</option>
      <option value="r3.4xlarge">r3.4xlarge</option>
      <option value="r3.8xlarge">r3.8xlarge</option>
      <option value="i2.xlarge">i2.xlarge</option>
      <option value="i2.2xlarge">i2.2xlarge</option>
      <option value="i2.4xlarge">i2.4xlarge</option>
      <option value="i2.8xlarge">i2.8xlarge</option>
      <option value="d2.xlarge">d2.xlarge</option>
      <option value="d2.2xlarge">d2.2xlarge</option>
      <option value="d2.4xlarge">d2.4xlarge</option>
      <option value="d2.8xlarge">d2.8xlarge</option>
    </select>
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
    <select id="DBInstanceType" name="DBInstanceType" class="form-control">
      <option value="db.r3.large">db.r3.large</option>
      <option value="db.r3.xlarge">db.r3.xlarge</option>
      <option value="db.r3.2xlarge">db.r3.2xlarge</option>
      <option value="db.r3.4xlarge">db.r3.4xlarge</option>
      <option value="db.r3.8xlarge">db.r3.8xlarge</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBName">DB Name</label>  
  <div class="col-md-4">
  <input id="DBName" name="DBName" type="text" placeholder="mybbadmin" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBPort">DB Port</label>  
  <div class="col-md-4">
  <input id="DBPort" name="DBPort" type="text" placeholder="3304" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="BillinThreshold">Billing Threshold</label>  
  <div class="col-md-4">
  <input id="BillinThreshold" name="BillinThreshold" type="text" placeholder="40" class="form-control input-md">
  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="SSHKeyName">SSH KeyName</label>  
  <div class="col-md-4">
  <input id="SSHKeyName" name="SSHKeyName" type="text" placeholder="xyz" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBUsername">DB Username</label>  
  <div class="col-md-4">
  <input id="DBUsername" name="DBUsername" type="text" placeholder="mybbadmin" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="DBPassword">DB Password</label>  
  <div class="col-md-4">
  <input id="DBPassword" name="DBPassword" type="text" placeholder="abcd@1234" class="form-control input-md">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Save"></label>
  <div class="col-md-4">
    <button id="Save" name="Save" class="btn btn-primary" runat="server" OnClick="btn_save_Click"  >Save</button>
  </div>
</div>

</fieldset>
</form>

	 
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
</div>

</body>
</html>

