" xslhelper.vim
" 
" Version 1.1
" 09/2005 by Andrew Savikas (andrews@oreilly.com)
" xslhelper.vim
" 

"==================================
" KEYS         MAKES
"==================================
",an     <xsl:attribute name="">
"        </xsl:attribute>
"
""""""""""""""""""""""""""""""""""""
",as     <xsl:apply-templates select=""/>
"
""""""""""""""""""""""""""""""""""""
",at     <xsl:apply-templates/>        
"
""""""""""""""""""""""""""""""""""""
",cp     <xsl:copy>
"          
"        </xsl:copy>
"
""""""""""""""""""""""""""""""""""""
",co     <xsl:copy-of select="">
"        </xsl:copy>
"      
""""""""""""""""""""""""""""""""""""
",ce     <xsl:choose>
"  
"        </xsl:choose>
"       
""""""""""""""""""""""""""""""""""""
",ch     <xsl:choose>
"          <xsl:when test="">
"          </xsl:when>
"          <xsl:otherwise>
"            
"          </xsl:otherwise>
"        </xsl:choose>
"
""""""""""""""""""""""""""""""""""""
",ct     <xsl:call-template select="">
"        </xsl:call-template>
"
""""""""""""""""""""""""""""""""""""
",en     <xsl:element name="">
"        </xsl:element>
"        
""""""""""""""""""""""""""""""""""""
",fe     <xsl:for-each select="">
"        </xsl:for-each>
"
""""""""""""""""""""""""""""""""""""
",if     <xsl:if test="">
"        </xsl:if>
"
""""""""""""""""""""""""""""""""""""
",msg    <xsl:message>
"          
"        </xsl:message>
"        
""""""""""""""""""""""""""""""""""""
",ow     <xsl:otherwise>
"  
"        </xsl:otherwise>
"
""""""""""""""""""""""""""""""""""""
",sty    <?xml version="1.0"?>
"        <xsl:stylesheet
"        version="1.0"
"        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
"          
"        </xsl:stylesheet>
"
""""""""""""""""""""""""""""""""""""
",te     <xsl:template match=""/>
"
""""""""""""""""""""""""""""""""""""
",tm     <xsl:template match="">
"        </xsl:template>
"       
""""""""""""""""""""""""""""""""""""
",tn     <xsl:template name="">
"        </xsl:template>
"
""""""""""""""""""""""""""""""""""""
",tt     <xsl:text></xsl:text>
"
""""""""""""""""""""""""""""""""""""
",vn     <xsl:variable name="" select=""/>
"
""""""""""""""""""""""""""""""""""""
",vo     <xsl:value-of select=""/>
"
""""""""""""""""""""""""""""""""""""
",wh     <xsl:when test="">
"        </xsl:when>
"
""""""""""""""""""""""""""""""""""""
",wp     <xsl:with-param name="" select=""/>        
"
""""""""""""""""""""""""""""""""""""

imap ,tm <xsl:template match=""><CR></xsl:template><esc>k$hi
imap ,tn <xsl:template name=""><CR></xsl:template><esc>k$hi
imap ,te <xsl:template match=""/><esc>$hhi
imap ,ct <xsl:call-template name=""><CR></xsl:call-template><esc>k$hi
imap ,at <xsl:apply-templates/>
imap ,as <xsl:apply-templates select=""/><esc>hhi
imap ,vn <xsl:variable name="" select=""/><esc>bbbla
imap ,vo <xsl:value-of select=""/><esc>$hhi
imap ,if <xsl:if test=""><CR></xsl:if><esc>k$hi
imap ,wh <xsl:when test=""><CR></xsl:when><esc>k$hi
imap ,ow <xsl:otherwise><CR></xsl:otherwise><esc>ko
imap ,ce <xsl:choose><CR></xsl:choose><esc>ko
imap ,ch ,ce,ow<esc>kO,wh
imap ,fe <xsl:for-each select=""><CR></xsl:for-each><esc>k$hi
imap ,en <xsl:element name=""><CR></xsl:element><esc>k$hi
imap ,an <xsl:attribute name=""><CR></xsl:attribute><esc>k$hi
imap ,wp <xsl:with-param name="" select=""/><esc>bbbla
imap ,tt <xsl:text></xsl:text><esc>bbbba
imap ,cp <xsl:copy><CR></xsl:copy><esc>O
imap ,co <xsl:copy-of select=""><CR></xsl:copy-of><esc>k$hi
imap ,msg <xsl:message><CR></xsl:message><esc>O
imap ,sty <?xml version="1.0"?><CR><xsl:stylesheet<CR>version="1.0"<CR>xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><CR></xsl:stylesheet><esc>O
