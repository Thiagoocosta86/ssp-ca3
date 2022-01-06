<?xml version="1.0"?> 
<!--based on Mikhail code from classes-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
			<head>
				<title>2020005 Car Sales</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<style>
				body{font-family:Arial,Helvetica,sans-serif;background-color:#fff;margin:5px;text-align:left;color:#523819}
				h2{margin-left:100px;font-size:140%;color:#0d3427;margin-top:10px;text-transform: uppercase};
				table{margin-left:50px;background-color:#C1E1C1;border-color:#000;border-width:thin;border-collapse:collapse;width:75%}
				th{border-color:#000;font-size:120%;color:#088F8F}
				td{border-color:#000;font-size:100%;color:#000000;padding:5px}
				</style>
    			<script><![CDATA[
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
				}); ]]>
				</script>
				
			</head>
			<body>
				<h2>2020005 Car Sales</h2>
				
    <table id="CarsTable" border="1" class="indent">
        <thead bgcolor="#FFA500">
            <tr>
                <th>Select</th>
                <th>Item</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <xsl:for-each select="//section">
                <tr>
                    <td colspan="4" bgcolor="#088F8F" >
                        <xsl:value-of select="@called"/>
                    </td>
                </tr>
                <xsl:for-each select="entry">
                    <tr id="{position()}">
                        <xsl:attribute name="brandnew">
                            <xsl:value-of select="boolean(@brandnew)" />
                        </xsl:attribute>
                        <td align="center">
                            <input name="item0" type="checkbox" />
                        </td>
                        <td>
                            <xsl:value-of select="item" />
                        </td>
                        <td align="right">
                            <xsl:value-of select="price" />
                        </td>
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </body>
    </table>
	<form class="indent">
						<p><input type="button" name="btnCalcBill" value="Calculate Bill" id="calcBill"/>
					Total: €
					<input type="text" name="txtBillAmt"/><input type="checkbox" name="cbOpts" value="isBN" id="showBN"/><label for="showVeg">Highlight BrandNew Cars</label></p>
						</form>
	
			</body>
		</html>
</xsl:template>
</xsl:stylesheet>