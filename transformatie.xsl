<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <testsuites>
      <xsl:attribute name="name">OWASP ZAP - Active Scan</xsl:attribute>
      <xsl:for-each select="OWASPZAPReport/site/alerts/alertitem">
        <testsuite>
         <xsl:attribute name="hostname">
            <xsl:value-of select="../../@host"/>
         </xsl:attribute>
          <xsl:attribute name="name">
            <xsl:value-of select="name"/>
          </xsl:attribute>
          <xsl:for-each select="instances/instance">
            <testcase>
              <xsl:attribute name="name">
                <xsl:value-of select="uri"/> - <xsl:value-of select="../../riskdesc"/>
              </xsl:attribute>
              <error>
                <xsl:attribute name="message">
                  <xsl:value-of select="param"/>
                </xsl:attribute>
                <xsl:attribute name="type">error</xsl:attribute>
                Method: <xsl:value-of select="method"/>
                Param: <xsl:value-of select="param"/>
                Evidence: <xsl:value-of select="evidence"/>
                Solution: <xsl:value-of select="../../solution"/>
                Other Info: <xsl:value-of select="../../otherinfo"/>
                Reference: <xsl:value-of select="../../reference"/>
              </error>
            <system-out>
                CWE ID: <xsl:value-of select="../../cweid"/>
                WASC ID: <xsl:value-of select="../../wascid"/>
                Source ID: <xsl:value-of select="../../sourceid"/>          
            </system-out>
            <system-err>
            </system-err>
            </testcase>
          </xsl:for-each>
        </testsuite>
      </xsl:for-each>
    </testsuites>
  </xsl:template>
</xsl:stylesheet>

<!--<testsuites disabled="" errors="" failures="" name="" tests="" time="">-->
<!--    <testsuite disabled="" errors="" failures="" hostname="" id=""-->
<!--               name="" package="" skipped="" tests="" time="" timestamp="">-->
<!--        <properties>-->
<!--            <property name="" value=""/>-->
<!--        </properties>-->
<!--        <testcase assertions="" classname="" name="" status="" time="">-->
<!--            <skipped/>-->
<!--            <error message="" type=""/>-->
<!--            <failure message="" type=""/>-->
<!--            <system-out/>-->
<!--            <system-err/>-->
<!--        </testcase>-->
<!--        <system-out/>-->
<!--        <system-err/>-->
<!--    </testsuite>-->
<!--</testsuites>-->