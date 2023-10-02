<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="ISO-8859-1" omit-xml-declaration="yes" indent="yes" />

    <!-- Raíz -->
    <xsl:template match="/">
        <html lang="es">
            <head>
                <title>Salobike</title>
                <!-- Aquí iría la etiqueta meta añadiendole el atributo "charset", de esta manera: 
                <meta>
                    <xsl:attribute name="charset">
                        ISO-8859-1
                    </xsl:attribute>
                </meta> -->
            </head>

            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>


    <!-- Datos -->
    <xsl:template match="datos">

        <header>
            <h1 style="color: #00E8D0">
                <xsl:value-of select="nombre" />  <!-- value-of (nodo) -->
            </h1>
            <xsl:value-of select="direccion" />
            <br />
            <xsl:value-of select="provincia" />
            <br />
            <xsl:value-of select="telefono" />
            <br />
            <a>
                <xsl:attribute name="href">  <!-- attribute: "href" para que muestre la página web. -->
                    <xsl:value-of select="web" />
                </xsl:attribute>
                <xsl:value-of select="web" />
            </a>
        </header> 
        
    <br/>
    <br/>
    <hr/>
    <br/>
    <h3>BICICLETAS FABRICADAS A PARTIR DEL AÑO 2020</h3>
    </xsl:template>


    <!-- Bicicleta -->
    <xsl:template match="bicicleta">

        <xsl:if test="anio>='2020'">  <!-- if: condición para que muestre las bicicletas cuyo año de fabricación sea 2020 o posterior. -->
            <ul>
                <li><b><xsl:value-of select="marca" /> - <xsl:value-of select="modelo" /></b></li>
                <xsl:text>&#10;</xsl:text>  <!-- text -->
    
                Suspensión "<xsl:value-of select="tipo/@suspension" />"  <!-- value-of (atributo): se mostrará el valor del atributo. -->

                <br />Año: <xsl:value-of select="anio" />  

                <br />Color: <xsl:value-of select="color" />
                <br />Precio <b><xsl:value-of select="precio" /></b>
            </ul>
        </xsl:if>

        <br />
    </xsl:template>


    <!-- Artículos -->
    <xsl:template match="articulos">
        <hr/>
        <br/>
        <h3>ARTÍCULOS DE MENOR A MAYOR TALLA</h3>
        <br/>

        <xsl:for-each select="equipamiento">  <!-- for-each: realiza bucles del bloque equipamiento. -->
            <xsl:sort select="talla" order="descending"/>  <!-- sort: ordena de forma descendente las tallas. -->
                <ul>
                    <li><xsl:value-of select="marca" /> - <xsl:value-of select="descripcion" />: talla <b><xsl:value-of select="talla" /></b></li>
                </ul>
        </xsl:for-each>

        <br/>
        <hr/>
        <br/>
        <h3>STOCK DE CAMBIOS Y MANETAS DE FRENO</h3>
        <br/>
    </xsl:template>

    
    <!-- Repuesto -->
    <xsl:template match="repuesto">

        <xsl:choose>  <!-- choose-when: muestra las piezas que sean cambio y maneta freno. -->
            <xsl:when test="pieza='Cambio'">
                <br/><xsl:value-of select="pieza" />
                "<xsl:value-of select="marca" />"
            - stock: <b><xsl:value-of select="stock" /></b> unidades.
                <br/>
            </xsl:when>

            <xsl:when test="pieza='Maneta freno'">
                <br/><xsl:value-of select="pieza" />
                "<xsl:value-of select="marca" />"
            - stock: <b><xsl:value-of select="stock" /></b> unidades.
                <br/>
            </xsl:when>

            <xsl:otherwise>
            
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

</xsl:stylesheet>