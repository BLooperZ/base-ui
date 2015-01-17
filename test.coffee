---

---

      ((b,o,i,l)->
        b.GoogleAnalyticsObject=l
        (b[l]=b[l]or->
          (b[l].q=b[l].q or []).push arguments
          return).l=+new Date
        o.getElementsByTagName(i)[0].parentNode.appendChild(o.createElement(i)).src = "//www.google-analytics.com/analytics.js"
        return) window,document,"script","ga"
      ga "create","UA-XXXXX-X","auto"
      ga "send","pageview"
