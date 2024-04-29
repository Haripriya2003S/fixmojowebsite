<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="plumber.aspx.cs" Inherits="fixmojowebsite.plumber" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
             <link href="serve.css" rel="stylesheet" />
 <form id="bookingForm" action="booking.aspx" method="post">
  <div class="wrapper">
	<h1>Shopping Cart</h1>
	<div class="project">
		<div class="shop">
			<div class="box">
				<img src="imgnvid/pldrain.jpeg">
				<div class="content">
					<h3>Drainage Pipe blockage removal</h3>
					<h4>Rs.400</h4>
					<p class="unit">Quantity: <input id="pldrainQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
			</div>
            <div class="box">
				<img src="imgnvid/plflushrep.jpeg">
				<div class="content">
					<h3>Flush repair/installation</h3>
					<h4>Rs.1000</h4>
					<p class="unit">Quantity: <input id="plflushQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
                </div>
                            <div class="box">
				<img src="imgnvid/pltapinst.jpeg">
				<div class="content">
					<h3>Tap/Shower Installation</h3>
					<h4>Rs.650</h4>
					<p class="unit">Quantity: <input id="plshQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
                                </div>
                     <div class="box">
				<img src="imgnvid/paintext.jpeg">
				<div class="content">
					<h3> Wash Basin Installation</h3>
					<h4>Rs.799</h4>
					<p class="unit">Quantity: <input id="plbasinQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
								</div>
</div>
						</div>
			<div id="totalSection" class="right-bar">
				<p><span>Subtotal</span> <span id="subtotal">Rs.120</span></p>
				<hr>
				<p><span>Tax (5%)</span> <span id="tax">Rs.6</span></p>
				<hr>
				<p><span>Shipping</span> <span id="shipping">Rs.15</span></p>
				<hr>
				<p><span>Total</span> <span id="total">Rs.144</span></p><a id="checkoutBtn" href="#" onclick="populateBookingDetails()"><i class="fa fa-shopping-cart"></i>Book Now</a>
			</div>
		</div>
	</div>
      
</form>

<script>
    function populateBookingDetails() {

        var pldrainQuantity = document.getElementById('pldrainQuantity').value;
        var plflushQuantity = document.getElementById('plflushQuantity').value;
        var pldrainName = document.querySelector('.project .shop .box:nth-child(1) .content h3').innerText;
        var plflushName = document.querySelector('.project .shop .box:nth-child(2) .content h3').innerText;
        var plshQuantity = document.getElementById('plshQuantity').value;
        var plbasinQuantity = document.getElementById('plbasinQuantity').value;
        var plshName = document.querySelector('.project .shop .box:nth-child(3) .content h3').innerText;
        var plbasinName = document.querySelector('.project .shop .box:nth-child(4) .content h3').innerText;

        var subtotal = document.getElementById('subtotal').innerText;
        var tax = document.getElementById('tax').innerText;
        var shipping = document.getElementById('shipping').innerText;
        var total = document.getElementById('total').innerText;




        // Create a form element
        var form = document.createElement('form');
        form.method = 'post';  // Set the form method to POST
        form.action = 'bookingplum.aspx';  // Set the form action to booking.aspx

        // Create hidden input fields to hold the data
        if (parseInt(pldrainQuantity) > 0) {
            var pldrainNameInput = document.createElement('input');
            pldrainNameInput.type = 'hidden';
            pldrainNameInput.name = 'pldrainName';
            pldrainNameInput.value = pldrainName;
            form.appendChild(pldrainNameInput);

            var pldrainQuantityInput = document.createElement('input');
            pldrainQuantityInput.type = 'hidden';
            pldrainQuantityInput.name = 'pldrainQuantity';
            pldrainQuantityInput.value = pldrainQuantity;
            form.appendChild(pldrainQuantityInput);
        }

        if (parseInt(plflushQuantity) > 0) {
            var plflushNameInput = document.createElement('input');
            plflushNameInput.type = 'hidden';
            plflushNameInput.name = 'plflushName';
            plflushNameInput.value = plflushName;
            form.appendChild(plflushNameInput);

            var plflushQuantityInput = document.createElement('input');
            plflushQuantityInput.type = 'hidden';
            plflushQuantityInput.name = 'plflushQuantity';
            plflushQuantityInput.value = plflushQuantity;
            form.appendChild(plflushQuantityInput);
        }
        if (parseInt(plshQuantity) > 0) {
            var plshNameInput = document.createElement('input');
            plshNameInput.type = 'hidden';
            plshNameInput.name = 'plshName';
            plshNameInput.value = plshName;
            form.appendChild(plshNameInput);

            var plshQuantityInput = document.createElement('input');
            plshQuantityInput.type = 'hidden';
            plshQuantityInput.name = 'plshQuantity';
            plshQuantityInput.value = plshQuantity;
            form.appendChild(plshQuantityInput);
        }
        if (parseInt(plbasinQuantity) > 0) {
            var plbasinNameInput = document.createElement('input');
            plbasinNameInput.type = 'hidden';
            plbasinNameInput.name = 'plbasinName';
            plbasinNameInput.value = plbasinName;
            form.appendChild(plbasinNameInput);

            var plbasinQuantityInput = document.createElement('input');
            plbasinQuantityInput.type = 'hidden';
            plbasinQuantityInput.name = 'plbasinQuantity';
            plbasinQuantityInput.value = plbasinQuantity;
            form.appendChild(plbasinQuantityInput);
        }


        var subtotalInput = document.createElement('input');
        subtotalInput.type = 'hidden';
        subtotalInput.name = 'subtotal';
        subtotalInput.value = subtotal;
        form.appendChild(subtotalInput);

        var taxInput = document.createElement('input');
        taxInput.type = 'hidden';
        taxInput.name = 'tax';
        taxInput.value = tax;
        form.appendChild(taxInput);

        var shippingInput = document.createElement('input');
        shippingInput.type = 'hidden';
        shippingInput.name = 'shipping';
        shippingInput.value = shipping;
        form.appendChild(shippingInput);

        var totalInput = document.createElement('input');
        totalInput.type = 'hidden';
        totalInput.name = 'total';
        totalInput.value = total;
        form.appendChild(totalInput);


        // Append the form to the document body and submit it
        document.body.appendChild(form);
        form.submit();
    }
    function updateTotal() {
        var pldrainPrice = 2500;
        var plflushPrice = 2700;
        var plshPrice = 2300;
        var plbasinPrice = 3500;

        var pldrainQuantity = parseInt(document.getElementById('pldrainQuantity').value) || 0;
        var plflushQuantity = parseInt(document.getElementById('ligrepQuantity').value) || 0;
        var plshQuantity = parseInt(document.getElementById('plshQuantity').value) || 0;
        var plbasinQuantity = parseInt(document.getElementById('plbasinQuantity').value) || 0;

        var subtotal = pldrainPrice * pldrainQuantity + plflushPrice * plflushQuantity + plshPrice * plshQuantity + plbasinPrice * plbasinQuantity;
        var tax = subtotal * 0.05;
        var total = subtotal + tax + 15; // Assuming a fixed shipping charge of Rs. 15

        document.getElementById('subtotal').innerText = '$' + subtotal;
        document.getElementById('tax').innerText = '$' + tax;
        document.getElementById('total').innerText = '$' + total;
    }

</script>

</asp:Content>
