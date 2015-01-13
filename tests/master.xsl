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
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output encoding="{{ site.encoding }}"
				indent="yes"
				method="html"
				media-type="text/html"
				omit-xml-declaration="yes"
				doctype-system="about:legacy-compat"/>

	<xsl:template match="/">
		<html lang="en" class="no-js">

			<head>
              {% for header in site.data.h5bp.meta.headers %}
              <meta http-equiv="{{ header[0] }}" content="{{header[1] | join: ', ' }}"/>
              {% endfor %}
              <title>{{ site.github.project_title }}{% if page.title %} – {{ page.title }}{% endif %}</title>
              <meta name="author" content="{{ site.github.owner_name }}"/>
              <meta name="description" content="{{ site.github.project_tagline }}"/>
              {% for umeta in site.data.h5bp.meta offset:1 %}
              {% for meta in umeta[1] %}
              <meta {{ umeta[0] }}="{{ meta[0] }}" content="{{ meta[1] | join: ', ' }}"/>
              {% endfor %}
              {% endfor %}


			</head>

			<body>

			  <div id="container">
			    <header>

			    </header>

			    <div id="main">

			    </div>

			    <footer>

			    </footer>
			  </div> <!--! end of #container -->

			<!-- Javascript at the bottom for fast page loading -->

			  <!-- Grab Google CDN's jQuery. fall back to local if necessary -->
			  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.js"></script>
			  <script><![CDATA[!window.jQuery && document.write(unescape('%3Cscript src="js/libs/jquery-1.4.2.js"%3E%3C/script%3E'))]]></script>


			  <!-- scripts concatenated and minified via ant build script-->
			  <script src="js/plugins.js"></script>
			  <script src="js/script.js"></script>
			  <!-- end concatenated and minified scripts-->


			  <xsl:comment><![CDATA[[if lt IE 7]>
			    <script src="js/libs/dd_belatedpng.js"></script>
			    <script> DD_belatedPNG.fix('img, .png_bg'); //fix any <img> or .png_bg background-images </script>
			  <![endif]]]></xsl:comment>

			  <!-- yui profiler and profileviewer - remove for production -->
			  <script src="js/profiling/yahoo-profiling.min.js"></script>
			  <script src="js/profiling/config.js"></script>
			  <!-- end profiling code -->


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
