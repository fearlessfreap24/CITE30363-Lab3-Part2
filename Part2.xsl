<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- xmlns:xsl="http://www.w3.org/1999/XSL/Transform" -->

    <xsl:template match="/">
        <html>
            <head>
                <title>Endangered Species</title>
            </head>
            <body>
                <xsl:apply-templates select="endangered_species/animal" />
                <xsl:apply-templates select="endangered_species/animal/subspecies/name[@language='Latin']" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="endangered_species/animal">
        <p><h1 style="text-align: center;"><xsl:value-of select="name[@language='English']" /></h1></p>
        <table border="1" width="100%">
            <tr>
                <th colspan="2">Subspecies</th>
                <th>Region</th>
                <th>Number Left</th>
                <th>As Of</th>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="endangered_species/animal/subspecies/name[@language='Latin']">
        <xsl:if test="population = 0">
            <xsl:value-of select="." /><br />
        </xsl:if>

</xsl:template>

</xsl:stylesheet>