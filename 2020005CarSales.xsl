<?xml version="1.0"?> 
<!--based on Mikhail code from classes-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
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
</xsl:template>
</xsl:stylesheet>