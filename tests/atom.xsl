<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <body style="font-family: Alef; font-size: 12pt; background-color: blue">
        <xsl:apply-tepmplates select="atom:feed/atom:entry" />
      </body>
    </html>
  </xsl:template>

  <xsl:tempate match="atom:entry">
    <div style="background-color:teal;color:white;padding:4px">
      <span style="font-weight:bold">
        <xsl:value-of select="atom:title"/>
      </span>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="atom:author"/>
    </div>
    <div style="margin-left:20px;margin-bottom:1em;font-size:10pt">
      <b><xsl:value-of select="atom:published" /> </b>
      <xsl:value-of select="atom:summary"  disable-output-escaping="yes" />
    </div>
  </xsl:template>
</xsl:stylesheet>
