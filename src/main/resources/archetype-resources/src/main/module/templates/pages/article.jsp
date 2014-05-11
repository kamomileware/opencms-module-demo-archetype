<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<cms:template element="frame_above">
	<cms:include property="template" element="frame_above"/>
</cms:template>

<cms:template element="body">

	<c:set var="contentload_uri" value="${cms:vfs(pageContext).requestContext.uri}"/>
	
	<cms:editable mode="auto" />
	<cms:contentload collector="singleFile" param="${contentload_uri}" editable="auto">

	<div class="view-article">

		<!-- Title element -->
		<h2><cms:contentshow element="Title" /></h2>

		<!-- Resume element -->
		<cms:contentcheck ifexists="Resume">
			<div class="principal">

				<cms:contentloop element="Resume/Image">
					<cms:include page="../elements/image_paragraph.jsp" />
				</cms:contentloop>

				<cms:contentshow element="Resume/Body" />
			</div>
		</cms:contentcheck>

		<!-- Paragraphs of the article -->
		<cms:contentloop element="Paragraphs">

			<div class="paragraph">
				<!-- Optional headline of the paragraph -->
				<cms:contentcheck ifexists="Title"><h3><cms:contentshow element="Title" /></h3></cms:contentcheck>

				<!-- Image of the paragraph -->
				<cms:contentloop element="Image">
					<cms:include page="../elements/image_paragraph.jsp" />
				</cms:contentloop>

				<!-- The text content of the paragraph -->
				<cms:contentshow element="Body" />
			</div>
		</cms:contentloop>

	</div>
	</cms:contentload>
</cms:template>

<cms:template element="frame_below">
	<cms:include property="template" element="frame_below"/>
</cms:template>
