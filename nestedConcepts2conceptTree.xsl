<?altova_samplexml S:\Treadwell Media Group\TMG Site\TMG website.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/Profiles/xhtml1-transitional">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:param name="path" select="'///s:/Treadwell Media Group/Book Site/'"/>
	<!--  Build the page header -->
	<xsl:template match="/">
		<html>
			<head>
				<title>TMG Concept structure</title>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<!--	
	   Generate title information section
-->
	<xsl:template match="categories">
	<h1>Publishing Taxonomy Tree</h1>
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
	<xsl:template match="concept[not(child::nt)]">
		<li>
			<b><xsl:value-of select="preferredLabel"/></b>: <xsl:value-of select="definition"/>
			<ul>
				<xsl:call-template name="nest">
					<xsl:with-param name="id">
						<xsl:value-of select="@id"/>
					</xsl:with-param>
				</xsl:call-template>
			</ul>
		</li>
	</xsl:template>
	<xsl:template name="nest">
		<xsl:param name="id"/>
		<xsl:for-each select="//concept[child::nt[@idref=$id]]">
			<li>
				<b><xsl:value-of select="preferredLabel"/></b>: <xsl:value-of select="definition"/>
				<ul>
					<xsl:call-template name="nest">
						<xsl:with-param name="id">
							<xsl:value-of select="@id"/>
						</xsl:with-param>
					</xsl:call-template>
				</ul>
			</li>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="*">
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
