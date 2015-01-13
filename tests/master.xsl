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

	<xsl:output encoding="{{ site.encoding }}"
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

              <link rel="stylesheet"
                    href="http://blooperz.github.io/base-ui/tests/testdou.css"
                    type="text/css"/>

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
              <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/{{ h5bp.jquery.version }}/jquery.min.js"></script>
              <script>//<![CDATA[
              window.jQuery || document.write('<script type="text/javascript" src="js/vendor/jquery-{{ h5bp.jquery.version }}.min.js"><\/script>')//]]></script>

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
