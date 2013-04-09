<?altova_samplexml S:\Treadwell Media Group\TMG Site\TMG website.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/Profiles/xhtml1-transitional">
	<xsl:output method="xhtml" encoding="UTF-8" indent="yes"/>
	<xsl:param name="welcomeheader">
		<div class="header">
			<a href="http://www.treadwellmedia.com/">
				<img align="left" src="./includes/logo.gif" border="0"/>
			</a>
			<h1>Treadwell Media Group</h1>
			<p class="navline">
				<a href="mailto:info@treadwellmedia.com">info@treadwellmedia.com</a>
			</p>
			<p class="navline">
				<b>
					<a href="http://www.treadwellmedia.com/" class="sn">HOME</a>
				</b> | 
			<b>
					<a href="/Capabilities/index.htm" class="sn">CAPABILITIES</a>
				</b> | 
			<b>
					<a href="/Cases/index.htm" class="sn">PROJECTS</a>
				</b> | 
			<b>
					<a href="/Articles/index.htm" class="sn">ARTICLES</a>
				</b> | 
			<b>
					<a href="/Resources/index.htm" class="sn">RESOURCES</a>
				</b> | 
				<b>
					<a href="/Taxonomy/index.htm" class="sn">TAXONOMY</a>
				</b> | 
			<b>
					<a href="mailto:info@treadwellmedia.com" class="sn">CONTACT</a>
				</b>
			</p>
		</div>
	</xsl:param>
	<xsl:param name="header">
		<div class="header">
			<a href="http://www.treadwellmedia.com/">
				<img align="left" src="../includes/logo.gif" border="0"/>
			</a>
			<h1>Treadwell Media Group</h1>
			<p class="navline">
				<a href="mailto:info@treadwellmedia.com">info@treadwellmedia.com</a>
			</p>
			<p class="navline">
				<b>
					<a href="http://www.treadwellmedia.com/" class="sn">HOME</a>
				</b> | 
			<b>
					<a href="/Capabilities/index.htm" class="sn">CAPABILITIES</a>
				</b> | 
			<b>
					<a href="/Cases/index.htm" class="sn">PROJECTS</a>
				</b>  | 
			<b>
					<a href="/Articles/index.htm" class="sn">ARTICLES</a>
				</b> | 
			<b>
					<a href="/Resources/index.htm" class="sn">RESOURCES</a>
				</b> | 
				<b>
					<a href="/Taxonomy/index.htm" class="sn">TAXONOMY</a>
				</b> | 
			<b>
					<a href="mailto:info@treadwellmedia.com" class="sn">CONTACT</a>
				</b>
			</p>
		</div>
	</xsl:param>
	<xsl:param name="leftnavheader">
		<form method="get" name="searchform" action="http://www.google.com/search" target="popup">
			<input type="hidden" name="as_sitesearch" value="www.treadwellmedia.com"/>
			<input type="text" name="as_q"/>
			<input type="submit" value="Search Site"/>
		</form>
		<iframe src="http://rcm.amazon.com/e/cm?t=treamedigrou-20&amp;o=1&amp;p=27&amp;l=qs1&amp;f=ifr" width="180" height="150" frameborder="0" scrolling="no"/>
	</xsl:param>
	<xsl:param name="footer">
		<div class="footer">
			<p class="navline">
				<b>
					<a href="http://www.treadwellmedia.com/" class="sn">HOME</a>
				</b> | <b>
					<a href="/Capabilities/index.htm" class="sn">CAPABILITIES</a>
				</b> | <b>
					<a href="/Cases/index.htm" class="sn">PROJECTS</a>
				</b> | <b>
					<a href="/Articles/index.htm" class="sn">ARTICLES</a>
				</b> | <b>
					<a href="/Resources/index.htm" class="sn">RESOURCES</a>
				</b> | 
				<b>
					<a href="/Taxonomy/index.htm" class="sn">TAXONOMY</a>
				</b> | 
				<b>
					<a href="mailto:info@treadwellmedia.com" class="sn">CONTACT</a>
				</b>
			</p>
			<p class="footercr">Copyright 2007 Treadwell Media Group</p>
		</div>
	</xsl:param>
	<xsl:template match="document">
		<xsl:apply-templates/>
	</xsl:template>
	<!--	
	     Articles index page
