<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="pest1.aspx.cs" Inherits="fixmojowebsite.pest11" %>
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
				<img src="imgnvid/pesthome.jpeg">
				<div class="content">
					<h3>Full House Pest Control</h3>
					<h4>Rs.1888</h4>
					<p class="unit">Quantity: <input id="pesthQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
			</div>
            <div class="box">
				<img src="imgnvid/pestkitch.jpeg">
				<div class="content">
					<h3>Kitchen Pest COntrol</h3>
					<h4>Rs.2000</h4>
					<p class="unit">Quantity: <input id="pestkitQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
                </div>
                            <div class="box">
				<img src="imgnvid/pestbath.jpeg">
				<div class="content">
					<h3>Bath Pest Control</h3>
					<h4>Rs.789</h4>
					<p class="unit">Quantity: <input id="pestbathQuantity" name="" value="" onchange="updateTotal()"></p>
					<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
				</div>
                                </div>
                     <div class="box">
				<img src="imgnvid/pestuten.jpeg">
				<div class="content">
					<h3>Utensil Pest Control</h3>
					<h4>Rs.799</h4>
					<p class="unit">Quantity: <input id="pestutQuantity" name="" value="" onchange="updateTotal()"></p>
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

        var pesthQuantity = document.getElementById('pesthQuantity').value;
        var pestkitQuantity = document.getElementById('pestkitQuantity').value;
        var pesthName = document.querySelector('.project .shop .box:nth-child(1) .content h3').innerText;
        var pestkitName = document.querySelector('.project .shop .box:nth-child(2) .content h3').innerText;
        var pestbathQuantity = document.getElementById('pestbathQuantity').value;
        var pestutQuantity = document.getElementById('pestutQuantity').value;
        var pestbathName = document.querySelector('.project .shop .box:nth-child(3) .content h3').innerText;
        var pestutName = document.querySelector('.project .shop .box:nth-child(4) .content h3').innerText;

        var subtotal = document.getElementById('subtotal').innerText;
        var tax = document.getElementById('tax').innerText;
        var shipping = document.getElementById('shipping').innerText;
        var total = document.getElementById('total').innerText;




        // Create a form element
        var form = document.createElement('form');
        form.method = 'post';  // Set the form method to POST
        form.action = 'bookingpest.aspx';  // Set the form action to booking.aspx

        // Create hidden input fields to hold the data
        if (parseInt(pesthQuantity) > 0) {
            var pesthNameInput = document.createElement('input');
            pesthNameInput.type = 'hidden';
            pesthNameInput.name = 'pesthName';
            pesthNameInput.value = pesthName;
            form.appendChild(pesthNameInput);

            var pesthQuantityInput = document.createElement('input');
            pesthQuantityInput.type = 'hidden';
            pesthQuantityInput.name = 'pesthQuantity';
            pesthQuantityInput.value = pesthQuantity;
            form.appendChild(pesthQuantityInput);
        }

        if (parseInt(pestkitQuantity) > 0) {
            var pestkitNameInput = document.createElement('input');
            pestkitNameInput.type = 'hidden';
            plflushNameInput.name = 'pestkitName';
            pestkitNameInput.value = pestkitName;
            form.appendChild(pestkitNameInput);

            var pestkitQuantityInput = document.createElement('input');
            pestkitQuantityInput.type = 'hidden';
            pestkitQuantityInput.name = 'pestkitQuantity';
            pestkitQuantityInput.value = pestkitQuantity;
            form.appendChild(pestkitQuantityInput);
        }
        if (parseInt(pestbathQuantity) > 0) {
            var pestbathNameInput = document.createElement('input');
            pestbathNameInput.type = 'hidden';
            pestbathNameInput.name = 'pestbathName';
            pestbathNameInput.value = pestbathName;
            form.appendChild(pestbathNameInput);

            var pestbathQuantityInput = document.createElement('input');
            pestbathQuantityInput.type = 'hidden';
            pestbathQuantityInput.name = 'pestbathQuantity';
            pestbathQuantityInput.value = pestbathQuantity;
            form.appendChild(pestbathQuantityInput);
        }
        if (parseInt(pestutQuantity) > 0) {
            var pestutNameInput = document.createElement('input');
            pestutNameInput.type = 'hidden';
            pestutNameInput.name = 'pestutName';
            pestutNameInput.value = pestutName;
            form.appendChild(pestutNameInput);

            var pestutQuantityInput = document.createElement('input');
            pestutQuantityInput.type = 'hidden';
            pestutQuantityInput.name = 'pestutQuantity';
            pestutQuantityInput.value = pestutQuantity;
            form.appendChild(pestutQuantityInput);
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
        var pesthPrice = 1888;
        var pestkitPrice = 2000;
        var pestbathPrice = 789;
        var pestutPrice = 799;

        var pesthQuantity = parseInt(document.getElementById('pesthQuantity').value) || 0;
        var pestkitQuantity = parseInt(document.getElementById('pestkitQuantity').value) || 0;
        var pestbathQuantity = parseInt(document.getElementById('pestbathQuantity').value) || 0;
        var pestutQuantity = parseInt(document.getElementById('pestutQuantity').value) || 0;

        var subtotal = pesthPrice * pesthQuantity + pestkitPrice * pestkitQuantity + pestbathPrice * pestbathQuantity + pestutPrice * pestutQuantity;
        var tax = subtotal * 0.05;
        var total = subtotal + tax + 15; // Assuming a fixed shipping charge of Rs. 15

        document.getElementById('subtotal').innerText = 'Rs' + subtotal;
        document.getElementById('tax').innerText = 'Rs' + tax;
        document.getElementById('total').innerText = 'Rs' + total;
    }

</script>


</asp:Content>
