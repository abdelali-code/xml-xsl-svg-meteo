<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
            <line x1="100" y1="100" x2="100" y2="600" stroke="blue" stroke-width="3"></line>
            <line x1="100" y1="600" x2="2000" y2="600" stroke="blue" stroke-width="3"></line>
        
            <xsl:for-each select="meteo/mesure['2006-1-1']/ville">
                <xsl:variable name="pos" select="position() * 120"/>
                <xsl:variable name="temp" select="@temperature * 10"/>
                <text stroke="blue" x="{$pos}" y ="620">
                    <xsl:value-of select="@nom"/>
                </text>
                <rect width="20" height="{$temp}" x="{$pos}" y="{600 - $temp}"
                    stroke="blue" fill="{ if (@temperature > 25)
                    then 'red'
                    else 
                        if (@temperature > 20)
                        then 'orange'
                        else 'green'}"
                    >
                    <animate attributeName="height" 
                        dur="3s" 
                        values="0;{$temp};0"
                        repeatCount="indefinite"
                       ></animate>
                    <animate attributeName="y" 
                        dur="3s" 
                        values="600; {600 - $temp};600"
                        repeatCount="indefinite"
                        ></animate>
                </rect>
                <text x="{$pos}" y ="{600 - $temp - 10}">
                    <xsl:value-of select="@temperature"/>
                    <animate attributeName="height" 
                        dur="3s" 
                        values="0;{$temp};0"
                        repeatCount="indefinite"
                        ></animate>
                    <animate attributeName="y"
                        values="600; {600 - $temp - 10};600"
                        repeatCount="indefinite"
                        dur="3s"/>
                </text>
            </xsl:for-each>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>