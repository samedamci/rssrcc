#!/bin/sh

body() {
  sed 's/#.*//g; /^$/d;
  s/http/<outline xmlUrl=http/g;
  s/ "/ \/> "/; s/xmlUrl=/xmlUrl="/g;
  s/ \/>/" type="rss"\/>/g;
  s/" *".*/"/g' "$1" | \
    awk '{print "<outline title="$4, "text="$4">", $1, $2, $3, "</outline>"}'
}

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<opml version=\"1.1\">
<head>
<title>Feeder</title>
</head>
<body>
$(body "$1")
</body>
</ompl>
"
