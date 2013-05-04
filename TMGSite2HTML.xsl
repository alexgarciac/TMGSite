<!-- edited with XMLSpy v2013 sp1 (x64) (http://www.altova.com) by Ken Brooks (Cengage Learning) -->
<?altova_samplexml Q:\Treadwell Media Group\TMG Site\TMG website.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<!--   -->
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:param name="welcomeheader">
		<div class="header">
			<a href="http://www.treadwellmedia.com/">
				<img align="left" src="./includes/logo.gif" border="0"/>
			</a>
			<h1>Treadwell Media Group</h1>
			<p class="navline">
				<a href="mailto:info@treadwellmedia.com">info@treadwellmedia.com</a>
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
		<p align="center">
			<span class="youarehere">Contact Treadwell Media:</span>
			<a href="mailto:info@treadwellmedia.com" class="contactemail">info@treadwellmedia.com</a>
		</p>
	</xsl:param>
	<xsl:param name="footer">
		<p>
			<a href="mailto:info@treadwellmedia.com">Contact Us</a> | <a href="#top">Back to Top</a>
			<br/>Copyright 2007-2013, Treadwell Media Group</p>
	</xsl:param>
	<xsl:param name="taxonomyNav">
		<p>Alphabetized list of taxonomy terms:</p>
		<ul>
			<xsl:for-each-group select="//concept" group-by="upper-case(substring(@id,1,1))">
				<xsl:sort select="current-grouping-key()"/>
				<xsl:variable name="current-letter" select="current-grouping-key()"/>
				<xsl:variable name="uri" select="concat ($current-letter,'-taxonomy', '.htm')"/>
				<li>
					<a href="{$uri}">
						<xsl:value-of select="$current-letter"/>
					</a>
				</li>
			</xsl:for-each-group>
		</ul>
	</xsl:param>
	<xsl:template match="document">
		<xsl:apply-templates/>
	</xsl:template>
	<!--	**********************   Welcome  ************************ -->
	<xsl:template match="welcome">
		<xsl:variable name="uri" select="'///Q:/Treadwell Media Group/TMG Site/index.htm'"/>
		<xsl:result-document href="{$uri}">
			<html>
				<head>
					<title>Treadwell Media Group</title>
					<meta name="Description" content="Consulting services for the book publishing industry"/>
					<meta name="Keywords" content="Book Consulting, TMG"/>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" href="./includes/tmg.css"/>
					<link rel="alternate" type="application/rss+xml" title="ROR" href="/ror.xml"/>
				</head>
				<body bgcolor="#666666">
					<div class="allbody" id="top">
						<div class="banner">
							<img src="./includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
						</div>
						<div class="subhead">
							Innovative publishing solutions.
						</div>
						<div class="left">
							<div class="searchbar">
								<xsl:copy-of select="$leftnavheader"/>
							</div>
							<div class="navigation">
								<div class="leftnavbarhead">Solutions</div>
								<div class="leftnavbarlinks">
									<xsl:for-each select="//masterServiceLine">
										<p>
											<xsl:variable name="uri" select="concat ('./Capabilities/',@shortName,'.htm')"/>
											<a href="{$uri}">
												<xsl:value-of select="masterServiceLineName"/>
											</a>
										</p>
									</xsl:for-each>
								</div>
								<!-- ROR BUTTON BEGIN
								<a href="ror.xml">
									<img src="http://www.rorweb.com/rorinfo.gif" width="80" height="15" border="0" alt="ROR"/>
								</a>
								ROR BUTTON END -->
							</div>
						</div>
						<div class="right">
							<div class="navbar">
								<div class="navbarbutton">
									<a class="youarehere" href="./index.htm">Home</a>
								</div>
								<div class="navbarbutton">
									<a href="./Capabilities/index.htm">Solutions</a>
								</div>
								<div class="navbarbutton">
									<a href="./Cases/index.htm">Projects</a>
								</div>
								<div class="navbarbutton">
									<a href="./Articles/index.htm">Articles</a>
								</div>
								<div class="navbarbutton">
									<a href="./Resources/index.htm">Resources</a>
								</div>
							</div>
							<div class="content">
								<p align="center" class="title">Treadwell Media Group</p>
								<xsl:apply-templates/>
							</div>
							<div class="pagefooter">
								<xsl:copy-of select="$footer"/>
							</div>
						</div>
						<div class="brclear">
							<p/>
						</div>
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<!--	
	     Service Line index page
-->
	<xsl:template match="services">
		<xsl:variable name="uri" select="'///Q:/Treadwell Media Group/TMG Site/Capabilities/index.htm'"/>
		<xsl:result-document href="{$uri}">
			<html>
				<head>
					<title>Treadwell Media Group - Capabilities</title>
					<meta name="Description" content="Consulting services for the book publishing industry"/>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
					<meta name="Keywords" content="Book Consulting, Publishing, Packaging, Custom Publishing, TMG"/>
				</head>
				<body bgcolor="#666666">
					<div class="allbody" id="top">
						<div class="banner">
							<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
						</div>
						<div class="subhead">
							Innovative publishing solutions.
						</div>
						<div class="left">
							<div class="searchbar">
								<xsl:copy-of select="$leftnavheader"/>
							</div>
							<div class="navigation">
								<div class="leftnavbarhead">Solutions</div>
								<div class="leftnavbarlinks">
									<xsl:for-each select="//masterServiceLine">
										<p>
											<xsl:variable name="uri" select="concat ('../Capabilities/',@shortName,'.htm')"/>
											<a href="{$uri}">
												<xsl:value-of select="masterServiceLineName"/>
											</a>
										</p>
									</xsl:for-each>
								</div>
							</div>
						</div>
						<div class="right">
							<div class="navbar">
								<div class="navbarbutton">
									<a href="../index.htm">Home</a>
								</div>
								<div class="navbarbutton">
									<a href="../Capabilities/index.htm" class="youarehere">Solutions</a>
								</div>
								<div class="navbarbutton">
									<a href="../Cases/index.htm">Projects</a>
								</div>
								<div class="navbarbutton">
									<a href="../Articles/index.htm">Articles</a>
								</div>
								<div class="navbarbutton">
									<a href="../Resources/index.htm">Resources</a>
								</div>
							</div>
							<div class="content">
								<p class="title">Capabilities include:</p>
								<ul>
									<xsl:for-each select="//masterServiceLine">
										<li>
											<xsl:variable name="uri" select="concat (@shortName,'.htm')"/>
											<a href="{$uri}">
												<b>
													<xsl:value-of select="masterServiceLineName"/>:</b>
											</a>
											<xsl:value-of select="articleHeader/description"/>
										</li>
									</xsl:for-each>
								</ul>
							</div>
							<div class="pagefooter">
								<xsl:copy-of select="$footer"/>
							</div>
						</div>
						<div class="brclear">
							<p/>
						</div>
					</div>
				</body>
			</html>
		</xsl:result-document>
		<xsl:apply-templates/>
	</xsl:template>
	<!--	
	    Master Service Line pages
-->
	<xsl:template match="masterServiceLine">
		<xsl:variable name="uri" select="concat ('///Q:/Treadwell Media Group/TMG Site/Capabilities/', @shortName, '.htm')"/>
		<xsl:result-document href="{$uri}">
			<html>
				<head>
					<title>Treadwell Media Group - Capabilities - <xsl:value-of select="masterServiceLineName"/>
					</title>
					<meta name="Description">
						<xsl:attribute name="content">Treadwell Media Group, <xsl:value-of select="masterServiceLineName"/> services for the book publishing industry</xsl:attribute>
					</meta>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
					<meta name="Keywords">
						<xsl:attribute name="content"><xsl:value-of select="articleHeader/subject"/></xsl:attribute>
					</meta>
				</head>
				<body bgcolor="#666666">
					<div class="allbody" id="top">
						<div class="banner">
							<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
						</div>
						<div class="subhead">
							Innovative publishing solutions.
						</div>
						<div class="left">
							<div class="searchbar">
								<xsl:copy-of select="$leftnavheader"/>
							</div>
							<div class="navigation">
								<div class="leftnavbarhead">Solutions</div>
								<div class="leftnavbarlinks">
									<xsl:for-each select="//masterServiceLine">
										<p>
											<xsl:variable name="uri" select="concat ('../Capabilities/',@shortName,'.htm')"/>
											<a href="{$uri}">
												<xsl:value-of select="masterServiceLineName"/>
											</a>
										</p>
									</xsl:for-each>
								</div>
							</div>
						</div>
						<div class="right">
							<div class="navbar">
								<div class="navbarbutton">
									<a href="../index.htm">Home</a>
								</div>
								<div class="navbarbutton">
									<a href="../Capabilities/index.htm" class="youarehere">Solutions</a>
								</div>
								<div class="navbarbutton">
									<a href="../Cases/index.htm">Projects</a>
								</div>
								<div class="navbarbutton">
									<a href="../Articles/index.htm">Articles</a>
								</div>
								<div class="navbarbutton">
									<a href="../Resources/index.htm">Resources</a>
								</div>
							</div>
							<div class="content">
								<xsl:apply-templates/>
							</div>
							<div class="pagefooter">
								<xsl:copy-of select="$footer"/>
							</div>
						</div>
						<div class="brclear">
							<p/>
						</div>
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<!--	
	   Projects master page
-->
	<xsl:template match="projects">
		<xsl:result-document href="///Q:/Treadwell Media Group/TMG Site/Cases/index.htm">
			<html>
				<head>
					<title>Treadwell Media Group - Projects</title>
					<meta name="Description" content="Consulting services for the publishing industry"/>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" media="all" href="../includes/tmg.css"/>
					<link rel="stylesheet" type="text/css" media="print" href="../includes/print.css"/>
					<meta name="Keywords">
						<xsl:attribute name="content">Treadwell Media Group, <xsl:for-each select="//project"><xsl:value-of select="projectType"/>, </xsl:for-each></xsl:attribute>
					</meta>
				</head>
				<body bgcolor="#666666">
					<div class="allbody" id="top">
						<div class="banner">
							<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
						</div>
						<div class="subhead">
							Innovative publishing solutions.
						</div>
						<div class="left">
							<div class="searchbar">
								<xsl:copy-of select="$leftnavheader"/>
							</div>
							<div class="navigation">
								<div class="leftnavbarhead">Projects by Category</div>
								<div class="leftnavbarlinks">
									<xsl:for-each select="//concept[@id=//project/category/@idref]">
										<xsl:sort select="@id" order="ascending"/>
										<p>
											<a>
												<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
												<xsl:value-of select="preferredLabel"/>
											</a>
										</p>
									</xsl:for-each>
								</div>
							</div>
						</div>
						<div class="right">
							<div class="navbar">
								<div class="navbarbutton">
									<a href="../index.htm">Home</a>
								</div>
								<div class="navbarbutton">
									<a href="../Capabilities/index.htm">Solutions</a>
								</div>
								<div class="navbarbutton">
									<a href="../Cases/index.htm" class="youarehere">Projects</a>
								</div>
								<div class="navbarbutton">
									<a href="../Articles/index.htm">Articles</a>
								</div>
								<div class="navbarbutton">
									<a href="../Resources/index.htm">Resources</a>
								</div>
							</div>
							<div class="content">
								<p class="title">Projects</p>
								<p>For a list of projects in each category, click on the appropriate link below.</p>
								<ul>
									<xsl:for-each select="//concept[@id=//project/category/@idref]">
										<xsl:sort select="@id" order="ascending"/>
										<li>
											<a>
												<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
												<b>
													<xsl:value-of select="preferredLabel"/>: </b>
											</a>
											<xsl:value-of select="definition"/>
										</li>
									</xsl:for-each>
								</ul>
							</div>
							<div class="pagefooter">
								<xsl:copy-of select="$footer"/>
							</div>
						</div>
						<div class="brclear">
							<p/>
						</div>
					</div>
				</body>
			</html>
		</xsl:result-document>
		<!-- ***********************************Individual project pages *********************************************** -->
		<xsl:for-each select="project">
			<xsl:variable name="uri" select="concat ('///Q:/Treadwell Media Group/TMG Site/Cases/', @id, '.htm')"/>
			<xsl:result-document href="{$uri}">
				<html>
					<head>
						<title>Treadwell Media Group - Projects - <xsl:value-of select="projectType"/>
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
					<body bgcolor="#666666">
						<div class="allbody" id="top">
							<div class="banner">
								<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
							</div>
							<div class="subhead">
								Innovative publishing solutions.
							</div>
							<div class="left">
								<div class="searchbar">
									<xsl:copy-of select="$leftnavheader"/>
								</div>
								<div class="navigation">
									<div class="leftnavbarhead">Projects by Category</div>
									<div class="leftnavbarlinks">
										<xsl:for-each select="//concept[@id=//project/category/@idref]">
											<xsl:sort select="@id" order="ascending"/>
											<p>
												<a>
													<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
													<xsl:value-of select="preferredLabel"/>
												</a>
											</p>
										</xsl:for-each>
									</div>
								</div>
							</div>
							<div class="right">
								<div class="navbar">
									<div class="navbarbutton">
										<a href="../index.htm">Home</a>
									</div>
									<div class="navbarbutton">
										<a href="../Capabilities/index.htm">Solutions</a>
									</div>
									<div class="navbarbutton">
										<a href="../Cases/index.htm" class="youarehere">Projects</a>
									</div>
									<div class="navbarbutton">
										<a href="../Articles/index.htm">Articles</a>
									</div>
									<div class="navbarbutton">
										<a href="../Resources/index.htm">Resources</a>
									</div>
								</div>
								<div class="content">
									<p class="title">
										<xsl:value-of select="projectType"/>
									</p>
									<p>
										<xsl:value-of select="projectDescription"/>
									</p>
								</div>
								<div class="pagefooter">
									<xsl:copy-of select="$footer"/>
								</div>
							</div>
							<div class="brclear">
								<p/>
							</div>
						</div>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
		<!--  
********************  Projects by category pages (part of previous template) ************************

-->
		<xsl:for-each select="//concept[@id=//project/category/@idref]">
			<xsl:variable name="uri" select="concat ('///Q:/Treadwell Media Group/TMG Site/Cases/', @id, '.htm')"/>
			<xsl:variable name="concept">
				<xsl:value-of select="@id"/>
			</xsl:variable>
			<xsl:result-document href="{$uri}">
				<html>
					<head>
						<title>Treadwell Media Group - Projects - <xsl:value-of select="preferredLabel[parent::concept[@id=@idref]]"/>
						</title>
						<meta name="Description">
							<xsl:attribute name="content"><xsl:value-of select="definition[parent::concept[@id=@idref]]"/></xsl:attribute>
						</meta>
						<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
						<link rel="stylesheet" type="text/css" media="all" href="../includes/tmg.css"/>
						<link rel="stylesheet" type="text/css" media="print" href="../includes/print.css"/>
						<meta name="Keywords">
							<xsl:attribute name="content">Treadwell Media Group, <xsl:value-of select="preferredLabel[parent::concept[@id=@idref]]"/></xsl:attribute>
						</meta>
					</head>
					<body bgcolor="#666666">
						<div class="allbody" id="top">
							<div class="banner">
								<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
							</div>
							<div class="subhead">
								Innovative publishing solutions.
							</div>
							<div class="left">
								<div class="searchbar">
									<xsl:copy-of select="$leftnavheader"/>
								</div>
								<div class="navigation">
									<div class="leftnavbarhead">Projects by Category</div>
									<div class="leftnavbarlinks">
										<xsl:for-each select="//concept[@id=//project/category/@idref]">
											<xsl:sort select="@id" order="ascending"/>
											<p>
												<a>
													<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
													<xsl:value-of select="preferredLabel"/>
												</a>
											</p>
										</xsl:for-each>
									</div>
								</div>
							</div>
							<div class="right">
								<div class="navbar">
									<div class="navbarbutton">
										<a href="../index.htm">Home</a>
									</div>
									<div class="navbarbutton">
										<a href="../Capabilities/index.htm">Solutions</a>
									</div>
									<div class="navbarbutton">
										<a href="../Cases/index.htm" class="youarehere">Projects</a>
									</div>
									<div class="navbarbutton">
										<a href="../Articles/index.htm">Articles</a>
									</div>
									<div class="navbarbutton">
										<a href="../Resources/index.htm">Resources</a>
									</div>
								</div>
								<div class="content">
									<p class="title">
										<xsl:value-of select="preferredLabel"/>
									</p>
									<ul>
										<xsl:for-each select="//project[child::category[@idref=$concept]]">
											<li>
												<b>
													<xsl:value-of select="projectType"/>
												</b>: <xsl:value-of select="projectDescription"/>
											</li>
										</xsl:for-each>
									</ul>
								</div>
								<div class="pagefooter">
									<xsl:copy-of select="$footer"/>
								</div>
							</div>
							<div class="brclear">
								<p/>
							</div>
						</div>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<!--
		projectList on masterServiceLine pages
-->
	<xsl:template match="projectList">
		<xsl:variable name="category">
			<xsl:value-of select="ancestor::masterServiceLine/articleHeader/category/@idref"/>
		</xsl:variable>
		<ul>
			<xsl:for-each select="//project[child::category[@idref=$category]]">
				<xsl:sort select="@id" order="ascending"/>
				<li>
					<a>
						<xsl:attribute name="href">../Cases/<xsl:value-of select="@id"/>.htm</xsl:attribute>
						<xsl:value-of select="projectType"/>
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<!--	
	     Resources index page
-->
	<xsl:template match="resources">
		<xsl:variable name="uri" select="'///Q:/Treadwell Media Group/TMG Site/Resources/index.htm'"/>
		<xsl:result-document href="{$uri}">
			<html>
				<head>
					<title>Treadwell Media Group - Resources</title>
					<meta name="Description" content="Resource links for the book publishing industry"/>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
					<meta name="Keywords" content="Book Consulting, Treadwell Media Group, book publishing, eBooks, book distribution, Ken Brooks"/>
				</head>
				<body bgcolor="#666666">
					<div class="allbody" id="top">
						<div class="banner">
							<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
						</div>
						<div class="subhead">
							Innovative publishing solutions.
						</div>
						<div class="left">
							<div class="searchbar">
								<xsl:copy-of select="$leftnavheader"/>
							</div>
							<div class="navigation">
								<div class="leftnavbarhead">Resources by Category</div>
								<div class="leftnavbarlinks">
									<xsl:for-each select="//concept[@id=//resource/category/@idref]">
										<xsl:sort select="@id" order="ascending"/>
										<p>
											<a>
												<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
												<xsl:value-of select="preferredLabel"/>
											</a>
										</p>
									</xsl:for-each>
								</div>
							</div>
						</div>
						<div class="right">
							<div class="navbar">
								<div class="navbarbutton">
									<a href="../index.htm">Home</a>
								</div>
								<div class="navbarbutton">
									<a href="../Capabilities/index.htm">Solutions</a>
								</div>
								<div class="navbarbutton">
									<a href="../Cases/index.htm">Projects</a>
								</div>
								<div class="navbarbutton">
									<a href="../Articles/index.htm">Articles</a>
								</div>
								<div class="navbarbutton">
									<a href="../Resources/index.htm" class="youarehere">Resources</a>
								</div>
							</div>
							<div class="content">
								<p class="title">Resources</p>
								<p>For a list of resources in each category, click on the appropriate link below.</p>
								<ul>
									<xsl:for-each select="//concept[@id=//resource/category/@idref]">
										<xsl:sort select="@id" order="ascending"/>
										<li>
											<a>
												<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
												<xsl:value-of select="preferredLabel"/>
											</a>: <xsl:value-of select="definition"/>
										</li>
									</xsl:for-each>
								</ul>
							</div>
							<div class="pagefooter">
								<xsl:copy-of select="$footer"/>
							</div>
						</div>
						<div class="brclear">
							<p/>
						</div>
					</div>
				</body>
			</html>
		</xsl:result-document>
		<!--  
********************  Resource pages (part of previous template) ************************

-->
		<xsl:for-each select="//concept[@id=//resource/category/@idref]">
			<xsl:variable name="uri" select="concat ('///Q:/Treadwell Media Group/TMG Site/Resources/', @id, '.htm')"/>
			<xsl:variable name="concept">
				<xsl:value-of select="@id"/>
			</xsl:variable>
			<xsl:result-document href="{$uri}">
				<html>
					<head>
						<title>Treadwell Media Group - Resources - <xsl:value-of select="preferredLabel[parent::concept[@id=$concept]]"/>
						</title>
						<meta name="Description">
							<xsl:attribute name="content"><xsl:value-of select="preferredLabel[parent::concept[@id=$concept]]"/>: <xsl:value-of select="definition[parent::concept[@id=$concept]]"/></xsl:attribute>
						</meta>
						<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
						<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
						<meta name="Keywords">
							<xsl:attribute name="content"><xsl:for-each select="//resource[child::category[@idref=$concept]]"><xsl:sort select="resourceName" order="ascending"/><xsl:value-of select="resourceName"/>, </xsl:for-each>Treadwell Media Group, <xsl:value-of select="preferredLabel[parent::concept[@id=$concept]]"/></xsl:attribute>
						</meta>
					</head>
					<body bgcolor="#666666">
						<div class="allbody" id="top">
							<div class="banner">
								<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
							</div>
							<div class="subhead">
								Innovative publishing solutions.
							</div>
							<div class="left">
								<div class="searchbar">
									<xsl:copy-of select="$leftnavheader"/>
								</div>
								<div class="navigation">
									<div class="leftnavbarhead">Resources by Category</div>
									<div class="leftnavbarlinks">
										<xsl:for-each select="//concept[@id=//resource/category/@idref]">
											<xsl:sort select="@id" order="ascending"/>
											<p>
												<a>
													<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
													<xsl:value-of select="preferredLabel"/>
												</a>
											</p>
										</xsl:for-each>
									</div>
								</div>
							</div>
							<div class="right">
								<div class="navbar">
									<div class="navbarbutton">
										<a href="../index.htm">Home</a>
									</div>
									<div class="navbarbutton">
										<a href="../Capabilities/index.htm">Solutions</a>
									</div>
									<div class="navbarbutton">
										<a href="../Cases/index.htm">Projects</a>
									</div>
									<div class="navbarbutton">
										<a href="../Articles/index.htm">Articles</a>
									</div>
									<div class="navbarbutton">
										<a href="../Resources/index.htm" class="youarehere">Resources</a>
									</div>
								</div>
								<div class="content">
									<p class="title">
										<xsl:value-of select="preferredLabel"/>
									</p>
									<ul>
										<xsl:for-each select="//resource[child::category[@idref=$concept]]">
											<xsl:sort select="resourceName" order="ascending"/>
											<li>
												<a target="popup">
													<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
													<xsl:value-of select="resourceName"/>
												</a>: <xsl:value-of select="resourceDescription"/>
											</li>
										</xsl:for-each>
									</ul>
								</div>
								<div class="pagefooter">
									<xsl:copy-of select="$footer"/>
								</div>
							</div>
							<div class="brclear">
								<p/>
							</div>
						</div>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<!--	
***************************  Taxonomy Index Page  **************************************************
-->
	<xsl:template match="categories">
		<xsl:variable name="uri" select="'///Q:/Treadwell Media Group/TMG Site/Taxonomy/index.htm'"/>
		<xsl:result-document href="{$uri}">
			<html>
				<head>
					<title>Treadwell Media Group - Publishing Taxonomy</title>
					<meta name="Description" content="Taxonomy and ontology for the book publishing industry"/>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
					<meta name="Keywords" content="publishing taxonomy, publishing ontology, Educational taxonomy, taxonomy, publishing, Treadwell Media Group, book publishing, eBooks, book distribution, Ken Brooks"/>
				</head>
				<body bgcolor="#666666">
					<div class="allbody" id="top">
						<div class="banner">
							<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
						</div>
						<div class="subhead">
							Innovative publishing solutions.
						</div>
						<div class="left">
							<div class="searchbar">
								<xsl:copy-of select="$leftnavheader"/>
							</div>
							<div class="navigation">
								<div class="leftnavbarhead">Item</div>
								<div class="leftnavbarlinks">
									<xsl:copy-of select="$taxonomyNav"/>
								</div>
							</div>
							<!-- <xsl:call-template name="taxonomyNav"/>-->
						</div>
						<div class="right">
							<div class="navbar">
								<div class="navbarbutton">
									<a href="../index.htm">Home</a>
								</div>
								<div class="navbarbutton">
									<a href="../Capabilities/index.htm">Solutions</a>
								</div>
								<div class="navbarbutton">
									<a href="../Cases/index.htm">Projects</a>
								</div>
								<div class="navbarbutton">
									<a href="../Articles/index.htm">Articles</a>
								</div>
								<div class="navbarbutton">
									<a href="../Resources/index.htm">Resources</a>
								</div>
							</div>
							<div class="content">
								<p class="title">Publishing Industry Taxonomy</p>
								<p>The terms below represent the top level of the Treadwell Media Group publishing industry taxonomy. For an alphabetized list, use the navigation bar on the left.</p>
								<p>This taxonomy will continue to be enhanced over time and will be the anchor of many new features on the Treadwell Media Group site.</p>
								<ul>
									<!-- add not(use) to this xpath -->
									<xsl:for-each select="concept[not(child::bt)][not(child::use)][child::nt]">
										<xsl:sort select="upper-case(preferredLabel)" order="ascending"/>
										<li>
											<a>
												<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
												<b>
													<xsl:value-of select="preferredLabel"/>
												</b>
											</a>: <xsl:value-of select="definition"/>
										</li>
									</xsl:for-each>
								</ul>
							</div>
							<div class="pagefooter">
								<xsl:copy-of select="$footer"/>
							</div>
						</div>
						<div class="brclear">
							<p/>
						</div>
					</div>
				</body>
			</html>
		</xsl:result-document>
		<!--	
***************************  Alpha taxonomy pages  (part of preceding template) ***************************************
-->
		<xsl:for-each-group select="//concept" group-by="upper-case(substring(@id,1,1))">
			<xsl:sort select="current-grouping-key()"/>
			<xsl:variable name="current-letter" select="current-grouping-key()"/>
			<xsl:variable name="uri" select="concat ('///Q:/Treadwell Media Group/TMG Site/Taxonomy/', $current-letter,'-taxonomy', '.htm')"/>
			<xsl:result-document href="{$uri}">
				<html>
					<head>
						<title>Treadwell Media Group - Publishing Taxonomy - 
						</title>
						<meta name="Description">
							<xsl:attribute name="content"><xsl:value-of select="$current-letter"/></xsl:attribute>
						</meta>
						<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
						<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
						<meta name="Keywords">
							<xsl:attribute name="content">Treadwell Media Group, Publishing Taxonomy, <xsl:value-of select="$current-letter"/></xsl:attribute>
						</meta>
					</head>
					<body bgcolor="#666666">
						<div class="allbody" id="top">
							<div class="banner">
								<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
							</div>
							<div class="subhead">
								Innovative publishing solutions.
							</div>
							<div class="left">
								<div class="searchbar">
									<xsl:copy-of select="$leftnavheader"/>
								</div>
								<div class="navigation">
									<div class="leftnavbarhead">Item</div>
									<div class="leftnavbarlinks">
										<xsl:copy-of select="$taxonomyNav"/>
										<!-- <xsl:call-template name="taxonomyNav"/>-->
									</div>
								</div>
							</div>
							<div class="right">
								<div class="navbar">
									<div class="navbarbutton">
										<a href="../index.htm">Home</a>
									</div>
									<div class="navbarbutton">
										<a href="../Capabilities/index.htm">Solutions</a>
									</div>
									<div class="navbarbutton">
										<a href="../Cases/index.htm">Projects</a>
									</div>
									<div class="navbarbutton">
										<a href="../Articles/index.htm">Articles</a>
									</div>
									<div class="navbarbutton">
										<a href="../Resources/index.htm">Resources</a>
									</div>
								</div>
								<div class="content">
									<p class="title">
										<xsl:value-of select="$current-letter"/>
									</p>
									<ul>
										<xsl:for-each select="//concept[upper-case(substring(@id,1,1)) = $current-letter]">
											<xsl:sort select="upper-case(@id)"/>
											<li>
												<a>
													<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
													<b>
														<xsl:value-of select="preferredLabel"/>
													</b>
												</a>: 
								<xsl:choose>
													<xsl:when test="not(use)">
														<xsl:value-of select="definition"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:variable name="idref">
															<xsl:value-of select="use/@idref"/>
														</xsl:variable>
										see <a>
															<xsl:attribute name="href"><xsl:value-of select="$idref"/>.htm</xsl:attribute>
															<xsl:value-of select="//concept[@id=$idref]/preferredLabel"/>
														</a>
													</xsl:otherwise>
												</xsl:choose>
											</li>
										</xsl:for-each>
									</ul>
								</div>
								<div class="pagefooter">
									<xsl:copy-of select="$footer"/>
								</div>
							</div>
							<div class="brclear">
								<p/>
							</div>
						</div>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each-group>
		<!--	
***************************  Concept pages  (part of preceding template ***************************************
-->
		<xsl:for-each select="concept">
			<xsl:variable name="uri" select="concat ('///Q:/Treadwell Media Group/TMG Site/Taxonomy/', @id, '.htm')"/>
			<xsl:variable name="conceptid" select="@id"/>
			<xsl:variable name="narrowerTerms">
				<xsl:for-each select="nt">
					<xsl:variable name="idref">
						<xsl:value-of select="@idref"/>
					</xsl:variable>
					<xsl:value-of select="//concept[@id=$idref]/preferredLabel"/>,
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="broaderTerms">
				<xsl:for-each select="bt">
					<xsl:variable name="idref">
						<xsl:value-of select="@idref"/>
					</xsl:variable>
					<xsl:value-of select="//concept[@id=$idref]/preferredLabel"/>,
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="relatedTerms">
				<xsl:for-each select="rt">
					<xsl:variable name="idref">
						<xsl:value-of select="@idref"/>
					</xsl:variable>
					<xsl:value-of select="//concept[@id=$idref]/preferredLabel"/>,
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="siblingTerms">
				<xsl:for-each select="bt">
					<xsl:sort select="preferredLabel" order="ascending"/>
					<xsl:variable name="idref">
						<xsl:value-of select="@idref"/>
					</xsl:variable>
					<xsl:for-each select="//concept[child::bt[@idref=$idref]]">
						<xsl:sort select="preferredLabel" order="ascending"/>
						<xsl:value-of select="preferredLabel"/>,
					</xsl:for-each>
				</xsl:for-each>
			</xsl:variable>
			<xsl:result-document href="{$uri}">
				<html>
					<head>
						<title>Treadwell Media Group - Publishing Taxonomy - <xsl:value-of select="preferredLabel"/>
						</title>
						<meta name="Description">
							<xsl:attribute name="content"><xsl:value-of select="preferredLabel"/>, <xsl:value-of select="definition"/></xsl:attribute>
						</meta>
						<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
						<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
						<meta name="Keywords">
							<xsl:attribute name="content">Treadwell Media Group, Publishing Taxonomy, <xsl:value-of select="preferredLabel"/>, <xsl:value-of select="translate($broaderTerms,'&#xA;','')"/>, <xsl:value-of select="translate($narrowerTerms,'&#xA;','')"/>, <xsl:value-of select="translate($relatedTerms,'&#xA;','')"/>, <xsl:value-of select="translate($siblingTerms,'&#xA;','')"/></xsl:attribute>
						</meta>
					</head>
					<body bgcolor="#666666">
						<div class="allbody" id="top">
							<div class="banner">
								<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
							</div>
							<div class="subhead">
								Innovative publishing solutions.
							</div>
							<div class="left">
								<div class="searchbar">
									<xsl:copy-of select="$leftnavheader"/>
								</div>
								<div class="navigation">
									<div class="leftnavbarhead">Item</div>
									<div class="leftnavbarlinks">
										<xsl:copy-of select="$taxonomyNav"/>
										<!-- <xsl:call-template name="taxonomyNav"/> -->
									</div>
								</div>
							</div>
							<div class="right">
								<div class="navbar">
									<div class="navbarbutton">
										<a href="../index.htm">Home</a>
									</div>
									<div class="navbarbutton">
										<a href="../Capabilities/index.htm">Solutions</a>
									</div>
									<div class="navbarbutton">
										<a href="../Cases/index.htm">Projects</a>
									</div>
									<div class="navbarbutton">
										<a href="../Articles/index.htm">Articles</a>
									</div>
									<div class="navbarbutton">
										<a href="../Resources/index.htm">Resources</a>
									</div>
								</div>
								<div class="content">
									<p class="title">
										<xsl:value-of select="preferredLabel"/>
									</p>
									<p>
										<xsl:choose>
											<xsl:when test="not(use)">
												<xsl:value-of select="definition"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:variable name="idref">
													<xsl:value-of select="use/@idref"/>
												</xsl:variable>
										see <a>
													<xsl:attribute name="href"><xsl:value-of select="$idref"/>.htm</xsl:attribute>
													<xsl:value-of select="//concept[@id=$idref]/preferredLabel"/>
												</a>
											</xsl:otherwise>
										</xsl:choose>
									</p>
									<hr/>
									<xsl:if test="bt">
										<p>Sibling (including current) terms:
								<ul>
												<xsl:for-each select="bt">
													<xsl:sort select="preferredLabel" order="ascending"/>
													<xsl:variable name="idref">
														<xsl:value-of select="@idref"/>
													</xsl:variable>
													<xsl:for-each select="//concept[child::bt[@idref=$idref]]">
														<xsl:sort select="preferredLabel" order="ascending"/>
														<li>
															<a>
																<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
																<xsl:value-of select="preferredLabel"/>
															</a>
														</li>
													</xsl:for-each>
												</xsl:for-each>
											</ul>
										</p>
									</xsl:if>
									<xsl:if test="bt">
										<p>Broader terms:
									<ul>
												<xsl:for-each select="bt">
													<xsl:variable name="idref">
														<xsl:value-of select="@idref"/>
													</xsl:variable>
													<li>
														<a>
															<xsl:attribute name="href"><xsl:value-of select="@idref"/>.htm</xsl:attribute>
															<xsl:value-of select="//concept[@id=$idref]/preferredLabel"/>
														</a>
													</li>
												</xsl:for-each>
											</ul>
										</p>
									</xsl:if>
									<xsl:if test="nt">
										<p>Narrower terms:
									<ul>
												<xsl:for-each select="nt">
													<xsl:variable name="idref">
														<xsl:value-of select="@idref"/>
													</xsl:variable>
													<li>
														<a>
															<xsl:attribute name="href"><xsl:value-of select="@idref"/>.htm</xsl:attribute>
															<xsl:value-of select="//concept[@id=$idref]/preferredLabel"/>
														</a>
													</li>
												</xsl:for-each>
											</ul>
										</p>
									</xsl:if>
									<xsl:if test="//resource[child::category[@idref=$conceptid]]">
										<hr/>
										<h2>Resources</h2>
										<ul>
											<xsl:for-each select="//resource[child::category[@idref=$conceptid]]">
												<xsl:sort select="resourceName" order="ascending"/>
												<li>
													<a target="_blank">
														<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
														<xsl:value-of select="resourceName"/>
													</a>
													<xsl:if test="resourceDescription">: </xsl:if>
													<xsl:value-of select="resourceDescription"/>
												</li>
											</xsl:for-each>
										</ul>
									</xsl:if>
									<xsl:if test="//article[descendant::category[@idref=$conceptid]]">
										<hr/>
										<h2>Articles</h2>
										<ul>
											<xsl:for-each select="//article[descendant::category[@idref=$conceptid]]">
												<xsl:sort select="articleHeader/articleTitle" order="ascending"/>
												<xsl:variable name="uri" select="articleHeader/xrefURL/@href"/>
												<li>
													<a target="_blank" href="{$uri}">
														<xsl:value-of select="articleHeader/articleTitle"/>
													</a>: 
												<xsl:value-of select="articleHeader/description"/>
												</li>
											</xsl:for-each>
										</ul>
									</xsl:if>
									<hr/>
									<h2>Experimental: Related term search on Google</h2>
									<form method="get" action="http://www.google.com/search" target="_blank">
										<div style="border:1px solid black;padding:4px;width:20em;">
											<table border="0" cellpadding="0">
												<tr>
													<td>
														<input type="text" name="as_q" size="25" maxlength="255"/>
														<input type="submit" value="Google Search"/>
													</td>
												</tr>
												<tr>
													<td align="left" style="font-size:75%">
														<input type="checkbox" name="as_sitesearch" value="www.treadwellmedia.com"/> only search Treadwell Media
										</td>
												</tr>
												<tr>
													<td align="left" style="font-size:75%">
														<input type="checkbox" name="as_q" value="{$narrowerTerms}"/> add narrower terms
										</td>
												</tr>
												<tr>
													<td align="left" style="font-size:75%">
														<input type="checkbox" name="as_q" value="{$broaderTerms}"/> add broader terms
										</td>
												</tr>
												<tr>
													<td align="left" style="font-size:75%">
														<input type="checkbox" name="as_q" value="{$relatedTerms}"/> add related terms
										</td>
												</tr>
												<tr>
													<td align="left" style="font-size:75%">
														<input type="checkbox" name="as_q" value="{$siblingTerms}"/> add sibling terms
										</td>
												</tr>
											</table>
										</div>
									</form>
								</div>
								<div class="pagefooter">
									<xsl:copy-of select="$footer"/>
								</div>
							</div>
							<div class="brclear">
								<p/>
							</div>
						</div>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="nest">
		<xsl:param name="id"/>
		<xsl:for-each select="//concept[child::bt[@idref=$id]]">
			<xsl:sort select="@seq" order="ascending"/>
			<xsl:sort select="preferredLabel" order="ascending"/>
			<li>
				<b>
					<xsl:value-of select="preferredLabel"/>
				</b>: <xsl:value-of select="definition"/>
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
	<!--  
***************************  Taxonomy Nav  ********************
-->
	<xsl:template name="taxonomyNav">
		<p>
			<b>Taxonomy</b>
		</p>
		<ul>
			<xsl:for-each select="//concept[not(child::bt)]">
				<xsl:sort select="@seq" order="ascending"/>
				<xsl:sort select="preferredLabel" order="ascending"/>
				<li>
					<a>
						<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
						<xsl:value-of select="preferredLabel"/>
					</a>
					<ul>
						<xsl:call-template name="nestNoDefs">
							<xsl:with-param name="id">
								<xsl:value-of select="@id"/>
							</xsl:with-param>
						</xsl:call-template>
					</ul>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template name="nestNoDefs">
		<xsl:param name="id"/>
		<xsl:for-each select="//concept[child::bt[@idref=$id]]">
			<xsl:sort select="@seq" order="ascending"/>
			<xsl:sort select="preferredLabel" order="ascending"/>
			<li>
				<a>
					<xsl:attribute name="href"><xsl:value-of select="@id"/>.htm</xsl:attribute>
					<xsl:value-of select="preferredLabel"/>
				</a>
				<ul>
					<xsl:call-template name="nestNoDefs">
						<xsl:with-param name="id">
							<xsl:value-of select="@id"/>
						</xsl:with-param>
					</xsl:call-template>
				</ul>
			</li>
		</xsl:for-each>
	</xsl:template>
	<!--	
	     Articles index page
-->
	<xsl:template match="articles">
		<xsl:variable name="uri" select="'///Q:/Treadwell Media Group/TMG Site/Articles/index.htm'"/>
		<xsl:result-document href="{$uri}">
			<html>
				<head>
					<title>Treadwell Media Group - Articles</title>
					<meta name="Description" content="Consulting services for the book publishing industry"/>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
					<meta name="Keywords" content="Book Consulting, TMG"/>
				</head>
				<body bgcolor="#666666">
					<div class="allbody">
						<div class="banner">
							<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
						</div>
						<div class="subhead">
							Innovative publishing solutions.
						</div>
						<div class="left">
							<div class="searchbar">
								<xsl:copy-of select="$leftnavheader"/>
							</div>
							<div class="navigation">
								<div class="leftnavbarhead">Articles</div>
								<div class="leftnavbarlinks">
									<xsl:for-each select="//article/articleHeader">
										<p>
											<xsl:variable name="uri" select="xrefURL/@href"/>
											<a href="{$uri}">
												<xsl:value-of select="articleTitle"/>
											</a>
										</p>
									</xsl:for-each>
								</div>
							</div>
						</div>
						<div class="right">
							<div class="navbar">
								<div class="navbarbutton">
									<a href="../index.htm">Home</a>
								</div>
								<div class="navbarbutton">
									<a href="../Capabilities/index.htm">Solutions</a>
								</div>
								<div class="navbarbutton">
									<a href="../Cases/index.htm">Projects</a>
								</div>
								<div class="navbarbutton">
									<a href="../Articles/index.htm" class="youarehere">Articles</a>
								</div>
								<div class="navbarbutton">
									<a href="../Resources/index.htm">Resources</a>
								</div>
							</div>
							<div class="content">
								<p class="title">Articles:</p>
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
							<div class="pagefooter">
								<xsl:copy-of select="$footer"/>
							</div>
						</div>
						<div class="brclear">
							<p/>
						</div>
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<!--
		clientName mapping
	-->
	<xsl:template match="clientName"/>
	<!--
		clientProperty mapping
	-->
	<xsl:template match="clientProperty"/>
	<!--
		clientType mapping
	-->
	<xsl:template match="clientType">
		<h1 class="{name()}">Client: <xsl:apply-templates/>
		</h1>
	</xsl:template>
	<!--
		projectDescription mapping
	-->
	<xsl:template match="projectDescription">
		<p class="{name()}">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!--	
	    serviceLine mapping
	-->
	<xsl:template match="serviceLine">
		<div class="{name()}">
			<xsl:attribute name="id"><xsl:choose><xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when><xsl:otherwise><xsl:value-of select="generate-id()"/></xsl:otherwise></xsl:choose></xsl:attribute>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<!--
		title mapping
	-->
	<xsl:template match="masterServiceLineName | analysisName">
		<p class="title">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!--BIOGRAPHY ELEMENTS -->
	<!--	
	    Biographies page
	-->
	<xsl:template match="biographies">
		<xsl:result-document href="///Q:/Treadwell Media Group/TMG Site/Bios/index.htm">
			<html>
				<head>
					<title>Treadwell Media Group - Consultant Biographies</title>
					<meta name="Description" content="Consulting services for the book publishing industry"/>
					<meta http-equiv="Content-type" content="text/html; charset=UTF-8;"/>
					<link rel="stylesheet" type="text/css" href="../includes/tmg.css"/>
					<meta name="Keywords" content="Book Consulting, Publishing, Packaging, Custom Publishing, TMG"/>
				</head>
				<body bgcolor="#666666">
					<div class="allbody" id="top">
						<div class="banner">
							<img src="../includes/TMG_banner.jpg" width="863" height="125" border="0" alt="Treadwell banner"/>
						</div>
						<div class="subhead">
							Innovative publishing solutions.
						</div>
						<div class="left">
							<div class="searchbar">
								<xsl:copy-of select="$leftnavheader"/>
							</div>
							<div class="navigation">
								<div class="leftnavbarhead">Item</div>
								<div class="leftnavbarlinks">
									<p>item 1</p>
									<p>item 2</p>
								</div>
							</div>
						</div>
						<div class="right">
							<div class="navbar">
								<div class="navbarbutton">
									<a href="../index.htm">Home</a>
								</div>
								<div class="navbarbutton">
									<a href="../Capabilities/index.htm">Solutions</a>
								</div>
								<div class="navbarbutton">
									<a href="../Cases/index.htm">Projects</a>
								</div>
								<div class="navbarbutton">
									<a href="../Articles/index.htm">Articles</a>
								</div>
								<div class="navbarbutton">
									<a href="../Resources/index.htm">Resources</a>
								</div>
							</div>
							<div class="content">
								<p class="title">Biographies</p>
								<xsl:apply-templates/>
							</div>
							<div class="pagefooter">
								<xsl:copy-of select="$footer"/>
							</div>
						</div>
						<div class="brclear">
							<p/>
						</div>
					</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<!--
		biography mapping
-->
	<xsl:template match="biography">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!--
		name mapping
-->
	<xsl:template match="name">
		<span>
			<font size="+1">
				<b>
					<xsl:apply-templates/>
				</b>
				<br/>
			</font>
		</span>
	</xsl:template>
	<!--
		title mapping
-->
	<xsl:template match="title">
		<span>
			<b>
				<xsl:apply-templates/>
			</b>
			<br/>
		</span>
	</xsl:template>
	<!--
		biodescription mapping
-->
	<xsl:template match="biodescription">
		<span>
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--SERVICE LINE ELEMENTS -->
	<!--
		serviceLineName mapping
-->
	<xsl:template match="serviceLineName">
		<h2 class="{name()}">
			<xsl:apply-templates/>
		</h2>
	</xsl:template>
	<!--
		suppress article header information in service line pages
	-->
	<xsl:template match="masterServiceLine//articleHeader"/>
	<!--
		seviceLineDescription mapping
	-->
	<xsl:template match="serviceLineDescription">
		<xsl:apply-templates/>
	</xsl:template>
	<!--
		xrefInternal mapping
	-->
	<xsl:template match="xrefInternal">
		<xsl:variable name="uri" select="concat (@xref, '.htm')"/>
		<a href="{$uri}" target="popup">
			<xsl:apply-templates/>
		</a>
	</xsl:template>
	<!--
		xrefURL mapping
	-->
	<xsl:template match="xrefURL">
		<xsl:variable name="href" select="@href"/>
		<a href="{$href}" target="popup">
			<xsl:apply-templates/>
		</a>
	</xsl:template>
	<!--
		P mapping
-->
	<xsl:template match="activity | benefit | issue | description | listItem">
		<li class="{name()}">
			<xsl:apply-templates/>
		</li>
	</xsl:template>
	<xsl:template match="listItem">
		<li>
			<xsl:apply-templates/>
		</li>
	</xsl:template>
	<!--
		italic mapping
	-->
	<xsl:template match="italic">
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:template>
	<!--
		bold mapping
	-->
	<xsl:template match="bold">
		<b>
			<xsl:apply-templates/>
		</b>
	</xsl:template>
	<!--
		underline mapping
	-->
	<xsl:template match="underline">
		<u>
			<xsl:apply-templates/>
		</u>
	</xsl:template>
	<!--
		SPAN mapping
	-->
	<xsl:template match="zzz">
		<span class="{name()}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--
		H3 mapping
	-->
	<xsl:template match="xxx">
		<h3 class="{name()}">
			<xsl:apply-templates/>
		</h3>
	</xsl:template>
	<!--
		P mapping
	-->
	<xsl:template match="para">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!--
		bl mapping
	-->
	<xsl:template match="bulletList | unOrderedList">
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
</xsl:stylesheet>
