<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fme="http://www.safe.com/gml/fme" xmlns:gml="http://www.opengis.net/gml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:variable name="image_false" select='"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAA0lBMVEX////37+/GjIytQkLGnJzW1tbOzs69vb21paWlQkK9c3Pv3t739/fOY2PGAADOAAC9EBC1QkLe3t69Y2O1EBC9AAC1OTm9KSnWAAC9SkrGc3P35+fGOTneAADOCAjGEBDnra3nAADOa2veCAi9QkL/9/fGUlLvAADOQkLvOTn3CAjvxsbOSkr3Wlr3Y2P3SkrOUlLWc3Pva2v3e3v3hIT/lJTec3P/nJzWY2P/paX/ra3njIzenJzvzs7/tbXelJTWSkrne3vWa2vOWlrWWlrntbWMrggnAAAAAXRSTlMAQObYZgAAAKdJREFUGBkFwTtOAmEABsD52IXECLE1WmAsaDiElTf3APYmxIZGOwMo+z/WGQAAeHwN2AfiJcn0Zn/fh8OBwc2yVdttG+dWL5OFsZYyTe/j9Xpd3zFatmDXZ36ODE6b3vvcW2vzZ2EwLcc+l9rmNh8R7MpqwuV8QnhOp1LW+WDhqfZaq1J8N4xqqrKKX865NSrhkvzNtIej2CRJJJEvIkkiSZKcAAD4B4/3T/7SmpKgAAAAAElFTkSuQmCC"'/>
	<xsl:variable name="image_true" select='"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAS1BMVEX/AAAxjDExhClClDFSrUpKpUJavVKE1mt71mtSpUpjvVqE1nNrxmOM1nvW99aM1nO13rWUzpRzxmOczozG771rvVJjrUqlzpSt1qXJA2iTAAAAAXRSTlMAQObYZgAAAFtJREFUGFeVyNESQCAUhOGNozhHKhTv/6QYjSkXZvxX+y3wq7C/zLF6FraStsLRuqSuNa23nWSPsz+tRShbHPnwGNCjFWZjqLkNEIuUBjpt+qEw0FJXGVAvf3YA+p0DVDghwoAAAAAASUVORK5CYII="'/>
	<xsl:template match="/">
		<html>
			<head>
				<style type="text/css"> 
					body{font-family:arial, sans-serif;color:#000000;max-width:840px;word-break:break-all;}
					h1{font-size:29px;color:rgba(0,18,76,1);font-family:arial,sans-serif;margin:30px 0px 30px 0px;text-align:center;}
					h2{font-size:20px;color:rgba(0,18,76,1);margin-top:22px;font-family:arial,sans-serif;line-height:10px;text-align:center;}
					h3{font-size:17px;color:rgba(0,18,76,1);font-family:arial,sans-serif;margin-bottom:5px;}
					.danger{background-color:#ffc48c !important;font-weight:600;color:#a94442;}
					.danger>td{background-color:#ffc48c !important;font-weight:600;color:#a94442;}
					td{background-color:#E8E6E8;}
					table.description td{background-color:#ECEBD4;}
					table{font-size:13px;}
					table.logo tr td{background-color:#ffffff;border:none;padding-right:40px;}
					.images{border:1px solid #E8E6E8;background-color:#ffffff;}
					.head{background-color:rgba(0,18,76,1);color:white;}
					.left-column{background-color:rgba(0,18,76,1) !important;color:white !important;width="30%";}
					.right-column{background-color:#E8E6E8 !important;width="70%";}
					.scenario{border: 1px solid rgba(0,18,76,1); width: 800px; margin: 0px; padding: 20px;}
					.rtest{border: 1px solid rgba(0,18,76,1); width: 800px; margin-top: 64px; padding: 0px 20px 20px 20px;}
				</style>
				<title>Rapport de test</title>
			</head>
			<body>
				<table cellspacing="2" cellpadding="5" style="width: 800px;">
					<tr>
						<td style="background-color:#ffffff; width: 80 px;">
							<img src='data:image/png;base64,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'/>
						</td>
						<td style="background-color:#ffffff;">
							<h1>Rapport de test</h1>
						</td>
					</tr>
				</table>
				<div class="scenario">
					<h2>Scénario</h2>
					<table cellspacing="2" cellpadding="5" class="description" style=" width: 100%;">
						<tr>
							<td class="left-column">
								<strong>Nom</strong>
							</td>
							<td class="right-column">
								<xsl:value-of select="gml:FeatureCollection/gml:featureMember/fme:control/fme:scenario"/>
							</td>
						</tr>
						<tr>
							<td class="left-column">
								<strong>Description</strong>
							</td>
							<td class="right-column">
								<xsl:value-of select="gml:FeatureCollection/gml:featureMember/fme:control/fme:description"/>
							</td>
						</tr>
						<tr>
							<td class="left-column">
								<strong>Fichier de scénario</strong>
							</td>
							<td class="right-column">
								<xsl:value-of select="gml:FeatureCollection/gml:featureMember/fme:control/fme:dataset"/>
							</td>
						</tr>
						<tr>
							<td class="left-column">
								<strong>Auteur</strong>
							</td>
							<td class="right-column">
								<xsl:value-of select="gml:FeatureCollection/gml:featureMember/fme:control/fme:author"/>
							</td>
						</tr>
						<tr>
							<td class="left-column">
								<strong>Date du test</strong>
							</td>
							<td class="right-column">
								<xsl:value-of select="concat(substring(gml:FeatureCollection/gml:featureMember/fme:control/fme:date, 4, 2), '/', substring(gml:FeatureCollection/gml:featureMember/fme:control/fme:date, 1, 2), '/', substring(gml:FeatureCollection/gml:featureMember/fme:control/fme:date,7,2),' ',substring(gml:FeatureCollection/gml:featureMember/fme:control/fme:date, 10, 8))"/>
							</td>
						</tr>
						<tr>
							<td class="left-column">
								<strong>FME</strong>
							</td>
							<td class="right-column">
								<xsl:value-of select="gml:FeatureCollection/gml:featureMember/fme:control/fme:fme_path"/>
							</td>
						</tr>
					</table>
				</div>
				<br/>
				<h2>RTest</h2>
				<xsl:for-each select="gml:FeatureCollection/gml:featureMember/fme:rtest">
					<div class="rtest">
						<h2>
							<xsl:value-of select="fme:name"/>
						</h2>
						<h3>Traitements</h3>
						<table cellspacing="2" cellpadding="5">
							<tr>
								<td class="head" width="200">Description</td>
								<td class="head" width="30">Log</td>
								<td class="head" width="140">Traitement</td>
								<td class="head" width="80">Durée</td>
								<td class="head" width="80">PeakMemory</td>
								<td class="head" width="92">CurrentMemory</td>
								<td class="head" width="72">Statut</td>
							</tr>
							<xsl:for-each select="fme:processCollection/fme:process">
								<xsl:variable name='danger'>
									<xsl:choose>
										<xsl:when test="fme:status = 'Failed'">danger</xsl:when>
										<xsl:otherwise>nodanger</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr class="{$danger}">
									<td>
										<xsl:value-of select="fme:description"/>
									</td>
									<td>
										<xsl:element name="a">
											<xsl:attribute name="href">file://<xsl:value-of select="fme:log"/></xsl:attribute>
											<xsl:attribute name="target">_new</xsl:attribute>
											Log
										</xsl:element>
									</td>
									<td>
										<xsl:value-of select="fme:process"/>
									</td>
									<td>
										<xsl:value-of select="fme:duration"/>
									</td>
									<td>
										<xsl:value-of select="fme:peakmemory"/>
									</td>
									<td>
										<xsl:value-of select="fme:currentprocessmemory"/>
									</td>
									<td align="center">
										<xsl:if test="fme:status = 'Failed'">
											<img src="{$image_false}" alt="Echec"/>
										</xsl:if>
										<xsl:if test="fme:status = 'Success'">
											<img src="{$image_true}" alt="Succès"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<h3>Vérifications</h3>
						<table cellspacing="2" cellpadding="5">
							<tr>
								<td class="head" width="220">Description</td>
								<td class="head" width="210">Attendu</td>
								<td class="head" width="210">Observé</td>
								<td class="head" width="72">Statut</td>
							</tr>
							<xsl:for-each select="fme:checkCollection/fme:check">
								<xsl:variable name='danger_verif'>
									<xsl:choose>
										<xsl:when test="fme:success = 'false'">danger</xsl:when>
										<xsl:otherwise>nodanger</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr class="{$danger_verif}">
									<td>
										<xsl:value-of select="fme:description"/>
									</td>
									<td>
										<xsl:value-of select="fme:expected"/>
									</td>
									<td>
										<xsl:value-of select="fme:return"/>
									</td>
									<td align="center">
										<xsl:if test="fme:success = 'false'">
											<img src="{$image_false}" alt="Echec"/>
										</xsl:if>
										<xsl:if test="fme:success = 'true'">
											<img src="{$image_true}" alt="Succès"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
