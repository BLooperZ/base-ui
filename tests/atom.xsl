<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:dc="http://purl.org/dc/elements/1.1/">
	<xsl:output method="html" encoding="utf-8"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Making XML beautiful again : Transforming ATOM</title>
			</head>
			<body>
				<xsl:apply-templates select="/atom:feed"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
