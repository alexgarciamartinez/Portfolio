<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
<html>
    <head>
        <body>
            <xsl:for-each select="institut/cicles/cicle">
                <xsl:sort select="nom"/>
                <ul>
                    <li>
                        <xsl:value-of select="nom">
                    </li>
                    <li>
                        <xsl:value-of select="grau">
                    </li>
                    <li>
                        <xsl:value-of select="anyDecret/@any">
                    </li>
                </ul>
            </xsl:for-each>
        </body>
    </head>
</html>    
</xsl:template>
</xsl:stylesheet>