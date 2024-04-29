<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="clean.aspx.cs" Inherits="fixmojowebsite.clean" %>
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
					<img src="imgnvid/cleancla.png">
					<div class="content">
						<h3>Full Home Cleaning Classic</h3>
						<h4>Rs.3000 </h4>
						<p class="unit">Quantity: <input id="fullQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
				<div class="box">
					<img src="imgnvid/cleanpre.jpeg">
					<div class="content">
						<h3> Full Home Cleaning Premium</h3>
						<h4>Rs.4500 </h4>
						<p class="unit">Quantity: <input id="preQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>

                <div class="box">
				<img src="imgnvid/cleankit.jpeg">
				<div class="content">
					<h3>Kitchen Cleaning</h3>
					<h4>Rs.2500</h4>
					<p class="unit">Quantity: <input id="kitQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
</div>
                <div class="box">
				<img src="imgnvid/cleanbath.jpg">
				<div class="content">
					<h3>Bath Cleaning</h3>
					<h4>Rs.1500</h4>
					<p class="unit">Quantity: <input id="bathQuantity" name="" value="" onchange="updateTotal()"></p>
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
        var fullQuantity = document.getElementById('fullQuantity').value;
        var preQuantity = document.getElementById('preQuantity').value;
        var kitQuantity = document.getElementById('kitQuantity').value;
        var bathQuantity = document.getElementById('bathQuantity').value;

        var fullName = document.querySelector('.project .shop .box:nth-child(1) .content h3').innerText;
        var preName = document.querySelector('.project .shop .box:nth-child(2) .content h3').innerText;
        var kitName = document.querySelector('.project .shop .box:nth-child(3) .content h3').innerText;
        var bathName = document.querySelector('.project .shop .box:nth-child(4) .content h3').innerText;

        var subtotal = document.getElementById('subtotal').innerText;
        var tax = document.getElementById('tax').innerText;
        var shipping = document.getElementById('shipping').innerText;
        var total = document.getElementById('total').innerText;

        // Create a form element
        var form = document.createElement('form');
        form.method = 'post';  // Set the form method to POST
        form.action = 'bookingclean.aspx';  // Set the form action to booking.aspx

        // Create hidden input fields to hold the data
        if (parseInt(fullQuantity) > 0) {
            var fullNameInput = document.createElement('input');
            fullNameInput.type = 'hidden';
            fullNameInput.name = 'fullName';
            fullNameInput.value = fullName;
            form.appendChild(fullNameInput);

            var fullQuantityInput = document.createElement('input');
            fullQuantityInput.type = 'hidden';
            fullQuantityInput.name = 'fullQuantity';
            fullQuantityInput.value = fullQuantity;
            form.appendChild(fullQuantityInput);
        }

        if (parseInt(preQuantity) > 0) {
            var preNameInput = document.createElement('input');
            preNameInput.type = 'hidden';
            preNameInput.name = 'preName';
            preNameInput.value = preName;
            form.appendChild(preNameInput);

            var preQuantityInput = document.createElement('input');
            preQuantityInput.type = 'hidden';
            preQuantityInput.name = 'preQuantity';
            preQuantityInput.value = preQuantity;
            form.appendChild(preQuantityInput);
        }
        if (parseInt(kitQuantity) > 0) {
            var kitNameInput = document.createElement('input');
            kitNameInput.type = 'hidden';
            kitNameInput.name = 'kitName';
            kitNameInput.value = kitName;
            form.appendChild(kitNameInput);

            var kitQuantityInput = document.createElement('input');
            kitQuantityInput.type = 'hidden';
            kitQuantityInput.name = 'kitQuantity';
            kitQuantityInput.value = kitQuantity;
            form.appendChild(kitQuantityInput);
        }
        if (parseInt(bathQuantity) > 0) {
            var bathNameInput = document.createElement('input');
            bathNameInput.type = 'hidden';
            bathNameInput.name = 'bathName';
            bathNameInput.value = bathName;
            form.appendChild(bathNameInput);

            var bathQuantityInput = document.createElement('input');
            bathQuantityInput.type = 'hidden';
            bathQuantityInput.name = 'bathQuantity';
            bathQuantityInput.value = bathQuantity;
            form.appendChild(bathQuantityInput);
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
        var fullPrice = 2500;
        var prePrice = 2700;
        var kitPrice = 2300;
        var bathPrice = 3500;

        var fullQuantity = parseInt(document.getElementById('fullQuantity').value) || 0;
        var preQuantity = parseInt(document.getElementById('preQuantity').value) || 0;
        var kitQuantity = parseInt(document.getElementById('kitQuantity').value) || 0;
        var bathQuantity = parseInt(document.getElementById('bathQuantity').value) || 0;

        var subtotal = fullPrice * fullQuantity + prePrice * preQuantity + kitPrice * kitQuantity + bathPrice * bathQuantity;
        var tax = subtotal * 0.05;
        var total = subtotal + tax + 15; // Assuming a fixed shipping charge of Rs. 15

        document.getElementById('subtotal').innerText = 'Rs ' + subtotal;
        document.getElementById('tax').innerText = 'Rs ' + tax;
        document.getElementById('total').innerText = 'Rs ' + total;
    }
    </script>

</asp:Content>
