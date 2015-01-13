---
---
<?xml version="1.0" encoding="{{ site.encoding }}" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom"
                xmlns:xhtml="http://www.w3.org/1999/xhtml">

	<xsl:output encoding="{{ site.encoding }}"
				indent="yes"
				method="xml"
				media-type="application/xhtml+xml"
				omit-xml-declaration="yes"/>

	<xsl:template match="/">
		<html lang="en" class="no-js">
			<head>
              {% for header in site.data.h5bp.meta.headers %}
              <meta http-equiv="{{ header[0] }}" content="{{header[1] | join: ', ' }}"/>
              {% endfor %}
              <title><xsl:value-of select="title"/></title>
              <meta name="author" content="{author/name}"/>
              <meta name="description" content="{subtitle}"/>

              <xsl:if test="generator">
                <meta name="generator" content="{generator}"/>
              </xsl:if>

              <xsl:if test="link[@rel='self']">
                <link rel="alternate" href="{link[@rel='self']/@href}"
                      title="{atom:title}" type="{link[@rel='self']/@type}"/>
              </xsl:if>

              <link rel="stylesheet"
                    href="/base-ui/tests/testdou.css"
                    type="text/css"/>

			</head>

			<body>

              <xsl:text>&#10;</xsl:text>
              <h1><xsl:value-of select="atom:title"/></h1>


              <xsl:for-each select="atom:entry">
                <xsl:text>whahaahahah</xsl:text>
              </xsl:for-each>
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
			  <script type="text/javascript">//<![CDATA[
			   (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', '{{ site.google_analytics }}', 'auto');
        ga('send', 'pageview');//]]>
			  </script>
              {% endif %}

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
