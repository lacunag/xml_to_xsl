<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:decimal-format name="pesos" decimal-separator="," grouping-separator="." />
   <xsl:template match="/">
      <html>
         <xsl:apply-templates />
      </html>
   </xsl:template>
   <xsl:template match="Ejemplo">
      <body>
         <h3 style="font-family: Arial">
            <strong>Datos Usuario</strong>
         </h3>
         <table style="width: 100%;font-size: 12px; font-family: Arial">
            <tr>
               <td width="20%">
                  Nombre:
                  <xsl:value-of select=" Beneficiario/Nombre" />
               </td>
               <td width="20%" colspan="1">
                  Cedula:
                  <xsl:value-of select="substring(Beneficiario/Cedula,1,40)" />
               </td>
            </tr>
            <tr>
               <td>
                  Nacimiento:
                  <xsl:value-of select=" Beneficiario/FecNacimiento" />
               </td>
               <td>
                  Edad:
                  <xsl:value-of select=" Beneficiario/Edad" />
               </td>
               <td>
                  Sexo:
                  <xsl:value-of select=" Beneficiario/Sexo" />
               </td>
            </tr>
         </table>
         <h3 style="font-family: Arial">
            <strong>Servicios</strong>
         </h3>
         <table style="width:100%;font-size: 12px; font-family: Arial">
            <tr>
			   <td width="20%" align="left"><strong>Descripcion</strong></td>
               <td width="20%" align="left"><strong>Servicios</strong></td>
               <td width="20%" align="left"><strong>Descuentos</strong></td>
               <td width="20%" align="left"><strong>Otros Gastos</strong></td>
            </tr>
            <xsl:for-each select="Servicios/Servicio">
               <tr>
			   
			   
	              <td align="left">
                     <xsl:value-of select="Descripcion"/>
                  </td>
                  <td align="left">
                     $
                     <xsl:value-of select="format-number(Monto, '#.###', 'pesos')" />
                  </td>
                  <td align="left">
                     $
                     <xsl:value-of select="format-number(Descuento, '#.###', 'pesos')" />
                  </td>
                  <td align="left">
                     $
                     <xsl:value-of select="format-number(Otro, '#.###', 'pesos')" />
                  </td>
               </tr>
            </xsl:for-each>
            <tr>
               <td colspan="10">
                  <hr style="border-top: 1px dashed #8c8b8b;" />
               </td>
            </tr>
            <tr>
			   <td align="left">
					<strong>TOTALES</strong>
			   </td>
               <td align="left">
                  $
                  <xsl:value-of select="format-number(sum(//Servicios/Servicio/Monto), '#.###', 'pesos')" />
               </td>
               <td align="left">
                  $
                  <xsl:value-of select="format-number(sum(//Servicios/Servicio/Descuento), '#.###', 'pesos')" />
               </td>
               <td align="left">
                  $
                  <xsl:value-of select="format-number(sum(//Servicios/Servicio/Otro), '#.###', 'pesos')" />
               </td>
            </tr>
            <tr>
               <td colspan="10">
                  <hr style="border-top: 1px dashed #8c8b8b;" />
               </td>
            </tr>
         </table>
      </body>
   </xsl:template>
</xsl:stylesheet>