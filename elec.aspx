<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="elec.aspx.cs" Inherits="fixmojowebsite.elec" %>
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
				<img src="imgnvid/elebulbins.jpeg">
				<div class="content">
					<h3>Ceiling Light Installation</h3>
					<h4>Rs.230</h4>
					<p class="unit">Quantity: <input id="liginQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
			</div>
            <div class="box">
				<img src="imgnvid/elebulbrep.jpg">
				<div class="content">
					<h3>Ceiling Light Repair</h3>
					<h4>Rs.200</h4>
					<p class="unit">Quantity: <input id="ligrepQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
                </div>
                            <div class="box">
				<img src="imgnvid/elefanins.jpeg">
				<div class="content">
					<h3>Fan Installation</h3>
					<h4>Rs.239</h4>
					<p class="unit">Quantity: <input id="faninQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
                                </div>
                     <div class="box">
				<img src="imgnvid/elefanrep.jpg">
				<div class="content">
					<h3> Fan Repair</h3>
					<h4>Rs.199</h4>
					<p class="unit">Quantity: <input id="fanrepQuantity" name="" value="" onchange="updateTotal()"></p>
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

        var liginQuantity = document.getElementById('liginQuantity').value;
        var ligrepQuantity = document.getElementById('ligrepQuantity').value;
        var liginName = document.querySelector('.project .shop .box:nth-child(1) .content h3').innerText;
        var ligrepName = document.querySelector('.project .shop .box:nth-child(2) .content h3').innerText;
        var faninQuantity = document.getElementById('faninQuantity').value;
        var fanrepQuantity = document.getElementById('fanrepQuantity').value;
        var faninName = document.querySelector('.project .shop .box:nth-child(3) .content h3').innerText;
        var fanrepName = document.querySelector('.project .shop .box:nth-child(4) .content h3').innerText;

        var subtotal = document.getElementById('subtotal').innerText;
        var tax = document.getElementById('tax').innerText;
        var shipping = document.getElementById('shipping').innerText;
        var total = document.getElementById('total').innerText;




        // Create a form element
        var form = document.createElement('form');
        form.method = 'post';  // Set the form method to POST
        form.action = 'bookingelec.aspx';  // Set the form action to booking.aspx

        // Create hidden input fields to hold the data
        if (parseInt(liginQuantity) > 0) {
            var liginNameInput = document.createElement('input');
            liginNameInput.type = 'hidden';
            liginNameInput.name = 'liginName';
            liginNameInput.value = liginName;
            form.appendChild(liginNameInput);

            var liginQuantityInput = document.createElement('input');
            liginQuantityInput.type = 'hidden';
            liginQuantityInput.name = 'liginQuantity';
            liginQuantityInput.value = liginQuantity;
            form.appendChild(liginQuantityInput);
        }

        if (parseInt(ligrepQuantity) > 0) {
            var ligrepNameInput = document.createElement('input');
            ligrepNameInput.type = 'hidden';
            ligrepNameInput.name = 'ligrepName';
            ligrepNameInput.value = ligrepName;
            form.appendChild(ligrepNameInput);

            var ligrepQuantityInput = document.createElement('input');
            ligrepQuantityInput.type = 'hidden';
            ligrepQuantityInput.name = 'ligrepQuantity';
            ligrepQuantityInput.value = ligrepQuantity;
            form.appendChild(ligrepQuantityInput);
        }
        if (parseInt(faninQuantity) > 0) {
            var faninNameInput = document.createElement('input');
            faninNameInput.type = 'hidden';
            faninNameInput.name = 'faninName';
            faninNameInput.value = faninName;
            form.appendChild(faninNameInput);

            var faninQuantityInput = document.createElement('input');
            faninQuantityInput.type = 'hidden';
            faninQuantityInput.name = 'faninQuantity';
            faninQuantityInput.value = faninQuantity;
            form.appendChild(faninQuantityInput);
        }
        if (parseInt(fanrepQuantity) > 0) {
            var fanrepNameInput = document.createElement('input');
            fanrepNameInput.type = 'hidden';
            fanrepNameInput.name = 'fanrepName';
            fanrepNameInput.value = fanrepName;
            form.appendChild(fanrepNameInput);

            var fanrepQuantityInput = document.createElement('input');
            fanrepQuantityInput.type = 'hidden';
            fanrepQuantityInput.name = 'fanrepQuantity';
            fanrepQuantityInput.value = fanrepQuantity;
            form.appendChild(fanrepQuantityInput);
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
        var liginPrice = 2500;
        var ligrepPrice = 2700;
        var faninPrice = 2300;
        var fanrepPrice = 3500;

        var liginQuantity = parseInt(document.getElementById('liginQuantity').value) || 0;
        var ligrepQuantity = parseInt(document.getElementById('ligrepQuantity').value) || 0;
        var faninQuantity = parseInt(document.getElementById('faninQuantity').value) || 0;
        var fanrepQuantity = parseInt(document.getElementById('fanrepQuantity').value) || 0;

        var subtotal = liginPrice * liginQuantity + ligrepPrice * ligrepQuantity + faninPrice * faninQuantity + fanrepPrice * fanrepQuantity;
        var tax = subtotal * 0.05;
        var total = subtotal + tax + 15; // Assuming a fixed shipping charge of Rs. 15

        document.getElementById('subtotal').innerText = 'Rs ' + subtotal;
        document.getElementById('tax').innerText = 'Rs ' + tax;
        document.getElementById('total').innerText = 'Rs ' + total;
    }

</script>
</asp:Content>
