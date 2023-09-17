<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
<xsl:template match="/">
<html>
    <head>
        <title>Exercici2</title>
        <meta charset="UTF-8"/>
        <link rel="stylesheet" type="text/css" href="exercici2.css"/>
    </head>
    <body>
        <h1>
            <xsl:value-of select="institut/@nom"/>
        </h1>
        <p>
            Página web:
            <a>
            <xsl:attribute name="href">
            <xsl:value-of select="institut/@web"/>
            </xsl:attribute>
            <xsl:value-of select="institut/@web"/>
            </a>
        </p>
        <h3>
            Cicles
            <xsl:value-of select="institut/@nom"/>
        </h3>
        <table>
            <tr>
                <th>Nom</th>
                <th>Grau</th>
                <th>Any del decret</th>
            </tr>
            <xsl:for-each select="institut/cicles/cicle">
                <tr>
                    <td>
                        <xsl:value-of select="nom"/>
                    </td>
                    <td>
                        <xsl:value-of select="grau"/>
                    </td>
                    <td>
                        <xsl:value-of select="anyDecret/@any"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>