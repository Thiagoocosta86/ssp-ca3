<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
			<head>
				<title>2020005 Car Sales</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<style>
				body{font-family:Arial,Helvetica,sans-serif;background-color:#fff;margin:5px;text-align:left;color:#523819}
				h2{margin-left:100px;font-size:140%;color:#0d3427;margin-top:10px}
				table{margin-left:50px;background-color:#C1E1C1;border-color:#000;border-width:thin;border-collapse:collapse;width:75%}
				th{border-color:#000;font-size:120%;color:#088F8F}
				td{border-color:#000;font-size:100%;color:#000000;padding:5px}
				</style>
			
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
	
			</body>
		</html>
</xsl:template>
</xsl:stylesheet>