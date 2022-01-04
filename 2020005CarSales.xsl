<?xml version="1.0"?> 
<!--based on Mikhail code from classes-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:template match="/">
<html>
			<head>
				<title>2020005 Car Sales</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<link rel="stylesheet" href="views/style.css" type="text/css" />
    			<script src="views/script.js" defer></script>
				
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
        </tbody>
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