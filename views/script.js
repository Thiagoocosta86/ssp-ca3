
				var gEntreeCount = 0;
				// returns a number that represents the sum of all the selected menu
				// item prices.
				function calculateBill(idCarsTable) {
					var fBillTotal = 0.0;
					var i = 0;
					// find the table tag
					var tableCars = document.getElementById(idCarsTable);
					// go through the table and add up the prices of all
					// the selected items. The code takes advantage of the 
					// fact that each checkbox has a corresponding row in
					// the table, and the only INPUT tags are the checkboxes.
					var ctTags = tableCars.getElementsByTagName('INPUT');
					for (i = 0; i < ctTags.length; i++) {
						// is this menu item selected? it is if the checkbox is checked
						if (ctTags[i].checked) {
							// get the checkbox' parent table row
							var oTR = getParentTag(ctTags[i], 'TR');
							// retrieve the price from the price column, which is the third column in the table
							var oTDPrice = oTR.getElementsByTagName('TD')[2];
							// the first child text node of the column contains the price
							fBillTotal += parseFloat(oTDPrice.firstChild.data);
						};
					};
					// return the price as a decimal number with 2 decimal places
					return fBillTotal;
				};

				// This function either turns on or off the row highlighting for brandnew
				// items (depending on the value of bShowBN)
				function highlightBrandNew(idTable, bShowBN) {
					// if bShowBN is true, then we're highlighting brandnew
					//	cars, otherwise we're unhighlighting them.
					var i = 0;
					var tableCars = document.getElementById(idTable);
					var oTBODY = tableCars.getElementsByTagName('TBODY')[0];
					var aTRs = oTBODY.getElementsByTagName('TR');
					// walk through each of the table rows and see if it has a 
					// "brandnew" attribute on it.
					for (i = 0; i < aTRs.length; i++) {
						if (aTRs[i].getAttribute('brandnew') && aTRs[i].getAttribute('brandnew') == "true") {
							if (bShowBN) {
								aTRs[i].style.backgroundColor = "lightGreen";
							} else {
								aTRs[i].style.backgroundColor = "";
							};
						};
					};
				};

				// Utility function for getting the parent tag of a given tag
				// but only of a certain type (i.e. a TR, a TABLE, etc.)
				function getParentTag(oNode, sParentType) {
					var oParent = oNode.parentNode;
					while (oParent) {
						if (oParent.nodeName == sParentType)
							return oParent;
						oParent = oParent.parentNode;
					};
					return oParent;
				};
				window.addEventListener("load", function() {
					document.forms[0].txtBillAmt.value = calculateBill('CarsTable');
					document.querySelector("#calcBill").addEventListener("click", function() {
						document.forms[0].txtBillAmt.value = calculateBill('CarsTable');
					});
					document.querySelector("#showBN").addEventListener("click", function() {
						highlightBrandNew('CarsTable', this.checked);
					});
				}); 
			