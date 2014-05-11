<%@ page pageEncoding="UTF-8" %>
<%@ page session="false" import="org.opencms.jsp.*" %>
<%@ page import="org.opencms.file.types.CmsResourceTypeImage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	pageContext.setAttribute("cms", cms);
%>

<fmt:setLocale value="${cms.requestContext.locale}" />
<fmt:bundle basename="${package}.messages">
<cms:template element="frame_above">

	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
	<html>
		<head>
			<c:set var="directorio_padre" value="${cms:vfs(pageContext).requestContext.folderUri}"/>
			<c:set var="titulo_directorio_padre" value="${cms:vfs(pageContext).property[directorio_padre]['Title']}"/>
			<title>${titulo_directorio_padre}: <cms:property name="Title" file="search" /></title>

			<meta name="description" content="<cms:property name="Description" file="search" />" >
			<meta name="keywords" content="<cms:property name="Keywords" file="search" />" >
			<meta http-equiv="Content-Type" content="text/html; charset=${cms.requestContext.encoding}" >
			<meta name="robots" content="index, follow" >
			<meta name="revisit-after" content="7 days" >
			<link rel="shortcut icon" href="<cms:link>/resources/${project.artifactId}/img/favicon.ico</cms:link>" type="image/x-icon" />
	
		</head>
		<body>
				<!-- begin: #page margins -->
				<div id="page_margins">

					<!-- begin: #page -->
					<div id="page">

						<!-- begin: #header -->
				    	<div id="header">

				    		<h1><cms:property name="Title" file="search" /></h1>

							<!-- begin: #topnav -->
			  				<div id="topnav">
	<a class="skip" title="skip link" href="#navigation"><fmt:message key="jsp.topnav.saltar.navegacion"/></a><span class="hideme">.</span>
	<a class="skip" title="skip link" href="#content"><fmt:message key="jsp.topnav.saltar.contenido"/></a><span class="hideme">.</span>
	
			  				</div>
			  				<!-- end: #topnav -->
						</div>
						<!-- end: #header -->

			<c:set var="request_uri">${cms:vfs(pageContext).requestContext.uri}</c:set>
			
						<!-- begin: #main -->
						<div id="main">

							<!-- begin: #col1 -->
							<div id="col1">
								<div id="col1_content" class="clearfix">
									
								</div>
							</div>
						</c:if>


							<!-- begin: #col2 -->
							<div id="col2">
								<div id="col2_content" class="clearfix">

									<!-- include the boxes on the right side -->
									<cms:include file="%(link.weak:/system/modules/com.kw.casarural.base/templates/elements/agregados.jsp)">
										<cms:param name="orientation" value="derecha" />
										<cms:param name="config" value="${config_src}" />
									</cms:include>
								</div>
							</div>
							<!-- end: #col2 -->

						<!-- begin: #col3 -->
						<div id="col3">
							<!-- begin: #breadcrumb -->
		  						<c:if test="${!empty hilo}">
		  							<cms:include file="${hilo}"/>
		  						</c:if>
							<!-- end: #breadcrumb -->
							
							<div id="col3_content" class="clearfix">
							<!-- anchor for accessible link to main content -->
							<a id="content" name="content"></a>
</cms:template>

<cms:template element="body">
	<cms:include element="body" editable="true"/>
</cms:template>

<cms:template element="frame_below">

							</div>
							<!-- IE Column Clearing -->
 							<div id="ie_clearing"></div>
						</div>
						<!-- end: #col3 -->
					</div>
					<!-- begin: #footer -->
					<div id="footer"></div>
					<!-- end: #footer -->
				</div>
				<!-- end: #page -->
		 	</div>
		 	<!-- end: #page margins -->
		</body>
	</html>
</cms:template>
</fmt:bundle>