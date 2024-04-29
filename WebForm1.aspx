<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="fixmojowebsite.WebForm1" %>
<!DOCTYPE html>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<html xmlns="http://www.w3.org/1999/xhtml">
	<link rel="stylesheet" type="text/css" href="payment.css">
<head runat="server">

	  
</head>
	<script type="text/Javascript" language ="javascript" >  
        function alert_meth() {
            alert("Your order has been placed successfully!!");
        }
    </script>
<body bgcolor="black">
    <form id="form1" runat="server">
        <header>
	<div class="container">
		<div class="left">
			<h3>BILLING ADDRESS</h3><br />
			<form>
				Full name<input type="text" name="" placeholder="Enter your name">
			
				Email<asp:TextBox ID="user" runat="server" style="width: 100%;
	padding: 0.5rem 0.7rem;
	margin: 0.5rem 0;
	outline: none;"></asp:TextBox>
				

				Address
				<input type="text" name="" placeholder="Enter your address">
				
				City
				<input type="text" name="" placeholder="Enter your City">
				<div id="zip">
					<label>
						State
						<select>
							<option>Choose State..</option>
							<option>TamilNadu</option>
							<option>Kerala</option>
							<option>Karnataka</option>
							<option>Andhra Pradesh</option>
						</select>
					</label>
						<label>
						Zip code
						<input type="number" name="" placeholder="Zip code">
					</label>
				</div>
			</form>
		</div>
		<div class="right">
			<h3>PAYMENT</h3><br />
			<form>
				Accepted Card <br>

				<img src="imgnvid/card1.png"  width="100"/>
				<img src="imgnvid/card2.png" width="50">
				<br><br>

				Credit card number
				<input type="text" name="" placeholder="Enter your card number">

				Expiry month
				<input type="text" name="" placeholder="Enter Month">
				<div id="zip">
					<label>
						Expiry year<br />
						<select>
							<option>Choose Year..</option>
							<option>2024</option>
							<option>2025</option>
							<option>2026</option>
							<option>2027</option>
							<option>2028</option>
								<option>2029</option>
							<option>2030</option>
						</select>
					</label>
					<label>
						CVV<br />
						<input type="number" name="" placeholder="CVV">
					</label>
				</div>
			</form>
			<asp:Button ID="Button1" runat="server" Text="Confirm order" OnClick="Button1_click" OnClientClick="alert_meth" style="width: 100%;
	padding: 0.7rem 1.5rem;
	background: #34495e;
	color: white;
	border: none;
	outline: none;
	margin-top: 1rem;
	cursor: pointer; "/>
		</div>
	</div>
</header>

    </form>
</body>
</html>
