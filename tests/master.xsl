---
---
<?xml version="1.0" encoding="{{ site.encoding }}" ?>
<!--
	HTML5 Boilerplate XSLT Master Stylesheet (based on Paul Irish's HTML5 Boilerplate index.html file)
	Created by Brian Zerangue on 2010-11-15.
	Copyright (c) 2010 Paul Irish (Everything but the XSLT), Brian Zerangue (XSLT).
        HTML5 Boilerplate, http://html5boilerplate.com
-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom"
                xmlns:xhtml="http://www.w3.org/1999/xhtml">

	<xsl:output doctype-public="html"
                encoding="{{ site.encoding }}"
				indent="yes"
				method="html"
				media-type="text/html"
				omit-xml-declaration="yes"
				doctype-system="about:legacy-compat"/>

	<xsl:template match="atom:feed">
		<html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="no-js">

			<head>
              {% for header in site.data.h5bp.meta.headers %}
              <meta http-equiv="{{ header[0] }}" content="{{header[1] | join: ', ' }}"/>
              {% endfor %}
              <title><xsl:value-of select="atom:title"/></title>
              <meta name="author" content="{{ site.github.owner_name }}"/>
              <meta name="description" content="{{ site.github.project_tagline }}"/>
              <meta name="generator" content="{atom:generator}"/>

              <xsl:if test="atom:link[@rel='self']">
                <link rel="alternate" href="{atom:link[@rel='self']/@uri}"
                      title="{atom:title}" type="{atom:link[@rel='self']/@type}"/>
              </xsl:if>

			</head>

			<body>

              <xsl:text>&#10;</xsl:text>
              <h1><xsl:value-of select="atom:title"/></h1>

              <xsl:text>&#10;&#10;</xsl:text>
              <div id="body">
                <xsl:apply-templates select="atom:entry"/>
                <xsl:text>&#10;&#10;</xsl:text>
              </div>

              <xsl:text>&#10;&#10;</xsl:text>
              <h1>Subscriptions</h1>

              <xsl:text>&#10;</xsl:text>
              <div id="sidebar">

                <xsl:text>&#10;&#10;</xsl:text>
                <h2>Info</h2>

                <dl>
                  <dt>Last updated:</dt>
                  <dd>
                    <span class="date" title="GMT">
                      <xsl:value-of select="atom:updated/@planet:format"/>
                    </span>
                  </dd>
                  <dt>Powered by:</dt>
                  <dd>
                    <a href="http://intertwingly.net/code/venus/">
                      <img src="images/venus.png" width="80" height="15"
                           alt="Venus" border="0"/>
                    </a>
                  </dd>
                  <dt>Export:</dt>
                  <dd>
                    <ul>
                      <li>
                        <a href="opml.xml">
                          <img src="images/opml.png" alt="OPML"/>
                        </a>
                      </li>
                      <li>
                        <a href="foafroll.xml">
                          <img src="images/foaf.png" alt="FOAF"/>
                        </a>
                      </li>
                    </ul>
                  </dd>
                </dl>

              </div>

              <xsl:text>&#10;</xsl:text>
              <div id="footer">

                <xsl:text>&#10;&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
                <ul>
                  <xsl:for-each select="planet:source">
                    <xsl:sort select="planet:name"/>
                    <xsl:text>&#10;</xsl:text>
                    <li>
                      <a href="{atom:link[@rel='alternate']/@href}">
                        <xsl:value-of select="planet:name"/>
                      </a>
                    </li>
                  </xsl:for-each>
                  <xsl:text>&#10;</xsl:text>
                </ul>
              </div>

              {% if site.google_analytics %}
			  <script>
			   <![CDATA[(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', '{{ site.google_analytics }}', 'auto');
        ga('send', 'pageview');]]>
			  </script>
              {% endif %}

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

<xsl:template match="atom:entry">
    <!-- date header -->
    <xsl:variable name="date" select="substring(atom:updated,1,10)"/>
    <xsl:if test="not(preceding-sibling::atom:entry
      [substring(atom:updated,1,10) = $date])">
      <xsl:text>&#10;&#10;</xsl:text>
      <h2 class="date">
        <xsl:value-of select="substring-before(atom:updated/@planet:format,', ')"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="substring-before(substring-after(atom:updated/@planet:format,', '), ' ')"/>
      </h2>
    </xsl:if>

    <xsl:text>&#10;&#10;</xsl:text>
    <div class="news">

      <xsl:if test="@xml:lang">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="@xml:lang"/>
        </xsl:attribute>
      </xsl:if>

      <!-- entry title -->
      <xsl:text>&#10;</xsl:text>
      <h3>
        <xsl:if test="atom:source/atom:icon">
          <img src="{atom:source/atom:icon}" class="icon"/>
        </xsl:if>
        <a href="{atom:source/atom:link['alternate']/@href}" class="icon">
          <xsl:attribute name="title" select="{atom:source/atom:title}"/>
          <xsl:value-of select="atom:source/planet:name"/>
        </a>
        <xsl:if test="string-length(atom:title) &gt; 0">
          <xsl:text>&#x2014;</xsl:text>
          <a href="{atom:link[@rel='alternate']/@href}">
            <xsl:if test="atom:title/@xml:lang != @xml:lang">
              <xsl:attribute name="xml:lang" select="{atom:title/@xml:lang}"/>
            </xsl:if>
            <xsl:value-of select="atom:title"/>
          </a>
        </xsl:if>
      </h3>

      <!-- entry content -->
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates select="planet:excerpt"/>

      <!-- entry footer -->
      <xsl:text>&#10;</xsl:text>
      <div class="permalink">
        <a href="{atom:link[@rel='alternate']/@href}">
          <xsl:choose>
            <xsl:when test="atom:author/atom:name">
              <xsl:text>by </xsl:text>
              <xsl:value-of select="atom:author/atom:name"/>
              <xsl:text> at </xsl:text>
            </xsl:when>
            <xsl:when test="atom:source/atom:author/atom:name">
              <xsl:text>by </xsl:text>
              <xsl:value-of select="atom:source/atom:author/atom:name"/>
              <xsl:text> at </xsl:text>
            </xsl:when>
          </xsl:choose>
          <span class="date" title="GMT">
            <xsl:value-of select="atom:updated/@planet:format"/>
          </span>
        </a>
      </div>
    </div>

  </xsl:template>

  <!-- xhtml content -->
  <xsl:template match="planet:excerpt/xhtml:div">
    <xsl:copy>
      <xsl:if test="../@xml:lang and not(../@xml:lang = ../../@xml:lang)">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="../@xml:lang"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="class">content</xsl:attribute>
      <xsl:copy-of select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- plain text content -->
  <xsl:template match="planet:excerpt/text()">
    <div class="content" xmlns="http://www.w3.org/1999/xhtml">
      <xsl:if test="../@xml:lang and not(../@xml:lang = ../../@xml:lang)">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="../@xml:lang"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:copy-of select="."/>
    </div>
  </xsl:template>
</xsl:stylesheet>
