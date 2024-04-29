<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="paint.aspx.cs" Inherits="fixmojowebsite.paint" %>
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
					<img src="imgnvid/painthouse.jpeg">
					<div class="content">
						<h3>Rental Painting</h3>
						<h4>Rs.2500 per room</h4>
						<p class="unit">Quantity: <input id="paintQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
				<div class="box">
					<img src="imgnvid/paintwaterprof.jpeg">
					<div class="content">
						<h3>WaterProofing</h3>
						<h4>Rs.2700 per room</h4>
						<p class="unit">Quantity: <input id="waterQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>

                <div class="box">
				<img src="imgnvid/paintinte.jpeg">
				<div class="content">
					<h3>Interior Painting</h3>
					<h4>Rs.2300 per room</h4>
					<p class="unit">Quantity: <input id="intptQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
</div>
                <div class="box">
				<img src="imgnvid/paintext.jpeg">
				<div class="content">
					<h3>Exterior Painting</h3>
					<h4>Rs.3500 (ht.10)</h4>
					<p class="unit">Quantity: <input id="extptQuantity" name="" value="" onchange="updateTotal()"></p>
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

            var paintQuantity = document.getElementById('paintQuantity').value;
            var waterQuantity = document.getElementById('waterQuantity').value;
            var paintName = document.querySelector('.project .shop .box:nth-child(1) .content h3').innerText;
            var waterName = document.querySelector('.project .shop .box:nth-child(2) .content h3').innerText;
            var intptQuantity = document.getElementById('intptQuantity').value;
            var extptQuantity = document.getElementById('extptQuantity').value;
            var intptName = document.querySelector('.project .shop .box:nth-child(3) .content h3').innerText;
            var extptName = document.querySelector('.project .shop .box:nth-child(4) .content h3').innerText;

            var subtotal = document.getElementById('subtotal').innerText;
            var tax = document.getElementById('tax').innerText;
            var shipping = document.getElementById('shipping').innerText;
            var total = document.getElementById('total').innerText;




            // Create a form element
            var form = document.createElement('form');
            form.method = 'post';  // Set the form method to POST
            form.action = 'booking.aspx';  // Set the form action to booking.aspx

            // Create hidden input fields to hold the data
            if (parseInt(paintQuantity) > 0) {
                var paintNameInput = document.createElement('input');
                paintNameInput.type = 'hidden';
                paintNameInput.name = 'paintName';
                paintNameInput.value = paintName;
                form.appendChild(paintNameInput);

                var paintQuantityInput = document.createElement('input');
                paintQuantityInput.type = 'hidden';
                paintQuantityInput.name = 'paintQuantity';
                paintQuantityInput.value = paintQuantity;
                form.appendChild(paintQuantityInput);
            }

            if (parseInt(waterQuantity) > 0) {
                var waterNameInput = document.createElement('input');
                waterNameInput.type = 'hidden';
                waterNameInput.name = 'waterName';
                waterNameInput.value = waterName;
                form.appendChild(waterNameInput);

                var waterQuantityInput = document.createElement('input');
                waterQuantityInput.type = 'hidden';
                waterQuantityInput.name = 'waterQuantity';
                waterQuantityInput.value = waterQuantity;
                form.appendChild(waterQuantityInput);
            }
            if (parseInt(intptQuantity) > 0) {
                var intptNameInput = document.createElement('input');
                intptNameInput.type = 'hidden';
                intptNameInput.name = 'intptName';
                intptNameInput.value = intptName;
                form.appendChild(intptNameInput);

                var intptQuantityInput = document.createElement('input');
                intptQuantityInput.type = 'hidden';
                intptQuantityInput.name = 'intptQuantity';
                intptQuantityInput.value = intptQuantity;
                form.appendChild(intptQuantityInput);
            }
            if (parseInt(extptQuantity) > 0) {
                var extptNameInput = document.createElement('input');
                extptNameInput.type = 'hidden';
                extptNameInput.name = 'extptName';
                extptNameInput.value = extptName;
                form.appendChild(extptNameInput);

                var extptQuantityInput = document.createElement('input');
                extptQuantityInput.type = 'hidden';
                extptQuantityInput.name = 'extptQuantity';
                extptQuantityInput.value = extptQuantity;
                form.appendChild(extptQuantityInput);
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
            var paintPrice = 2500;
            var waterPrice = 2700;
            var intptPrice = 2300;
            var extptPrice = 3500;

            var paintQuantity = parseInt(document.getElementById('paintQuantity').value) || 0;
            var waterQuantity = parseInt(document.getElementById('waterQuantity').value) || 0;
            var intptQuantity = parseInt(document.getElementById('intptQuantity').value) || 0;
            var extptQuantity = parseInt(document.getElementById('extptQuantity').value) || 0;

            var subtotal = paintPrice * paintQuantity + waterPrice * waterQuantity + intptPrice * intptQuantity + extptPrice * extptQuantity;
            var tax = subtotal * 0.05;
            var total = subtotal + tax + 15; // Assuming a fixed shipping charge of Rs. 15

            document.getElementById('subtotal').innerText = 'Rs' + subtotal;
            document.getElementById('tax').innerText = 'Rs' + tax;
            document.getElementById('total').innerText = 'Rs' + total;
        }

         </script>
</asp:Content>
