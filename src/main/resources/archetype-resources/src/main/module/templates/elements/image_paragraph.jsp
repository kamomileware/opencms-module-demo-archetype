<%@ page import="org.opencms.file.*" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="rutaImagen"><cms:contentshow element="Url" /></c:set>
<c:set var="nombreImagen" value="${rutaImagen}" />
<c:if test="${fn:indexOf(rutaImagen, '?') != - 1}">
	<c:set var="nombreImagen" value="${fn:substringBefore(rutaImagen, '?')}" />
</c:if>
<c:set var="dirImagen"><%= CmsResource.getFolderPath((String)pageContext.getAttribute("nombreImagen")) %></c:set>

<div class="imagen_parrafo">
	<c:set var="scaleW" value="w:"/>
	<c:set var="scaleH" value=",h:"/>
	<c:set var="ancho" value="${fn:substringBefore(fn:substringAfter(rutaImagen, scaleW),scaleH)}"/>
	<c:set var="nombreImagen" value="${rutaImagen}" />
	<c:if test="${fn:indexOf(rutaImagen, '?') != - 1}">
		<c:set var="nombreImagen" value="${fn:substringBefore(rutaImagen, '?')}" />
	</c:if>
	<cms:img scaleType="1" width="${ancho}">
		<cms:param name="src">${nombreImagen}</cms:param>
		<cms:param name="alt"><cms:contentshow element="Alt"/></cms:param>
	</cms:img>
</div>
<cms:contentcheck ifexists="Description">
	<div class="description" style="width:${ancho}px">
		<span><cms:contentshow element="Description" /></span>
	</div>
</cms:contentcheck>
