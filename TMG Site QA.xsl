<?altova_samplexml S:\Treadwell Media Group\Book Site\TMGSite.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/Profiles/xhtml1-transitional">
	<!--<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">-->
	<!--  To-do:
	
		
	
			5.  Titles w/o print, mobi, ereader, etc.


			
									-->
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:param name="path" select="'///s:/Treadwell Media Group/Book Site/'"/>
	<!--  Build the page header -->
	<xsl:template match="/">
		<html>
			<head>
				<title>TMG Site QA</title>
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
		<h1>Mismatched nt and bt tags</h1>
		<ol>
			<xsl:for-each select="//title[child::author[not(@idref)]]">
				<li>
					<xsl:value-of select="name"/>
				</li>
			</xsl:for-each>
		</ol>
			<h1>Mismatched rt tags</h1>
		<ol>
			<xsl:for-each select="//title[child::author[not(@idref)]]">
				<li>
					<xsl:value-of select="name"/>
				</li>
			</xsl:for-each>
		</ol>
		
	</xsl:template>
	
	<xsl:template match="publishers"/>
	<xsl:template match="formats"/>
	<xsl:template match="imprints"/>
	<xsl:template match="authors"/>
	<xsl:template match="resources"/>
	<xsl:template match="series"/>
	<xsl:template match="*">
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
