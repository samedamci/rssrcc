#!/bin/sh

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<opml version=\"1.1\">
<head>
<title>Feeder</title>
</head>
<body>
$(sed 's/#.*//g; /^$/d' "$1" | awk '{print "<outline title="$2,
"text="$2"><outline type=\"rss\" xmlUrl=\""$1 "\"/></outline>"}')
</body>
</opml>
"
