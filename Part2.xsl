<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Endangered Species</title>
            </head>
            <body>
                <xsl:apply-templates select="endangered_species/animal" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="endangered_species/animal">
        <!-- VVVV variable for total population for animal VVVV -->
        <xsl:variable name="wholePop"><xsl:value-of select="sum(subspecies/population)" /></xsl:variable>

        <p><h1 style="text-align: center;"><xsl:value-of select="name[@language='English']" /></h1></p>
        <table border="1" width="100%">
            <!-- first row of table -->
            <tr>
                <th colspan="2">Subspecies</th>
                <th>Region</th>
                <th>Population</th>
                <th>% of Species</th>
                <th>Year</th>
            </tr>
            <xsl:for-each select="subspecies">
                <xsl:sort select="population" data-type="number"/>
                <xsl:if test="population > 0">
                    <tr>
                        <td><xsl:value-of select="name[@language='English']" /></td>
                        <td><xsl:value-of select="name[@language='Latin']" /></td>
                        <td><xsl:value-of select="region" /></td>
                        <td><xsl:value-of select="population" /></td>
                        <!-- VVVV prints a zero if there is not a whole number and truncates to 2 decimal places VVVV -->
                        <td><xsl:value-of select="format-number((population div $wholePop * 100), '0.##')" />%</td>
                        <td><xsl:value-of select="population/@year" /></td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            <!-- last row of tableß -->
            <tr>
                <td style="text-align: right;">Total:</td>
                <td><xsl:value-of select="count(subspecies)" /></td>
                <td></td>
                <td><xsl:value-of select="$wholePop" /></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>