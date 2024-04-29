<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="carpenter.aspx.cs" Inherits="fixmojowebsite.carpenter" %>
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
					<img src="imgnvid/cardrep.jpeg">
					<div class="content">
						<h3>Door Repair</h3>
						<h4>Rs.400</h4>
						<p class="unit">Quantity: <input id="doorrepQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
				<div class="box">
					<img src="imgnvid/carwdoor.jpeg">
					<div class="content">
						<h3>Door Installation</h3>
						<h4>Rs.700 </h4>
						<p class="unit">Quantity: <input id="doorinQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>

                <div class="box">
				<img src="imgnvid/cfurrep.jpg">
				<div class="content">
					<h3>Furniture repair</h3>
					<h4>Rs.250</h4>
					<p class="unit">Quantity: <input id="furQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
</div>
                <div class="box">
				<img src="imgnvid/cuprep.jpg">
				<div class="content">
					<h3>Cupboard Installation/Repair</h3>
					<h4>Rs.600</h4>
					<p class="unit">Quantity: <input id="cupQuantity" name="" value="" onchange="updateTotal()"></p>
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
        var doorrepQuantity = document.getElementById('doorrepQuantity').value;
        var doorinQuantity = document.getElementById('doorinQuantity').value;
        var furQuantity = document.getElementById('furQuantity').value;
        var cupQuantity = document.getElementById('cupQuantity').value;
    
    var doorrepName = document.querySelector('.project .shop .box:nth-child(1) .content h3').innerText;
    var doorinName = document.querySelector('.project .shop .box:nth-child(2) .content h3').innerText;
    var furName = document.querySelector('.project .shop .box:nth-child(3) .content h3').innerText;
    var cupName = document.querySelector('.project .shop .box:nth-child(4) .content h3').innerText;

    var subtotal = document.getElementById('subtotal').innerText;
    var tax = document.getElementById('tax').innerText;
    var shipping = document.getElementById('shipping').innerText;
    var total = document.getElementById('total').innerText;




    // Create a form element
    var form = document.createElement('form');
    form.method = 'post';  // Set the form method to POST
    form.action = 'bookingcarpen.aspx';  // Set the form action to booking.aspx

    // Create hidden input fields to hold the data
    if (parseInt(doorrepQuantity) > 0) {
        var doorrepNameInput = document.createElement('input');
        doorrepNameInput.type = 'hidden';
        doorrepNameInput.name = 'doorrepName';
        doorrepNameInput.value = doorrepName;
        form.appendChild(doorrepNameInput);

        var doorrepQuantityInput = document.createElement('input');
        doorrepQuantityInput.type = 'hidden';
        doorrepQuantityInput.name = 'doorrepQuantity';
        doorrepQuantityInput.value = doorrepQuantity;
        form.appendChild(doorrepQuantityInput);
    }

    if (parseInt(doorinQuantity) > 0) {
        var doorinNameInput = document.createElement('input');
        doorinNameInput.type = 'hidden';
        doorinNameInput.name = 'doorinName';
        doorinNameInput.value = doorinName;
        form.appendChild(doorinNameInput);

        var doorinQuantityInput = document.createElement('input');
        doorinQuantityInput.type = 'hidden';
        doorinQuantityInput.name = 'doorinQuantity';
        doorinQuantityInput.value = doorinQuantity;
        form.appendChild(doorinQuantityInput);
    }
    if (parseInt(furQuantity) > 0) {
        var furNameInput = document.createElement('input');
        furNameInput.type = 'hidden';
        furNameInput.name = 'furName';
        furNameInput.value = furName;
        form.appendChild(furNameInput);

        var furQuantityInput = document.createElement('input');
        furQuantityInput.type = 'hidden';
        furQuantityInput.name = 'furQuantity';
        furQuantityInput.value = furQuantity;
        form.appendChild(furQuantityInput);
    }
    if (parseInt(cupQuantity) > 0) {
        var cupNameInput = document.createElement('input');
        cupNameInput.type = 'hidden';
        cupNameInput.name = 'cupName';
        cupNameInput.value = cupName;
        form.appendChild(cupNameInput);

        var cupQuantityInput = document.createElement('input');
        cupQuantityInput.type = 'hidden';
        cupQuantityInput.name = 'cupQuantity';
        cupQuantityInput.value = cupQuantity;
        form.appendChild(cupQuantityInput);
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
    var doorrepPrice = 2500;
    var doorinPrice = 2700;
    var furPrice = 2300;
    var cupPrice = 3500;

    var doorrepQuantity = parseInt(document.getElementById('paintQuantity').value) || 0;
    var doorinQuantity = parseInt(document.getElementById('waterQuantity').value) || 0;
    var furQuantity = parseInt(document.getElementById('intptQuantity').value) || 0;
    var cupQuantity = parseInt(document.getElementById('extptQuantity').value) || 0;

    var subtotal = doorrepPrice * doorrepQuantity + doorinPrice * doorinQuantity + furPrice * furQuantity + cupPrice * cupQuantity;
    var tax = subtotal * 0.05;
    var total = subtotal + tax + 15; // Assuming a fixed shipping charge of Rs. 15

    document.getElementById('subtotal').innerText = '$' + subtotal;
    document.getElementById('tax').innerText = '$' + tax;
    document.getElementById('total').innerText = '$' + total;
        }
    </script>
</asp:Content>
