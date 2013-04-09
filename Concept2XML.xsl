<?altova_samplexml S:\Treadwell Media Group\TMG Site\TMG website.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:strip-space elements="*"/>
<!--	

This XSLT takes the skos-like structure in TMG Website.xml and turns it into nested concepts.  
The idea is to print the output of this XSLT into a variable and then use XPATH statements to work on it
to generate navigation trees rather than having to deal with all of the <bt>, <nt> and id logic of the skos version

-->

<!--  Build the page header -->
	<xsl:template match="/">
		<document>
			<xsl:apply-templates/>
		</document>
	</xsl:template>

	<xsl:template match="categories">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="concept[not(child::nt)]">
		<concept>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<preferredLabel>
				<xsl:value-of select="preferredLabel"/>
			</preferredLabel>
			<definition>
				<xsl:value-of select="definition"/>
			</definition>
			<xsl:call-template name="nest">
				<xsl:with-param name="id">
					<xsl:value-of select="@id"/>
				</xsl:with-param>
			</xsl:call-template>
		</concept>
	</xsl:template>
	<xsl:template name="nest">
		<xsl:param name="id"/>
		<xsl:for-each select="//concept[child::nt[@idref=$id]]">
			<concept>
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
				<preferredLabel>
					<xsl:value-of select="preferredLabel"/>
				</preferredLabel>
				<definition>
					<xsl:value-of select="definition"/>
				</definition>
				<xsl:call-template name="nest">
					<xsl:with-param name="id">
						<xsl:value-of select="@id"/>
					</xsl:with-param>
				</xsl:call-template>
			</concept>
		</xsl:for-each>
	</xsl:template>
	<!--  *********************************************************************  
           *********************************************************************  -->
	<xsl:template match="concept"/>
	<xsl:template match="welcome"/>
	<xsl:template match="services"/>
	<xsl:template match="projects"/>
	<xsl:template match="articles"/>
	<xsl:template match="news"/>
	<xsl:template match="biographies"/>
	<xsl:template match="faq"/>
	<xsl:template match="resources"/>
	<xsl:template match="*">
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