-->
	<xsl:template match="articles">
		<xsl:variable name="uri" select="'///S:/Treadwell Media Group/TMG Site/Articletest/index.htm'"/>
		<xsl:result-document href="{$uri}">
			<html>
				<head>
					<title>Treadwell Media Group - Articles</title>
					<meta name="Description" content="Consulting services for the book publishing industry"/>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
					<link rel="stylesheet" media="print" href="../includes/print.css" type="text/css" />
					<meta name="Keywords" content="Book Consulting, TMG"/>
				</head>
				<body>
					<xsl:copy-of select="$header"/>
					<div class="navigation">
						<xsl:copy-of select="$leftnavheader"/>
						<p>
							<a>
								<xsl:attribute name="href">mailto:comments@treadwellmedia.com?subject=Comments from www.treadwellmedia.com/Articles/index.htm</xsl:attribute>Email comments to Treadwell Media Group</a>
						</p>
						<p>
							<b>Articles:</b>
						</p>
						<ul>
							<xsl:for-each select="//article/articleHeader">
								<li>
									<xsl:variable name="uri" select="xrefURL/@href"/>
									<a href="{$uri}">
										<xsl:value-of select="articleTitle"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
					<div class="content">
						<h2>Articles:</h2>
						<ul>
							<xsl:for-each select="//article/articleHeader">
								<li>
									<xsl:variable name="uri" select="xrefURL/@href"/>
									<a href="{$uri}">
										<xsl:value-of select="articleTitle"/>
									</a>: 
												<xsl:value-of select="description"/>
								</li>
							</xsl:for-each>
						</ul>
					</div>
					<xsl:copy-of select="$footer"/>
				</body>
			</html>
		</xsl:result-document>
		<!--  
********************  Article pages ************************

-->
		<xsl:for-each select="//article[@generate='yes']">
			<xsl:variable name="uri" select="concat ('///S:/Treadwell Media Group/TMG Site/Articletest/', articleHeader/xrefURL/@href)"/>
			<xsl:result-document href="{$uri}">
				<html>
					<head>
						<title>Treadwell Media Group - Articles - <xsl:value-of select="projectType"/>
						</title>
						<meta name="Description">
							<xsl:attribute name="content"><xsl:value-of select="projectDescription"/></xsl:attribute>
						</meta>
						<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
						<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
						<meta name="Keywords">
							<xsl:attribute name="content">Treadwell Media Group, <xsl:value-of select="projectType"/></xsl:attribute>
						</meta>
					</head>
					<body>
						<xsl:copy-of select="$header"/>
						<div class="navigation">
							<xsl:copy-of select="$leftnavheader"/>
							<p>
								<a>
									<xsl:attribute name="href">mailto:comments@treadwellmedia.com?subject=Comments from www.treadwellmedia.com/Articles/index.htm</xsl:attribute>Email comments to Treadwell Media Group</a>
							</p>
							<p>
								<b>Articles:</b>
							</p>
							<ul>
								<xsl:for-each select="//article/articleHeader">
									<li>
										<xsl:variable name="uri" select="xrefURL/@href"/>
										<a href="{$uri}">
											<xsl:value-of select="articleTitle"/>
										</a>
									</li>
								</xsl:for-each>
							</ul>
						</div>
						<div class="content">
							<xsl:copy-of select="document(articleHeader/sourceURL/@href)//body"/>
								
						</div>
						<xsl:copy-of select="$footer"/>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="welcome | services | projects | biographies | faq | resources | categories"/>
	
</xsl:stylesheet>
