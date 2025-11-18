<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:template match="/">
        <html>
            <body>
                <h2>Météo</h2>
                <xsl:for-each select="meteo/mesure[@date='2006-1-1']">
                    <ul>Date mesure: <xsl:value-of select="@date"/></ul>
                    <table border="1" width="500">
                        <tr>
                            <th>Ville</th>
                            <th>temperature</th>
                        </tr>
                        <xsl:for-each select="ville">
                            <tr>
                                <td><xsl:value-of select="@nom"/></td>
                                <td><xsl:value-of select="@temperature"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td>min temperature</td>
                            <td><xsl:value-of select="max(ville/@temperature)"/></td>
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html> 
    </xsl:template>
</xsl:stylesheet>