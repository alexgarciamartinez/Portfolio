<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
<xsl:template match="/">
<html>
    <head>
        <title><xsl:value-of select="parc/@nom"/></title>
        <meta charset="UTF-8"/>
        <link rel="stylesheet" type="text/css" href="horariParc.css"/>
    </head>
    <body>
        <header class="capcalera">
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="parc/@logo"/>
                </xsl:attribute>
                <xsl:attribute name="height">
                    50
                </xsl:attribute>
            </xsl:element>
            <span class="nom"><xsl:value-of select="/parc/@nom"/></span>
        </header>
        <header class ="dades">
            Obrim del
            <xsl:value-of select="/parc/dates/dataObertura"/> al
            <xsl:value-of select="/parc/dates/dataTancament"/>
        </header>
        <header class="mes">
            <xsl:value-of select="/parc/horaris/mes[@nom = 'Novembre']/@nom"/>
        </header>
        <section>
            <table>
                <!--<xsl:for-each select="/parc/horaris/mes[@nom = 'Juliol']">-->
                    <tr>                
                        <xsl:for-each select="/parc/horaris/mes[@nom = 'Juliol']/periode/diaSetmana">
                            <th><xsl:value-of select="."/></th>
                        </xsl:for-each>
                    </tr>
                    <xsl:for-each select="parc/horaris/mes[@nom = 'Novembre']/periode">
                        <tr>
                            <xsl:for-each select="diaSetmana">
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="@horaObertura">
                                            <div class="dia">
                                                <xsl:value-of select="@diaMes"/>
                                            </div>
                                            <xsl:value-of select="@horaObertura"/> - <xsl:value-of select="@horaTancament"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:if test="@diaMes">
                                                <p>
                                                    <div class="dia">
                                                        <xsl:value-of select="@diaMes"/>
                                                    </div>
                                                    TANCAT
                                                </p>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                <!--</xsl:for-each>-->
            </table>
        </section>
        <footer class="dades">
            <xsl:value-of select="/parc/adreca"/>      
        </footer>
        <footer class="dades">
            <xsl:value-of select="/parc/ciutat"/> -
            <xsl:value-of select="/parc/pais"/>    
        </footer>
        <footer class="dades">web: 
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="/parc/paginaWeb"/>
                </xsl:attribute>
                <xsl:value-of select="/parc/paginaWeb"/>
            </xsl:element>
        </footer>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>