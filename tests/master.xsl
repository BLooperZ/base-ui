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
			  <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
			       Remove this if you use the .htaccess -->
              {% for header in site.data.h5bp.meta.headers %}
                <meta http-equiv="{{ header[0] }}" content="{{header[1] | join: ', ' }}">
              {% endfor %}
              <title>{{ site.github.project_title }}{% if page.title %} – {{ page.title }}{% endif %}</title>
              <meta name="author" content="{{ site.github.owner_name }}">
              <meta name="description" content="{{ site.github.project_tagline }}">
              {% for umeta in site.data.h5bp.meta offset:1 %}
                {% for meta in umeta[1] %}
                  <meta {{ umeta[0] }}="{{ meta[0] }}" content="{{ meta[1] | join: ', ' }}">
                {% endfor %}
              {% endfor %}
			  <!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
			  <link rel="shortcut icon" href="/favicon.ico"/>
			  <link rel="apple-touch-icon" href="/apple-touch-icon.png"/>


			  <!-- CSS : implied media="all" -->
			  <link rel="stylesheet" href="css/style.css?v=2"/>

			  <!-- Uncomment if you are specifically targeting less enabled mobile browsers
			  <link rel="stylesheet" media="handheld" href="css/handheld.css?v=2">  -->

			  <!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
			  <script src="js/libs/modernizr-1.6.min.js"></script>

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


			  <!-- asynchronous google analytics: mathiasbynens.be/notes/async-analytics-snippet
			       change the UA-XXXXX-X to be your site's ID -->
			  <script>
			   <![CDATA[var _gaq = [['_setAccount', 'UA-XXXXX-X'], ['_trackPageview']];
				   (function(d, t) {
				    var g = d.createElement(t),
				        s = d.getElementsByTagName(t)[0];
				    g.async = true;
				    g.src = ('https:' == location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				    s.parentNode.insertBefore(g, s);
				   })(document, 'script');]]>
			  </script>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
